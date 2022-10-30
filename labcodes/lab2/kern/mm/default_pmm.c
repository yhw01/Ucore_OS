#include <pmm.h>
#include <list.h>
#include <string.h>
#include <default_pmm.h>

/*  In the First Fit algorithm, the allocator keeps a list of free blocks
 * (known as the free list). Once receiving a allocation request for memory,
 * it scans along the list for the first block that is large enough to satisfy
 * the request. If the chosen block is significantly larger than requested, it
 * is usually splitted, and the remainder will be added into the list as
 * another free block.
 *  Please refer to Page 196~198, Section 8.2 of Yan Wei Min's Chinese book
 * "Data Structure -- C programming language".
*/
// LAB2 EXERCISE 1: YOUR CODE
// you should rewrite functions: `default_init`, `default_init_memmap`,
// `default_alloc_pages`, `default_free_pages`.
/*
 * Details of FFMA
 * (1) Preparation:
 *  In order to implement the First-Fit Memory Allocation (FFMA), we should
 * manage the free memory blocks using a list. The struct `free_area_t` is used
 * for the management of free memory blocks.
 *  First, you should get familiar with the struct `list` in list.h. Struct
 * `list` is a simple doubly linked list implementation. You should know how to
 * USE `list_init`, `list_add`(`list_add_after`), `list_add_before`, `list_del`,
 * `list_next`, `list_prev`.
 *  There's a tricky method that is to transform a general `list` struct to a
 * special struct (such as struct `page`), using the following MACROs: `le2page`
 * (in memlayout.h), (and in future labs: `le2vma` (in vmm.h), `le2proc` (in
 * proc.h), etc).
 * (2) `default_init`:
 *  You can reuse the demo `default_init` function to initialize the `free_list`
 * and set `nr_free` to 0. `free_list` is used to record the free memory blocks.
 * `nr_free` is the total number of the free memory blocks.
 * (3) `default_init_memmap`:
 *  CALL GRAPH: `kern_init` --> `pmm_init` --> `page_init` --> `init_memmap` -->
 * `pmm_manager` --> `init_memmap`.
 *  This function is used to initialize a free block (with parameter `addr_base`,
 * `page_number`). In order to initialize a free block, firstly, you should
 * initialize each page (defined in memlayout.h) in this free block. This
 * procedure includes:
 *  - Setting the bit `PG_property` of `p->flags`, which means this page is
 * valid. P.S. In function `pmm_init` (in pmm.c), the bit `PG_reserved` of
 * `p->flags` is already set.
 *  - If this page is free and is not the first page of a free block,
 * `p->property` should be set to 0.
 *  - If this page is free and is the first page of a free block, `p->property`
 * should be set to be the total number of pages in the block.
 *  - `p->ref` should be 0, because now `p` is free and has no reference.
 *  After that, We can use `p->page_link` to link this page into `free_list`.
 * (e.g.: `list_add_before(&free_list, &(p->page_link));` )
 *  Finally, we should update the sum of the free memory blocks: `nr_free += n`.
 * (4) `default_alloc_pages`:
 *  Search for the first free block (block size >= n) in the free list and reszie
 * the block found, returning the address of this block as the address required by
 * `malloc`.
 *  (4.1)
 *      So you should search the free list like this:
 *          list_entry_t le = &free_list;
 *          while((le=list_next(le)) != &free_list) {
 *          ...
 *      (4.1.1)
 *          In the while loop, get the struct `page` and check if `p->property`
 *      (recording the num of free pages in this block) >= n.
 *              struct Page *p = le2page(le, page_link);
 *              if(p->property >= n){ ...
 *      (4.1.2)
 *          If we find this `p`, it means we've found a free block with its size
 *      >= n, whose first `n` pages can be malloced. Some flag bits of this page
 *      should be set as the following: `PG_reserved = 1`, `PG_property = 0`.
 *      Then, unlink the pages from `free_list`.
 *          (4.1.2.1)
 *              If `p->property > n`, we should re-calculate number of the rest
 *          pages of this free block. (e.g.: `le2page(le,page_link))->property
 *          = p->property - n;`)
 *          (4.1.3)
 *              Re-caluclate `nr_free` (number of the the rest of all free block).
 *          (4.1.4)
 *              return `p`.
 *      (4.2)
 *          If we can not find a free block with its size >=n, then return NULL.
 * (5) `default_free_pages`:
 *  re-link the pages into the free list, and may merge small free blocks into
 * the big ones.
 *  (5.1)
 *      According to the base address of the withdrawed blocks, search the free
 *  list for its correct position (with address from low to high), and insert
 *  the pages. (May use `list_next`, `le2page`, `list_add_before`)
 *  (5.2)
 *      Reset the fields of the pages, such as `p->ref` and `p->flags` (PageProperty)
 *  (5.3)
 *      Try to merge blocks at lower or higher addresses. Notice: This should
 *  change some pages' `p->property` correctly.
 */
free_area_t free_area;

#define free_list (free_area.free_list)
#define nr_free (free_area.nr_free)

static void
default_init(void) {
    // 初始化链表
    list_init(&free_list);
    // 将可用内存块数目设置为0
    nr_free = 0;
}

// 根据每个物理页帧的情况来建立空闲页链表，且空闲页块应该是根据地址高低形成一个有序链表
// 参数：base->某个连续地址的空闲块的起始页；n->页个数
static void
default_init_memmap(struct Page *base, size_t n) {
    // kern_init->pmm_init->page_init->init_memmap->pmm_manager->init_memmap
    // 判断n是否大于0
    assert(n > 0);
    // 令p为连续地址的空闲块起始页
    struct Page *p = base;
    // 将这个空闲块的每个页面初始化
    for (; p != base + n; p ++) {
        // 检查p的PG_reserved位是否设置为1，表示空闲可分配
        assert(PageReserved(p));
        // 设置flag为0，表示该页空闲
        p->flags = p->property = 0;
        // 将该页的ref设为0，表示该页空闲，没有引用
        set_page_ref(p, 0);
    }
    // 空闲块的第一页的连续空页值property设置为块中的总页数
    base->property = n;
    // 将空闲块的第一页的PG_property位设置为1，表示是起始页，可以用于分配内存
    SetPageProperty(base);
    // 将空闲页的数目加n
    nr_free += n;
    // 将base->page_link此页链接到free_list中
    list_add(&free_list, &(base->page_link));
}

// firstfit从空闲链表头开始查找最小的地址->通过list_next找到下一个空闲块元素->通过le2page宏由链表元素获得对应的Page指针p
// ->通过p->peroperty了解此空闲块的大小，如果大于等于n，则找到，重新组织块，吧找到的page返回；否则继续查找->直到list_next==&free_list，表示找完一遍
static struct Page *
default_alloc_pages(size_t n) {
    // n要大于0
    assert(n > 0);
    // 考虑边界情况，当n大于可以分配的内存数时，直接返回，确保分配不会超出范围，保证软件的鲁棒性
    if (n > nr_free) {
        return NULL;
    }
    struct Page *page = NULL;
    // 指针le指向空闲链表头，开始查找最小的地址
    list_entry_t *le = &free_list;
    while ((le = list_next(le)) != &free_list) {
        // 由链表元素获得对应的Page指针p
        struct Page *p = le2page(le, page_link);
        // 如果当前页面的property大于等于n，说明空闲块的连续空页数大于等于n，可以分配，令page=p，直接退出
        if (p->property >= n) {
            page = p;
            break;
        }
    }
    // 如果找到了空闲块，进行重新组织，否则直接返回NULL
    if (page != NULL) {
        // 在空闲页链表中删除刚刚分配的空闲块
        list_del(&(page->page_link));
        // 如果可以分配的空闲块的连续空页数大于n
        if (page->property > n) {
            // 创建一个地址为page+n的新物理页
            struct Page *p = page + n;
            // 页面的property设置为page多出来的空闲连续页数
            p->property = page->property - n;
            // 设置p的Page_property位，表示为新的空闲块的起始页
            SetPageProperty(p);
            // 将新的空闲块的页插入到空闲链表的后面
            list_add_after(&(page->page_link), &(p->page_link));
    }
        list_del(&(page->page_link));
        // 剩余空闲页的数目减n
        nr_free -= n;
        // 清除page的Page_property位，表示page已经被分配
        ClearPageProperty(page);
    }
    return page;
}

// default_alloc_pages的逆过程，但是需要考虑空闲块的合并问题。
// 将页面重新链接到空闲列表中，可以将小的空闲块合并到大的空闲块中。
static void
default_free_pages(struct Page *base, size_t n) {
    // n要大于0
    assert(n > 0);
    // 令p为连续地址的释放块的起始页
    struct Page *p = base;
    // 将这个释放块的每个页面初始化
    for (; p != base + n; p ++) {
        // 检查每一页的Page_reserved位和Pager_property位是否都未被设置
        assert(!PageReserved(p) && !PageProperty(p));
        // 设置每一页的flags都为0，表示可以分配
        p->flags = 0;
        // 设置每一页的ref都为0，表示这页空闲
        set_page_ref(p, 0);
    }
    // 释放块起始页的property连续空页数设置为n
    base->property = n;
    // 设置起始页的Page_property位
    SetPageProperty(base);
    // 指针le指向空闲链表头，开始查找最小的地址
    list_entry_t *le = list_next(&free_list);
    // 遍历空闲链表，查看能否将释放块合并到合适的页块中
    while (le != &free_list) {
        // 由链表元素获得对应Page指针p
        p = le2page(le, page_link);
        le = list_next(le);
        // 如果释放块在下一个空闲块起始页的前面，那么进行合并
        if (base + base->property == p) {
            // 释放块的连续空页数要加上空闲块起始页p的连续空页数
            base->property += p->property;
            // 清除p的Page_property位，表示p不再是新的空闲块的起始页
            ClearPageProperty(p);
            // 将原来的空闲块删除
            list_del(&(p->page_link));
        }
        // 如果释放块的起始页在上一个空闲块的后面，那么进行合并
        else if (p + p->property == base) {
            // 空闲块的连续空页数要加上释放块起始页base的连续空页数
            p->property += base->property;
            // 清除base的Page_property位，表示base不再是起始页
            ClearPageProperty(base);
            // 新的空闲块的起始页变成p
            base = p;
            // 将原来的空闲块删除
            list_del(&(p->page_link));
        }
    }
    // 将空闲页的数目加n
    nr_free += n;
    le = list_next(&free_list);
    // 遍历空闲链表，将合并好之后的页块加回空闲链表
    while (le != &free_list) {
        // 由链表元素获得对应的Page指针p
        p = le2page(le, page_link);
        // 找到能够新城新的合并块的位置
        if (base + base->property <= p) {
            assert(base + base->property != p);
            break;
        }
        le = list_next(le);
    }
    // 将base->page_link此页链接到le中，插入到合适位置
    list_add_before(le, &(base->page_link));
}

static size_t
default_nr_free_pages(void) {
    return nr_free;
}

static void
basic_check(void) {
    struct Page *p0, *p1, *p2;
    p0 = p1 = p2 = NULL;
    assert((p0 = alloc_page()) != NULL);
    assert((p1 = alloc_page()) != NULL);
    assert((p2 = alloc_page()) != NULL);

    assert(p0 != p1 && p0 != p2 && p1 != p2);
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);

    assert(page2pa(p0) < npage * PGSIZE);
    assert(page2pa(p1) < npage * PGSIZE);
    assert(page2pa(p2) < npage * PGSIZE);

    list_entry_t free_list_store = free_list;
    list_init(&free_list);
    assert(list_empty(&free_list));

    unsigned int nr_free_store = nr_free;
    nr_free = 0;

    assert(alloc_page() == NULL);

    free_page(p0);
    free_page(p1);
    free_page(p2);
    assert(nr_free == 3);

    assert((p0 = alloc_page()) != NULL);
    assert((p1 = alloc_page()) != NULL);
    assert((p2 = alloc_page()) != NULL);

    assert(alloc_page() == NULL);

    free_page(p0);
    assert(!list_empty(&free_list));

    struct Page *p;
    assert((p = alloc_page()) == p0);
    assert(alloc_page() == NULL);

    assert(nr_free == 0);
    free_list = free_list_store;
    nr_free = nr_free_store;

    free_page(p);
    free_page(p1);
    free_page(p2);
}

// LAB2: below code is used to check the first fit allocation algorithm (your EXERCISE 1) 
// NOTICE: You SHOULD NOT CHANGE basic_check, default_check functions!
static void
default_check(void) {
    int count = 0, total = 0;
    list_entry_t *le = &free_list;
    while ((le = list_next(le)) != &free_list) {
        struct Page *p = le2page(le, page_link);
        assert(PageProperty(p));
        count ++, total += p->property;
    }
    assert(total == nr_free_pages());

    basic_check();

    struct Page *p0 = alloc_pages(5), *p1, *p2;
    assert(p0 != NULL);
    assert(!PageProperty(p0));

    list_entry_t free_list_store = free_list;
    list_init(&free_list);
    assert(list_empty(&free_list));
    assert(alloc_page() == NULL);

    unsigned int nr_free_store = nr_free;
    nr_free = 0;

    free_pages(p0 + 2, 3);
    assert(alloc_pages(4) == NULL);
    assert(PageProperty(p0 + 2) && p0[2].property == 3);
    assert((p1 = alloc_pages(3)) != NULL);
    assert(alloc_page() == NULL);
    assert(p0 + 2 == p1);

    p2 = p0 + 1;
    free_page(p0);
    free_pages(p1, 3);
    assert(PageProperty(p0) && p0->property == 1);
    assert(PageProperty(p1) && p1->property == 3);

    assert((p0 = alloc_page()) == p2 - 1);
    free_page(p0);
    assert((p0 = alloc_pages(2)) == p2 + 1);

    free_pages(p0, 2);
    free_page(p2);

    assert((p0 = alloc_pages(5)) != NULL);
    assert(alloc_page() == NULL);

    assert(nr_free == 0);
    nr_free = nr_free_store;

    free_list = free_list_store;
    free_pages(p0, 5);

    le = &free_list;
    while ((le = list_next(le)) != &free_list) {
        assert(le->next->prev == le && le->prev->next == le);
        struct Page *p = le2page(le, page_link);
        count --, total -= p->property;
    }
    assert(count == 0);
    assert(total == 0);
}

const struct pmm_manager default_pmm_manager = {
    .name = "default_pmm_manager",
    .init = default_init,
    .init_memmap = default_init_memmap,
    .alloc_pages = default_alloc_pages,
    .free_pages = default_free_pages,
    .nr_free_pages = default_nr_free_pages,
    .check = default_check,
};

