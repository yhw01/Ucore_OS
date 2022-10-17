
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
static void lab1_switch_test(void);

static void lab1_print_cur_status(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba a0 fd 10 00       	mov    $0x10fda0,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 5b 2f 00 00       	call   102f87 <memset>

    cons_init();                // init the console
  10002c:	e8 46 15 00 00       	call   101577 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 a0 37 10 00 	movl   $0x1037a0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 bc 37 10 00 	movl   $0x1037bc,(%esp)
  100046:	e8 21 02 00 00       	call   10026c <cprintf>

    print_kerninfo();
  10004b:	e8 c2 08 00 00       	call   100912 <print_kerninfo>

    grade_backtrace();
  100050:	e8 8e 00 00 00       	call   1000e3 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 02 2c 00 00       	call   102c5c <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 56 16 00 00       	call   1016b5 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 af 17 00 00       	call   101813 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 ff 0c 00 00       	call   100d68 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 7a 17 00 00       	call   1017e8 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 6b 01 00 00       	call   1001de <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 bf 0c 00 00       	call   100d56 <mon_backtrace>
}
  100097:	90                   	nop
  100098:	c9                   	leave  
  100099:	c3                   	ret    

0010009a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009a:	55                   	push   %ebp
  10009b:	89 e5                	mov    %esp,%ebp
  10009d:	53                   	push   %ebx
  10009e:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a1:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a7:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ad:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b9:	89 04 24             	mov    %eax,(%esp)
  1000bc:	e8 b4 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c1:	90                   	nop
  1000c2:	83 c4 14             	add    $0x14,%esp
  1000c5:	5b                   	pop    %ebx
  1000c6:	5d                   	pop    %ebp
  1000c7:	c3                   	ret    

001000c8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c8:	55                   	push   %ebp
  1000c9:	89 e5                	mov    %esp,%ebp
  1000cb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 ba ff ff ff       	call   10009a <grade_backtrace1>
}
  1000e0:	90                   	nop
  1000e1:	c9                   	leave  
  1000e2:	c3                   	ret    

001000e3 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e3:	55                   	push   %ebp
  1000e4:	89 e5                	mov    %esp,%ebp
  1000e6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e9:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ee:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f5:	ff 
  1000f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100101:	e8 c2 ff ff ff       	call   1000c8 <grade_backtrace0>
}
  100106:	90                   	nop
  100107:	c9                   	leave  
  100108:	c3                   	ret    

00100109 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100109:	55                   	push   %ebp
  10010a:	89 e5                	mov    %esp,%ebp
  10010c:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010f:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100112:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100115:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100118:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	83 e0 03             	and    $0x3,%eax
  100122:	89 c2                	mov    %eax,%edx
  100124:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100129:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100131:	c7 04 24 c1 37 10 00 	movl   $0x1037c1,(%esp)
  100138:	e8 2f 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100141:	89 c2                	mov    %eax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 cf 37 10 00 	movl   $0x1037cf,(%esp)
  100157:	e8 10 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	89 c2                	mov    %eax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016f:	c7 04 24 dd 37 10 00 	movl   $0x1037dd,(%esp)
  100176:	e8 f1 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017f:	89 c2                	mov    %eax,%edx
  100181:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100186:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018e:	c7 04 24 eb 37 10 00 	movl   $0x1037eb,(%esp)
  100195:	e8 d2 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019a:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019e:	89 c2                	mov    %eax,%edx
  1001a0:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 f9 37 10 00 	movl   $0x1037f9,(%esp)
  1001b4:	e8 b3 00 00 00       	call   10026c <cprintf>
    round ++;
  1001b9:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001be:	40                   	inc    %eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	90                   	nop
  1001c5:	c9                   	leave  
  1001c6:	c3                   	ret    

001001c7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c7:	55                   	push   %ebp
  1001c8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    asm volatile (
  1001ca:	83 ec 08             	sub    $0x8,%esp
  1001cd:	cd 78                	int    $0x78
  1001cf:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001d1:	90                   	nop
  1001d2:	5d                   	pop    %ebp
  1001d3:	c3                   	ret    

001001d4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d4:	55                   	push   %ebp
  1001d5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile (
  1001d7:	cd 79                	int    $0x79
  1001d9:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001db:	90                   	nop
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    

001001de <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e4:	e8 20 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e9:	c7 04 24 08 38 10 00 	movl   $0x103808,(%esp)
  1001f0:	e8 77 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_user();
  1001f5:	e8 cd ff ff ff       	call   1001c7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fa:	e8 0a ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ff:	c7 04 24 28 38 10 00 	movl   $0x103828,(%esp)
  100206:	e8 61 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_kernel();
  10020b:	e8 c4 ff ff ff       	call   1001d4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100210:	e8 f4 fe ff ff       	call   100109 <lab1_print_cur_status>
}
  100215:	90                   	nop
  100216:	c9                   	leave  
  100217:	c3                   	ret    

00100218 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100218:	55                   	push   %ebp
  100219:	89 e5                	mov    %esp,%ebp
  10021b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10021e:	8b 45 08             	mov    0x8(%ebp),%eax
  100221:	89 04 24             	mov    %eax,(%esp)
  100224:	e8 7b 13 00 00       	call   1015a4 <cons_putc>
    (*cnt) ++;
  100229:	8b 45 0c             	mov    0xc(%ebp),%eax
  10022c:	8b 00                	mov    (%eax),%eax
  10022e:	8d 50 01             	lea    0x1(%eax),%edx
  100231:	8b 45 0c             	mov    0xc(%ebp),%eax
  100234:	89 10                	mov    %edx,(%eax)
}
  100236:	90                   	nop
  100237:	c9                   	leave  
  100238:	c3                   	ret    

00100239 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100239:	55                   	push   %ebp
  10023a:	89 e5                	mov    %esp,%ebp
  10023c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10023f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100246:	8b 45 0c             	mov    0xc(%ebp),%eax
  100249:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10024d:	8b 45 08             	mov    0x8(%ebp),%eax
  100250:	89 44 24 08          	mov    %eax,0x8(%esp)
  100254:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100257:	89 44 24 04          	mov    %eax,0x4(%esp)
  10025b:	c7 04 24 18 02 10 00 	movl   $0x100218,(%esp)
  100262:	e8 73 30 00 00       	call   1032da <vprintfmt>
    return cnt;
  100267:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10026a:	c9                   	leave  
  10026b:	c3                   	ret    

0010026c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10026c:	55                   	push   %ebp
  10026d:	89 e5                	mov    %esp,%ebp
  10026f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100272:	8d 45 0c             	lea    0xc(%ebp),%eax
  100275:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100278:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10027f:	8b 45 08             	mov    0x8(%ebp),%eax
  100282:	89 04 24             	mov    %eax,(%esp)
  100285:	e8 af ff ff ff       	call   100239 <vcprintf>
  10028a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10028d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100290:	c9                   	leave  
  100291:	c3                   	ret    

00100292 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100292:	55                   	push   %ebp
  100293:	89 e5                	mov    %esp,%ebp
  100295:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100298:	8b 45 08             	mov    0x8(%ebp),%eax
  10029b:	89 04 24             	mov    %eax,(%esp)
  10029e:	e8 01 13 00 00       	call   1015a4 <cons_putc>
}
  1002a3:	90                   	nop
  1002a4:	c9                   	leave  
  1002a5:	c3                   	ret    

001002a6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002a6:	55                   	push   %ebp
  1002a7:	89 e5                	mov    %esp,%ebp
  1002a9:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002b3:	eb 13                	jmp    1002c8 <cputs+0x22>
        cputch(c, &cnt);
  1002b5:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002b9:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002bc:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002c0:	89 04 24             	mov    %eax,(%esp)
  1002c3:	e8 50 ff ff ff       	call   100218 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  1002c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002cb:	8d 50 01             	lea    0x1(%eax),%edx
  1002ce:	89 55 08             	mov    %edx,0x8(%ebp)
  1002d1:	0f b6 00             	movzbl (%eax),%eax
  1002d4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002d7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002db:	75 d8                	jne    1002b5 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002dd:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002eb:	e8 28 ff ff ff       	call   100218 <cputch>
    return cnt;
  1002f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002f3:	c9                   	leave  
  1002f4:	c3                   	ret    

001002f5 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002f5:	55                   	push   %ebp
  1002f6:	89 e5                	mov    %esp,%ebp
  1002f8:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002fb:	e8 ce 12 00 00       	call   1015ce <cons_getc>
  100300:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100303:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100307:	74 f2                	je     1002fb <getchar+0x6>
        /* do nothing */;
    return c;
  100309:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030c:	c9                   	leave  
  10030d:	c3                   	ret    

0010030e <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10030e:	55                   	push   %ebp
  10030f:	89 e5                	mov    %esp,%ebp
  100311:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100314:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100318:	74 13                	je     10032d <readline+0x1f>
        cprintf("%s", prompt);
  10031a:	8b 45 08             	mov    0x8(%ebp),%eax
  10031d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100321:	c7 04 24 47 38 10 00 	movl   $0x103847,(%esp)
  100328:	e8 3f ff ff ff       	call   10026c <cprintf>
    }
    int i = 0, c;
  10032d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100334:	e8 bc ff ff ff       	call   1002f5 <getchar>
  100339:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10033c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100340:	79 07                	jns    100349 <readline+0x3b>
            return NULL;
  100342:	b8 00 00 00 00       	mov    $0x0,%eax
  100347:	eb 78                	jmp    1003c1 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100349:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10034d:	7e 28                	jle    100377 <readline+0x69>
  10034f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100356:	7f 1f                	jg     100377 <readline+0x69>
            cputchar(c);
  100358:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10035b:	89 04 24             	mov    %eax,(%esp)
  10035e:	e8 2f ff ff ff       	call   100292 <cputchar>
            buf[i ++] = c;
  100363:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100366:	8d 50 01             	lea    0x1(%eax),%edx
  100369:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10036c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10036f:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100375:	eb 45                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100377:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10037b:	75 16                	jne    100393 <readline+0x85>
  10037d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100381:	7e 10                	jle    100393 <readline+0x85>
            cputchar(c);
  100383:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100386:	89 04 24             	mov    %eax,(%esp)
  100389:	e8 04 ff ff ff       	call   100292 <cputchar>
            i --;
  10038e:	ff 4d f4             	decl   -0xc(%ebp)
  100391:	eb 29                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100393:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100397:	74 06                	je     10039f <readline+0x91>
  100399:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10039d:	75 95                	jne    100334 <readline+0x26>
            cputchar(c);
  10039f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003a2:	89 04 24             	mov    %eax,(%esp)
  1003a5:	e8 e8 fe ff ff       	call   100292 <cputchar>
            buf[i] = '\0';
  1003aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ad:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003b2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003b5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003ba:	eb 05                	jmp    1003c1 <readline+0xb3>
        }
    }
  1003bc:	e9 73 ff ff ff       	jmp    100334 <readline+0x26>
}
  1003c1:	c9                   	leave  
  1003c2:	c3                   	ret    

001003c3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003c3:	55                   	push   %ebp
  1003c4:	89 e5                	mov    %esp,%ebp
  1003c6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003c9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ce:	85 c0                	test   %eax,%eax
  1003d0:	75 5b                	jne    10042d <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003d2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003d9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003dc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003e5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f0:	c7 04 24 4a 38 10 00 	movl   $0x10384a,(%esp)
  1003f7:	e8 70 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  1003fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100403:	8b 45 10             	mov    0x10(%ebp),%eax
  100406:	89 04 24             	mov    %eax,(%esp)
  100409:	e8 2b fe ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  10040e:	c7 04 24 66 38 10 00 	movl   $0x103866,(%esp)
  100415:	e8 52 fe ff ff       	call   10026c <cprintf>
    
    cprintf("stack trackback:\n");
  10041a:	c7 04 24 68 38 10 00 	movl   $0x103868,(%esp)
  100421:	e8 46 fe ff ff       	call   10026c <cprintf>
    print_stackframe();
  100426:	e8 32 06 00 00       	call   100a5d <print_stackframe>
  10042b:	eb 01                	jmp    10042e <__panic+0x6b>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  10042d:	90                   	nop
    print_stackframe();
    
    va_end(ap);

panic_dead:
    intr_disable();
  10042e:	e8 bc 13 00 00       	call   1017ef <intr_disable>
    while (1) {
        kmonitor(NULL);
  100433:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10043a:	e8 4a 08 00 00       	call   100c89 <kmonitor>
    }
  10043f:	eb f2                	jmp    100433 <__panic+0x70>

00100441 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100441:	55                   	push   %ebp
  100442:	89 e5                	mov    %esp,%ebp
  100444:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100447:	8d 45 14             	lea    0x14(%ebp),%eax
  10044a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10044d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100450:	89 44 24 08          	mov    %eax,0x8(%esp)
  100454:	8b 45 08             	mov    0x8(%ebp),%eax
  100457:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045b:	c7 04 24 7a 38 10 00 	movl   $0x10387a,(%esp)
  100462:	e8 05 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  100467:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10046a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10046e:	8b 45 10             	mov    0x10(%ebp),%eax
  100471:	89 04 24             	mov    %eax,(%esp)
  100474:	e8 c0 fd ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100479:	c7 04 24 66 38 10 00 	movl   $0x103866,(%esp)
  100480:	e8 e7 fd ff ff       	call   10026c <cprintf>
    va_end(ap);
}
  100485:	90                   	nop
  100486:	c9                   	leave  
  100487:	c3                   	ret    

00100488 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100488:	55                   	push   %ebp
  100489:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10048b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100490:	5d                   	pop    %ebp
  100491:	c3                   	ret    

00100492 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100492:	55                   	push   %ebp
  100493:	89 e5                	mov    %esp,%ebp
  100495:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100498:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049b:	8b 00                	mov    (%eax),%eax
  10049d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004a0:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a3:	8b 00                	mov    (%eax),%eax
  1004a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004af:	e9 ca 00 00 00       	jmp    10057e <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004b4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004ba:	01 d0                	add    %edx,%eax
  1004bc:	89 c2                	mov    %eax,%edx
  1004be:	c1 ea 1f             	shr    $0x1f,%edx
  1004c1:	01 d0                	add    %edx,%eax
  1004c3:	d1 f8                	sar    %eax
  1004c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004cb:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004ce:	eb 03                	jmp    1004d3 <stab_binsearch+0x41>
            m --;
  1004d0:	ff 4d f0             	decl   -0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004d6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d9:	7c 1f                	jl     1004fa <stab_binsearch+0x68>
  1004db:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004de:	89 d0                	mov    %edx,%eax
  1004e0:	01 c0                	add    %eax,%eax
  1004e2:	01 d0                	add    %edx,%eax
  1004e4:	c1 e0 02             	shl    $0x2,%eax
  1004e7:	89 c2                	mov    %eax,%edx
  1004e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f2:	0f b6 c0             	movzbl %al,%eax
  1004f5:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004f8:	75 d6                	jne    1004d0 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100500:	7d 09                	jge    10050b <stab_binsearch+0x79>
            l = true_m + 1;
  100502:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100505:	40                   	inc    %eax
  100506:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100509:	eb 73                	jmp    10057e <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  10050b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100512:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100515:	89 d0                	mov    %edx,%eax
  100517:	01 c0                	add    %eax,%eax
  100519:	01 d0                	add    %edx,%eax
  10051b:	c1 e0 02             	shl    $0x2,%eax
  10051e:	89 c2                	mov    %eax,%edx
  100520:	8b 45 08             	mov    0x8(%ebp),%eax
  100523:	01 d0                	add    %edx,%eax
  100525:	8b 40 08             	mov    0x8(%eax),%eax
  100528:	3b 45 18             	cmp    0x18(%ebp),%eax
  10052b:	73 11                	jae    10053e <stab_binsearch+0xac>
            *region_left = m;
  10052d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100530:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100533:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100535:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100538:	40                   	inc    %eax
  100539:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10053c:	eb 40                	jmp    10057e <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10053e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100541:	89 d0                	mov    %edx,%eax
  100543:	01 c0                	add    %eax,%eax
  100545:	01 d0                	add    %edx,%eax
  100547:	c1 e0 02             	shl    $0x2,%eax
  10054a:	89 c2                	mov    %eax,%edx
  10054c:	8b 45 08             	mov    0x8(%ebp),%eax
  10054f:	01 d0                	add    %edx,%eax
  100551:	8b 40 08             	mov    0x8(%eax),%eax
  100554:	3b 45 18             	cmp    0x18(%ebp),%eax
  100557:	76 14                	jbe    10056d <stab_binsearch+0xdb>
            *region_right = m - 1;
  100559:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10055c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10055f:	8b 45 10             	mov    0x10(%ebp),%eax
  100562:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100564:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100567:	48                   	dec    %eax
  100568:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10056b:	eb 11                	jmp    10057e <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10056d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100570:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100573:	89 10                	mov    %edx,(%eax)
            l = m;
  100575:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100578:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10057b:	ff 45 18             	incl   0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10057e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100581:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100584:	0f 8e 2a ff ff ff    	jle    1004b4 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  10058a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10058e:	75 0f                	jne    10059f <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  100590:	8b 45 0c             	mov    0xc(%ebp),%eax
  100593:	8b 00                	mov    (%eax),%eax
  100595:	8d 50 ff             	lea    -0x1(%eax),%edx
  100598:	8b 45 10             	mov    0x10(%ebp),%eax
  10059b:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10059d:	eb 3e                	jmp    1005dd <stab_binsearch+0x14b>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10059f:	8b 45 10             	mov    0x10(%ebp),%eax
  1005a2:	8b 00                	mov    (%eax),%eax
  1005a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005a7:	eb 03                	jmp    1005ac <stab_binsearch+0x11a>
  1005a9:	ff 4d fc             	decl   -0x4(%ebp)
  1005ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005af:	8b 00                	mov    (%eax),%eax
  1005b1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005b4:	7d 1f                	jge    1005d5 <stab_binsearch+0x143>
  1005b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b9:	89 d0                	mov    %edx,%eax
  1005bb:	01 c0                	add    %eax,%eax
  1005bd:	01 d0                	add    %edx,%eax
  1005bf:	c1 e0 02             	shl    $0x2,%eax
  1005c2:	89 c2                	mov    %eax,%edx
  1005c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c7:	01 d0                	add    %edx,%eax
  1005c9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005cd:	0f b6 c0             	movzbl %al,%eax
  1005d0:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005d3:	75 d4                	jne    1005a9 <stab_binsearch+0x117>
            /* do nothing */;
        *region_left = l;
  1005d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005db:	89 10                	mov    %edx,(%eax)
    }
}
  1005dd:	90                   	nop
  1005de:	c9                   	leave  
  1005df:	c3                   	ret    

001005e0 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005e0:	55                   	push   %ebp
  1005e1:	89 e5                	mov    %esp,%ebp
  1005e3:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	c7 00 98 38 10 00    	movl   $0x103898,(%eax)
    info->eip_line = 0;
  1005ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fc:	c7 40 08 98 38 10 00 	movl   $0x103898,0x8(%eax)
    info->eip_fn_namelen = 9;
  100603:	8b 45 0c             	mov    0xc(%ebp),%eax
  100606:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10060d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100610:	8b 55 08             	mov    0x8(%ebp),%edx
  100613:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100616:	8b 45 0c             	mov    0xc(%ebp),%eax
  100619:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100620:	c7 45 f4 ac 40 10 00 	movl   $0x1040ac,-0xc(%ebp)
    stab_end = __STAB_END__;
  100627:	c7 45 f0 30 bc 10 00 	movl   $0x10bc30,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10062e:	c7 45 ec 31 bc 10 00 	movl   $0x10bc31,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100635:	c7 45 e8 ad dc 10 00 	movl   $0x10dcad,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10063c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100642:	76 0b                	jbe    10064f <debuginfo_eip+0x6f>
  100644:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100647:	48                   	dec    %eax
  100648:	0f b6 00             	movzbl (%eax),%eax
  10064b:	84 c0                	test   %al,%al
  10064d:	74 0a                	je     100659 <debuginfo_eip+0x79>
        return -1;
  10064f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100654:	e9 b7 02 00 00       	jmp    100910 <debuginfo_eip+0x330>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100659:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100660:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100663:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100666:	29 c2                	sub    %eax,%edx
  100668:	89 d0                	mov    %edx,%eax
  10066a:	c1 f8 02             	sar    $0x2,%eax
  10066d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100673:	48                   	dec    %eax
  100674:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100677:	8b 45 08             	mov    0x8(%ebp),%eax
  10067a:	89 44 24 10          	mov    %eax,0x10(%esp)
  10067e:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100685:	00 
  100686:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100689:	89 44 24 08          	mov    %eax,0x8(%esp)
  10068d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100690:	89 44 24 04          	mov    %eax,0x4(%esp)
  100694:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100697:	89 04 24             	mov    %eax,(%esp)
  10069a:	e8 f3 fd ff ff       	call   100492 <stab_binsearch>
    if (lfile == 0)
  10069f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a2:	85 c0                	test   %eax,%eax
  1006a4:	75 0a                	jne    1006b0 <debuginfo_eip+0xd0>
        return -1;
  1006a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006ab:	e9 60 02 00 00       	jmp    100910 <debuginfo_eip+0x330>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bf:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006c3:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006ca:	00 
  1006cb:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006ce:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006d2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006dc:	89 04 24             	mov    %eax,(%esp)
  1006df:	e8 ae fd ff ff       	call   100492 <stab_binsearch>

    if (lfun <= rfun) {
  1006e4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006ea:	39 c2                	cmp    %eax,%edx
  1006ec:	7f 7c                	jg     10076a <debuginfo_eip+0x18a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f1:	89 c2                	mov    %eax,%edx
  1006f3:	89 d0                	mov    %edx,%eax
  1006f5:	01 c0                	add    %eax,%eax
  1006f7:	01 d0                	add    %edx,%eax
  1006f9:	c1 e0 02             	shl    $0x2,%eax
  1006fc:	89 c2                	mov    %eax,%edx
  1006fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100701:	01 d0                	add    %edx,%eax
  100703:	8b 00                	mov    (%eax),%eax
  100705:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100708:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10070b:	29 d1                	sub    %edx,%ecx
  10070d:	89 ca                	mov    %ecx,%edx
  10070f:	39 d0                	cmp    %edx,%eax
  100711:	73 22                	jae    100735 <debuginfo_eip+0x155>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100713:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100716:	89 c2                	mov    %eax,%edx
  100718:	89 d0                	mov    %edx,%eax
  10071a:	01 c0                	add    %eax,%eax
  10071c:	01 d0                	add    %edx,%eax
  10071e:	c1 e0 02             	shl    $0x2,%eax
  100721:	89 c2                	mov    %eax,%edx
  100723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100726:	01 d0                	add    %edx,%eax
  100728:	8b 10                	mov    (%eax),%edx
  10072a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10072d:	01 c2                	add    %eax,%edx
  10072f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100732:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100735:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100738:	89 c2                	mov    %eax,%edx
  10073a:	89 d0                	mov    %edx,%eax
  10073c:	01 c0                	add    %eax,%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	c1 e0 02             	shl    $0x2,%eax
  100743:	89 c2                	mov    %eax,%edx
  100745:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100748:	01 d0                	add    %edx,%eax
  10074a:	8b 50 08             	mov    0x8(%eax),%edx
  10074d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100750:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100753:	8b 45 0c             	mov    0xc(%ebp),%eax
  100756:	8b 40 10             	mov    0x10(%eax),%eax
  100759:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10075c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10075f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100762:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100765:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100768:	eb 15                	jmp    10077f <debuginfo_eip+0x19f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10076a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076d:	8b 55 08             	mov    0x8(%ebp),%edx
  100770:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100776:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100779:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10077c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10077f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100782:	8b 40 08             	mov    0x8(%eax),%eax
  100785:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  10078c:	00 
  10078d:	89 04 24             	mov    %eax,(%esp)
  100790:	e8 6e 26 00 00       	call   102e03 <strfind>
  100795:	89 c2                	mov    %eax,%edx
  100797:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079a:	8b 40 08             	mov    0x8(%eax),%eax
  10079d:	29 c2                	sub    %eax,%edx
  10079f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a2:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007ac:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007b3:	00 
  1007b4:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007b7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007bb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c5:	89 04 24             	mov    %eax,(%esp)
  1007c8:	e8 c5 fc ff ff       	call   100492 <stab_binsearch>
    if (lline <= rline) {
  1007cd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d3:	39 c2                	cmp    %eax,%edx
  1007d5:	7f 23                	jg     1007fa <debuginfo_eip+0x21a>
        info->eip_line = stabs[rline].n_desc;
  1007d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007da:	89 c2                	mov    %eax,%edx
  1007dc:	89 d0                	mov    %edx,%eax
  1007de:	01 c0                	add    %eax,%eax
  1007e0:	01 d0                	add    %edx,%eax
  1007e2:	c1 e0 02             	shl    $0x2,%eax
  1007e5:	89 c2                	mov    %eax,%edx
  1007e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ea:	01 d0                	add    %edx,%eax
  1007ec:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007f0:	89 c2                	mov    %eax,%edx
  1007f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f5:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007f8:	eb 11                	jmp    10080b <debuginfo_eip+0x22b>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ff:	e9 0c 01 00 00       	jmp    100910 <debuginfo_eip+0x330>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100804:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100807:	48                   	dec    %eax
  100808:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10080b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100811:	39 c2                	cmp    %eax,%edx
  100813:	7c 56                	jl     10086b <debuginfo_eip+0x28b>
           && stabs[lline].n_type != N_SOL
  100815:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100818:	89 c2                	mov    %eax,%edx
  10081a:	89 d0                	mov    %edx,%eax
  10081c:	01 c0                	add    %eax,%eax
  10081e:	01 d0                	add    %edx,%eax
  100820:	c1 e0 02             	shl    $0x2,%eax
  100823:	89 c2                	mov    %eax,%edx
  100825:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100828:	01 d0                	add    %edx,%eax
  10082a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082e:	3c 84                	cmp    $0x84,%al
  100830:	74 39                	je     10086b <debuginfo_eip+0x28b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100832:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100835:	89 c2                	mov    %eax,%edx
  100837:	89 d0                	mov    %edx,%eax
  100839:	01 c0                	add    %eax,%eax
  10083b:	01 d0                	add    %edx,%eax
  10083d:	c1 e0 02             	shl    $0x2,%eax
  100840:	89 c2                	mov    %eax,%edx
  100842:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100845:	01 d0                	add    %edx,%eax
  100847:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10084b:	3c 64                	cmp    $0x64,%al
  10084d:	75 b5                	jne    100804 <debuginfo_eip+0x224>
  10084f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100852:	89 c2                	mov    %eax,%edx
  100854:	89 d0                	mov    %edx,%eax
  100856:	01 c0                	add    %eax,%eax
  100858:	01 d0                	add    %edx,%eax
  10085a:	c1 e0 02             	shl    $0x2,%eax
  10085d:	89 c2                	mov    %eax,%edx
  10085f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100862:	01 d0                	add    %edx,%eax
  100864:	8b 40 08             	mov    0x8(%eax),%eax
  100867:	85 c0                	test   %eax,%eax
  100869:	74 99                	je     100804 <debuginfo_eip+0x224>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10086b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10086e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100871:	39 c2                	cmp    %eax,%edx
  100873:	7c 46                	jl     1008bb <debuginfo_eip+0x2db>
  100875:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100878:	89 c2                	mov    %eax,%edx
  10087a:	89 d0                	mov    %edx,%eax
  10087c:	01 c0                	add    %eax,%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	c1 e0 02             	shl    $0x2,%eax
  100883:	89 c2                	mov    %eax,%edx
  100885:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100888:	01 d0                	add    %edx,%eax
  10088a:	8b 00                	mov    (%eax),%eax
  10088c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10088f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100892:	29 d1                	sub    %edx,%ecx
  100894:	89 ca                	mov    %ecx,%edx
  100896:	39 d0                	cmp    %edx,%eax
  100898:	73 21                	jae    1008bb <debuginfo_eip+0x2db>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10089a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089d:	89 c2                	mov    %eax,%edx
  10089f:	89 d0                	mov    %edx,%eax
  1008a1:	01 c0                	add    %eax,%eax
  1008a3:	01 d0                	add    %edx,%eax
  1008a5:	c1 e0 02             	shl    $0x2,%eax
  1008a8:	89 c2                	mov    %eax,%edx
  1008aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ad:	01 d0                	add    %edx,%eax
  1008af:	8b 10                	mov    (%eax),%edx
  1008b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008b4:	01 c2                	add    %eax,%edx
  1008b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008be:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008c1:	39 c2                	cmp    %eax,%edx
  1008c3:	7d 46                	jge    10090b <debuginfo_eip+0x32b>
        for (lline = lfun + 1;
  1008c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c8:	40                   	inc    %eax
  1008c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008cc:	eb 16                	jmp    1008e4 <debuginfo_eip+0x304>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d1:	8b 40 14             	mov    0x14(%eax),%eax
  1008d4:	8d 50 01             	lea    0x1(%eax),%edx
  1008d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008da:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1008dd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e0:	40                   	inc    %eax
  1008e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  1008ea:	39 c2                	cmp    %eax,%edx
  1008ec:	7d 1d                	jge    10090b <debuginfo_eip+0x32b>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008f1:	89 c2                	mov    %eax,%edx
  1008f3:	89 d0                	mov    %edx,%eax
  1008f5:	01 c0                	add    %eax,%eax
  1008f7:	01 d0                	add    %edx,%eax
  1008f9:	c1 e0 02             	shl    $0x2,%eax
  1008fc:	89 c2                	mov    %eax,%edx
  1008fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100901:	01 d0                	add    %edx,%eax
  100903:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100907:	3c a0                	cmp    $0xa0,%al
  100909:	74 c3                	je     1008ce <debuginfo_eip+0x2ee>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10090b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100910:	c9                   	leave  
  100911:	c3                   	ret    

00100912 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100912:	55                   	push   %ebp
  100913:	89 e5                	mov    %esp,%ebp
  100915:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100918:	c7 04 24 a2 38 10 00 	movl   $0x1038a2,(%esp)
  10091f:	e8 48 f9 ff ff       	call   10026c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100924:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10092b:	00 
  10092c:	c7 04 24 bb 38 10 00 	movl   $0x1038bb,(%esp)
  100933:	e8 34 f9 ff ff       	call   10026c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100938:	c7 44 24 04 81 37 10 	movl   $0x103781,0x4(%esp)
  10093f:	00 
  100940:	c7 04 24 d3 38 10 00 	movl   $0x1038d3,(%esp)
  100947:	e8 20 f9 ff ff       	call   10026c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10094c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100953:	00 
  100954:	c7 04 24 eb 38 10 00 	movl   $0x1038eb,(%esp)
  10095b:	e8 0c f9 ff ff       	call   10026c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100960:	c7 44 24 04 a0 fd 10 	movl   $0x10fda0,0x4(%esp)
  100967:	00 
  100968:	c7 04 24 03 39 10 00 	movl   $0x103903,(%esp)
  10096f:	e8 f8 f8 ff ff       	call   10026c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100974:	b8 a0 fd 10 00       	mov    $0x10fda0,%eax
  100979:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100984:	29 c2                	sub    %eax,%edx
  100986:	89 d0                	mov    %edx,%eax
  100988:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10098e:	85 c0                	test   %eax,%eax
  100990:	0f 48 c2             	cmovs  %edx,%eax
  100993:	c1 f8 0a             	sar    $0xa,%eax
  100996:	89 44 24 04          	mov    %eax,0x4(%esp)
  10099a:	c7 04 24 1c 39 10 00 	movl   $0x10391c,(%esp)
  1009a1:	e8 c6 f8 ff ff       	call   10026c <cprintf>
}
  1009a6:	90                   	nop
  1009a7:	c9                   	leave  
  1009a8:	c3                   	ret    

001009a9 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009a9:	55                   	push   %ebp
  1009aa:	89 e5                	mov    %esp,%ebp
  1009ac:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009b2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009b5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bc:	89 04 24             	mov    %eax,(%esp)
  1009bf:	e8 1c fc ff ff       	call   1005e0 <debuginfo_eip>
  1009c4:	85 c0                	test   %eax,%eax
  1009c6:	74 15                	je     1009dd <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009cf:	c7 04 24 46 39 10 00 	movl   $0x103946,(%esp)
  1009d6:	e8 91 f8 ff ff       	call   10026c <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009db:	eb 6c                	jmp    100a49 <print_debuginfo+0xa0>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009e4:	eb 1b                	jmp    100a01 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ec:	01 d0                	add    %edx,%eax
  1009ee:	0f b6 00             	movzbl (%eax),%eax
  1009f1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009fa:	01 ca                	add    %ecx,%edx
  1009fc:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009fe:	ff 45 f4             	incl   -0xc(%ebp)
  100a01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a04:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100a07:	7f dd                	jg     1009e6 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100a09:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a12:	01 d0                	add    %edx,%eax
  100a14:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a1a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a1d:	89 d1                	mov    %edx,%ecx
  100a1f:	29 c1                	sub    %eax,%ecx
  100a21:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a24:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a27:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a2b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a31:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a35:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a39:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a3d:	c7 04 24 62 39 10 00 	movl   $0x103962,(%esp)
  100a44:	e8 23 f8 ff ff       	call   10026c <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  100a49:	90                   	nop
  100a4a:	c9                   	leave  
  100a4b:	c3                   	ret    

00100a4c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a4c:	55                   	push   %ebp
  100a4d:	89 e5                	mov    %esp,%ebp
  100a4f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a52:	8b 45 04             	mov    0x4(%ebp),%eax
  100a55:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a58:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a5b:	c9                   	leave  
  100a5c:	c3                   	ret    

00100a5d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a5d:	55                   	push   %ebp
  100a5e:	89 e5                	mov    %esp,%ebp
  100a60:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a63:	89 e8                	mov    %ebp,%eax
  100a65:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a68:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebpValue = read_ebp();
  100a6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t eipValue = read_eip();
  100a6e:	e8 d9 ff ff ff       	call   100a4c <read_eip>
  100a73:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebpValue != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a7d:	e9 84 00 00 00       	jmp    100b06 <print_stackframe+0xa9>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebpValue, eipValue);
  100a82:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a85:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a90:	c7 04 24 74 39 10 00 	movl   $0x103974,(%esp)
  100a97:	e8 d0 f7 ff ff       	call   10026c <cprintf>
        uint32_t *args = (uint32_t *)ebpValue + 2;
  100a9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a9f:	83 c0 08             	add    $0x8,%eax
  100aa2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  100aa5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100aac:	eb 24                	jmp    100ad2 <print_stackframe+0x75>
            cprintf("0x%08x ", args[j]);
  100aae:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ab1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ab8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100abb:	01 d0                	add    %edx,%eax
  100abd:	8b 00                	mov    (%eax),%eax
  100abf:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ac3:	c7 04 24 90 39 10 00 	movl   $0x103990,(%esp)
  100aca:	e8 9d f7 ff ff       	call   10026c <cprintf>

    int i, j;
    for (i = 0; ebpValue != 0 && i < STACKFRAME_DEPTH; i ++) {
        cprintf("ebp:0x%08x eip:0x%08x args:", ebpValue, eipValue);
        uint32_t *args = (uint32_t *)ebpValue + 2;
        for (j = 0; j < 4; j ++) {
  100acf:	ff 45 e8             	incl   -0x18(%ebp)
  100ad2:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100ad6:	7e d6                	jle    100aae <print_stackframe+0x51>
            cprintf("0x%08x ", args[j]);
        }
        cprintf("\n");
  100ad8:	c7 04 24 98 39 10 00 	movl   $0x103998,(%esp)
  100adf:	e8 88 f7 ff ff       	call   10026c <cprintf>
        print_debuginfo(eipValue - 1);
  100ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ae7:	48                   	dec    %eax
  100ae8:	89 04 24             	mov    %eax,(%esp)
  100aeb:	e8 b9 fe ff ff       	call   1009a9 <print_debuginfo>
        eipValue = ((uint32_t *)ebpValue)[1];
  100af0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af3:	83 c0 04             	add    $0x4,%eax
  100af6:	8b 00                	mov    (%eax),%eax
  100af8:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebpValue = ((uint32_t *)ebpValue)[0];
  100afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100afe:	8b 00                	mov    (%eax),%eax
  100b00:	89 45 f4             	mov    %eax,-0xc(%ebp)
      */
    uint32_t ebpValue = read_ebp();
    uint32_t eipValue = read_eip();

    int i, j;
    for (i = 0; ebpValue != 0 && i < STACKFRAME_DEPTH; i ++) {
  100b03:	ff 45 ec             	incl   -0x14(%ebp)
  100b06:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b0a:	74 0a                	je     100b16 <print_stackframe+0xb9>
  100b0c:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b10:	0f 8e 6c ff ff ff    	jle    100a82 <print_stackframe+0x25>
        cprintf("\n");
        print_debuginfo(eipValue - 1);
        eipValue = ((uint32_t *)ebpValue)[1];
        ebpValue = ((uint32_t *)ebpValue)[0];
    }
}
  100b16:	90                   	nop
  100b17:	c9                   	leave  
  100b18:	c3                   	ret    

00100b19 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b19:	55                   	push   %ebp
  100b1a:	89 e5                	mov    %esp,%ebp
  100b1c:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b1f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b26:	eb 0c                	jmp    100b34 <parse+0x1b>
            *buf ++ = '\0';
  100b28:	8b 45 08             	mov    0x8(%ebp),%eax
  100b2b:	8d 50 01             	lea    0x1(%eax),%edx
  100b2e:	89 55 08             	mov    %edx,0x8(%ebp)
  100b31:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b34:	8b 45 08             	mov    0x8(%ebp),%eax
  100b37:	0f b6 00             	movzbl (%eax),%eax
  100b3a:	84 c0                	test   %al,%al
  100b3c:	74 1d                	je     100b5b <parse+0x42>
  100b3e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b41:	0f b6 00             	movzbl (%eax),%eax
  100b44:	0f be c0             	movsbl %al,%eax
  100b47:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b4b:	c7 04 24 1c 3a 10 00 	movl   $0x103a1c,(%esp)
  100b52:	e8 7a 22 00 00       	call   102dd1 <strchr>
  100b57:	85 c0                	test   %eax,%eax
  100b59:	75 cd                	jne    100b28 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b5b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5e:	0f b6 00             	movzbl (%eax),%eax
  100b61:	84 c0                	test   %al,%al
  100b63:	74 69                	je     100bce <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b65:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b69:	75 14                	jne    100b7f <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b6b:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b72:	00 
  100b73:	c7 04 24 21 3a 10 00 	movl   $0x103a21,(%esp)
  100b7a:	e8 ed f6 ff ff       	call   10026c <cprintf>
        }
        argv[argc ++] = buf;
  100b7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b82:	8d 50 01             	lea    0x1(%eax),%edx
  100b85:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b88:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b8f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b92:	01 c2                	add    %eax,%edx
  100b94:	8b 45 08             	mov    0x8(%ebp),%eax
  100b97:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b99:	eb 03                	jmp    100b9e <parse+0x85>
            buf ++;
  100b9b:	ff 45 08             	incl   0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b9e:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba1:	0f b6 00             	movzbl (%eax),%eax
  100ba4:	84 c0                	test   %al,%al
  100ba6:	0f 84 7a ff ff ff    	je     100b26 <parse+0xd>
  100bac:	8b 45 08             	mov    0x8(%ebp),%eax
  100baf:	0f b6 00             	movzbl (%eax),%eax
  100bb2:	0f be c0             	movsbl %al,%eax
  100bb5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bb9:	c7 04 24 1c 3a 10 00 	movl   $0x103a1c,(%esp)
  100bc0:	e8 0c 22 00 00       	call   102dd1 <strchr>
  100bc5:	85 c0                	test   %eax,%eax
  100bc7:	74 d2                	je     100b9b <parse+0x82>
            buf ++;
        }
    }
  100bc9:	e9 58 ff ff ff       	jmp    100b26 <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100bce:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100bcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bd2:	c9                   	leave  
  100bd3:	c3                   	ret    

00100bd4 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bd4:	55                   	push   %ebp
  100bd5:	89 e5                	mov    %esp,%ebp
  100bd7:	53                   	push   %ebx
  100bd8:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bdb:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bde:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be2:	8b 45 08             	mov    0x8(%ebp),%eax
  100be5:	89 04 24             	mov    %eax,(%esp)
  100be8:	e8 2c ff ff ff       	call   100b19 <parse>
  100bed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bf0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bf4:	75 0a                	jne    100c00 <runcmd+0x2c>
        return 0;
  100bf6:	b8 00 00 00 00       	mov    $0x0,%eax
  100bfb:	e9 83 00 00 00       	jmp    100c83 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c07:	eb 5a                	jmp    100c63 <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c09:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c0f:	89 d0                	mov    %edx,%eax
  100c11:	01 c0                	add    %eax,%eax
  100c13:	01 d0                	add    %edx,%eax
  100c15:	c1 e0 02             	shl    $0x2,%eax
  100c18:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c1d:	8b 00                	mov    (%eax),%eax
  100c1f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c23:	89 04 24             	mov    %eax,(%esp)
  100c26:	e8 09 21 00 00       	call   102d34 <strcmp>
  100c2b:	85 c0                	test   %eax,%eax
  100c2d:	75 31                	jne    100c60 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c2f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c32:	89 d0                	mov    %edx,%eax
  100c34:	01 c0                	add    %eax,%eax
  100c36:	01 d0                	add    %edx,%eax
  100c38:	c1 e0 02             	shl    $0x2,%eax
  100c3b:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c40:	8b 10                	mov    (%eax),%edx
  100c42:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c45:	83 c0 04             	add    $0x4,%eax
  100c48:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c4b:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c4e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c51:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c55:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c59:	89 1c 24             	mov    %ebx,(%esp)
  100c5c:	ff d2                	call   *%edx
  100c5e:	eb 23                	jmp    100c83 <runcmd+0xaf>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c60:	ff 45 f4             	incl   -0xc(%ebp)
  100c63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c66:	83 f8 02             	cmp    $0x2,%eax
  100c69:	76 9e                	jbe    100c09 <runcmd+0x35>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c6b:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c72:	c7 04 24 3f 3a 10 00 	movl   $0x103a3f,(%esp)
  100c79:	e8 ee f5 ff ff       	call   10026c <cprintf>
    return 0;
  100c7e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c83:	83 c4 64             	add    $0x64,%esp
  100c86:	5b                   	pop    %ebx
  100c87:	5d                   	pop    %ebp
  100c88:	c3                   	ret    

00100c89 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c89:	55                   	push   %ebp
  100c8a:	89 e5                	mov    %esp,%ebp
  100c8c:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c8f:	c7 04 24 58 3a 10 00 	movl   $0x103a58,(%esp)
  100c96:	e8 d1 f5 ff ff       	call   10026c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c9b:	c7 04 24 80 3a 10 00 	movl   $0x103a80,(%esp)
  100ca2:	e8 c5 f5 ff ff       	call   10026c <cprintf>

    if (tf != NULL) {
  100ca7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cab:	74 0b                	je     100cb8 <kmonitor+0x2f>
        print_trapframe(tf);
  100cad:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb0:	89 04 24             	mov    %eax,(%esp)
  100cb3:	e8 13 0d 00 00       	call   1019cb <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cb8:	c7 04 24 a5 3a 10 00 	movl   $0x103aa5,(%esp)
  100cbf:	e8 4a f6 ff ff       	call   10030e <readline>
  100cc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cc7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ccb:	74 eb                	je     100cb8 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  100cd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd7:	89 04 24             	mov    %eax,(%esp)
  100cda:	e8 f5 fe ff ff       	call   100bd4 <runcmd>
  100cdf:	85 c0                	test   %eax,%eax
  100ce1:	78 02                	js     100ce5 <kmonitor+0x5c>
                break;
            }
        }
    }
  100ce3:	eb d3                	jmp    100cb8 <kmonitor+0x2f>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100ce5:	90                   	nop
            }
        }
    }
}
  100ce6:	90                   	nop
  100ce7:	c9                   	leave  
  100ce8:	c3                   	ret    

00100ce9 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100ce9:	55                   	push   %ebp
  100cea:	89 e5                	mov    %esp,%ebp
  100cec:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cf6:	eb 3d                	jmp    100d35 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cf8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cfb:	89 d0                	mov    %edx,%eax
  100cfd:	01 c0                	add    %eax,%eax
  100cff:	01 d0                	add    %edx,%eax
  100d01:	c1 e0 02             	shl    $0x2,%eax
  100d04:	05 04 e0 10 00       	add    $0x10e004,%eax
  100d09:	8b 08                	mov    (%eax),%ecx
  100d0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d0e:	89 d0                	mov    %edx,%eax
  100d10:	01 c0                	add    %eax,%eax
  100d12:	01 d0                	add    %edx,%eax
  100d14:	c1 e0 02             	shl    $0x2,%eax
  100d17:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d1c:	8b 00                	mov    (%eax),%eax
  100d1e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d22:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d26:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  100d2d:	e8 3a f5 ff ff       	call   10026c <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d32:	ff 45 f4             	incl   -0xc(%ebp)
  100d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d38:	83 f8 02             	cmp    $0x2,%eax
  100d3b:	76 bb                	jbe    100cf8 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d42:	c9                   	leave  
  100d43:	c3                   	ret    

00100d44 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d44:	55                   	push   %ebp
  100d45:	89 e5                	mov    %esp,%ebp
  100d47:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d4a:	e8 c3 fb ff ff       	call   100912 <print_kerninfo>
    return 0;
  100d4f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d54:	c9                   	leave  
  100d55:	c3                   	ret    

00100d56 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d56:	55                   	push   %ebp
  100d57:	89 e5                	mov    %esp,%ebp
  100d59:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d5c:	e8 fc fc ff ff       	call   100a5d <print_stackframe>
    return 0;
  100d61:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d66:	c9                   	leave  
  100d67:	c3                   	ret    

00100d68 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d68:	55                   	push   %ebp
  100d69:	89 e5                	mov    %esp,%ebp
  100d6b:	83 ec 28             	sub    $0x28,%esp
  100d6e:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d74:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d78:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d7c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d80:	ee                   	out    %al,(%dx)
  100d81:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d87:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d8b:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d92:	ee                   	out    %al,(%dx)
  100d93:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d99:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d9d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100da1:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100da5:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100da6:	c7 05 28 f9 10 00 00 	movl   $0x0,0x10f928
  100dad:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100db0:	c7 04 24 b2 3a 10 00 	movl   $0x103ab2,(%esp)
  100db7:	e8 b0 f4 ff ff       	call   10026c <cprintf>
    pic_enable(IRQ_TIMER);
  100dbc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dc3:	e8 ba 08 00 00       	call   101682 <pic_enable>
}
  100dc8:	90                   	nop
  100dc9:	c9                   	leave  
  100dca:	c3                   	ret    

00100dcb <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dcb:	55                   	push   %ebp
  100dcc:	89 e5                	mov    %esp,%ebp
  100dce:	83 ec 10             	sub    $0x10,%esp
  100dd1:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd7:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100ddb:	89 c2                	mov    %eax,%edx
  100ddd:	ec                   	in     (%dx),%al
  100dde:	88 45 f4             	mov    %al,-0xc(%ebp)
  100de1:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100de7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dea:	89 c2                	mov    %eax,%edx
  100dec:	ec                   	in     (%dx),%al
  100ded:	88 45 f5             	mov    %al,-0xb(%ebp)
  100df0:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100df6:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dfa:	89 c2                	mov    %eax,%edx
  100dfc:	ec                   	in     (%dx),%al
  100dfd:	88 45 f6             	mov    %al,-0xa(%ebp)
  100e00:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100e06:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e09:	89 c2                	mov    %eax,%edx
  100e0b:	ec                   	in     (%dx),%al
  100e0c:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e0f:	90                   	nop
  100e10:	c9                   	leave  
  100e11:	c3                   	ret    

00100e12 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e12:	55                   	push   %ebp
  100e13:	89 e5                	mov    %esp,%ebp
  100e15:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e18:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e22:	0f b7 00             	movzwl (%eax),%eax
  100e25:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e29:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2c:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e31:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e34:	0f b7 00             	movzwl (%eax),%eax
  100e37:	0f b7 c0             	movzwl %ax,%eax
  100e3a:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e3f:	74 12                	je     100e53 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e41:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e48:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e4f:	b4 03 
  100e51:	eb 13                	jmp    100e66 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e53:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e56:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e5a:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e5d:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e64:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e66:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e6d:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e71:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e75:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e79:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100e7c:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e7d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e84:	40                   	inc    %eax
  100e85:	0f b7 c0             	movzwl %ax,%eax
  100e88:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e8c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e90:	89 c2                	mov    %eax,%edx
  100e92:	ec                   	in     (%dx),%al
  100e93:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e96:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e9a:	0f b6 c0             	movzbl %al,%eax
  100e9d:	c1 e0 08             	shl    $0x8,%eax
  100ea0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ea3:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eaa:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100eae:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb2:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100eb6:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100eb9:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100eba:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec1:	40                   	inc    %eax
  100ec2:	0f b7 c0             	movzwl %ax,%eax
  100ec5:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec9:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ecd:	89 c2                	mov    %eax,%edx
  100ecf:	ec                   	in     (%dx),%al
  100ed0:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100ed3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ed7:	0f b6 c0             	movzbl %al,%eax
  100eda:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100edd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ee0:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ee8:	0f b7 c0             	movzwl %ax,%eax
  100eeb:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ef1:	90                   	nop
  100ef2:	c9                   	leave  
  100ef3:	c3                   	ret    

00100ef4 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ef4:	55                   	push   %ebp
  100ef5:	89 e5                	mov    %esp,%ebp
  100ef7:	83 ec 38             	sub    $0x38,%esp
  100efa:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f00:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f04:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100f08:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f0c:	ee                   	out    %al,(%dx)
  100f0d:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100f13:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100f17:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100f1b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f1e:	ee                   	out    %al,(%dx)
  100f1f:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100f25:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100f29:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100f2d:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f31:	ee                   	out    %al,(%dx)
  100f32:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f38:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f3c:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f40:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100f43:	ee                   	out    %al,(%dx)
  100f44:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f4a:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f4e:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f52:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f56:	ee                   	out    %al,(%dx)
  100f57:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f5d:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f61:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f65:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100f68:	ee                   	out    %al,(%dx)
  100f69:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f6f:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f73:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f77:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f7b:	ee                   	out    %al,(%dx)
  100f7c:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f82:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100f85:	89 c2                	mov    %eax,%edx
  100f87:	ec                   	in     (%dx),%al
  100f88:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f8b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f8f:	3c ff                	cmp    $0xff,%al
  100f91:	0f 95 c0             	setne  %al
  100f94:	0f b6 c0             	movzbl %al,%eax
  100f97:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f9c:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa2:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100fa6:	89 c2                	mov    %eax,%edx
  100fa8:	ec                   	in     (%dx),%al
  100fa9:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100fac:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100fb2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100fb5:	89 c2                	mov    %eax,%edx
  100fb7:	ec                   	in     (%dx),%al
  100fb8:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fbb:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fc0:	85 c0                	test   %eax,%eax
  100fc2:	74 0c                	je     100fd0 <serial_init+0xdc>
        pic_enable(IRQ_COM1);
  100fc4:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fcb:	e8 b2 06 00 00       	call   101682 <pic_enable>
    }
}
  100fd0:	90                   	nop
  100fd1:	c9                   	leave  
  100fd2:	c3                   	ret    

00100fd3 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fd3:	55                   	push   %ebp
  100fd4:	89 e5                	mov    %esp,%ebp
  100fd6:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fd9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fe0:	eb 08                	jmp    100fea <lpt_putc_sub+0x17>
        delay();
  100fe2:	e8 e4 fd ff ff       	call   100dcb <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe7:	ff 45 fc             	incl   -0x4(%ebp)
  100fea:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100ff0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ff3:	89 c2                	mov    %eax,%edx
  100ff5:	ec                   	in     (%dx),%al
  100ff6:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  100ff9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100ffd:	84 c0                	test   %al,%al
  100fff:	78 09                	js     10100a <lpt_putc_sub+0x37>
  101001:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101008:	7e d8                	jle    100fe2 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  10100a:	8b 45 08             	mov    0x8(%ebp),%eax
  10100d:	0f b6 c0             	movzbl %al,%eax
  101010:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  101016:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101019:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  10101d:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101020:	ee                   	out    %al,(%dx)
  101021:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101027:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10102b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10102f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101033:	ee                   	out    %al,(%dx)
  101034:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  10103a:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  10103e:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  101042:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101046:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101047:	90                   	nop
  101048:	c9                   	leave  
  101049:	c3                   	ret    

0010104a <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10104a:	55                   	push   %ebp
  10104b:	89 e5                	mov    %esp,%ebp
  10104d:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101050:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101054:	74 0d                	je     101063 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101056:	8b 45 08             	mov    0x8(%ebp),%eax
  101059:	89 04 24             	mov    %eax,(%esp)
  10105c:	e8 72 ff ff ff       	call   100fd3 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101061:	eb 24                	jmp    101087 <lpt_putc+0x3d>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  101063:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10106a:	e8 64 ff ff ff       	call   100fd3 <lpt_putc_sub>
        lpt_putc_sub(' ');
  10106f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101076:	e8 58 ff ff ff       	call   100fd3 <lpt_putc_sub>
        lpt_putc_sub('\b');
  10107b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101082:	e8 4c ff ff ff       	call   100fd3 <lpt_putc_sub>
    }
}
  101087:	90                   	nop
  101088:	c9                   	leave  
  101089:	c3                   	ret    

0010108a <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10108a:	55                   	push   %ebp
  10108b:	89 e5                	mov    %esp,%ebp
  10108d:	53                   	push   %ebx
  10108e:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101091:	8b 45 08             	mov    0x8(%ebp),%eax
  101094:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101099:	85 c0                	test   %eax,%eax
  10109b:	75 07                	jne    1010a4 <cga_putc+0x1a>
        c |= 0x0700;
  10109d:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a7:	0f b6 c0             	movzbl %al,%eax
  1010aa:	83 f8 0a             	cmp    $0xa,%eax
  1010ad:	74 54                	je     101103 <cga_putc+0x79>
  1010af:	83 f8 0d             	cmp    $0xd,%eax
  1010b2:	74 62                	je     101116 <cga_putc+0x8c>
  1010b4:	83 f8 08             	cmp    $0x8,%eax
  1010b7:	0f 85 93 00 00 00    	jne    101150 <cga_putc+0xc6>
    case '\b':
        if (crt_pos > 0) {
  1010bd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c4:	85 c0                	test   %eax,%eax
  1010c6:	0f 84 ae 00 00 00    	je     10117a <cga_putc+0xf0>
            crt_pos --;
  1010cc:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d3:	48                   	dec    %eax
  1010d4:	0f b7 c0             	movzwl %ax,%eax
  1010d7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010dd:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010e2:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010e9:	01 d2                	add    %edx,%edx
  1010eb:	01 c2                	add    %eax,%edx
  1010ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f0:	98                   	cwtl   
  1010f1:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010f6:	98                   	cwtl   
  1010f7:	83 c8 20             	or     $0x20,%eax
  1010fa:	98                   	cwtl   
  1010fb:	0f b7 c0             	movzwl %ax,%eax
  1010fe:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101101:	eb 77                	jmp    10117a <cga_putc+0xf0>
    case '\n':
        crt_pos += CRT_COLS;
  101103:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10110a:	83 c0 50             	add    $0x50,%eax
  10110d:	0f b7 c0             	movzwl %ax,%eax
  101110:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101116:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10111d:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101124:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101129:	89 c8                	mov    %ecx,%eax
  10112b:	f7 e2                	mul    %edx
  10112d:	c1 ea 06             	shr    $0x6,%edx
  101130:	89 d0                	mov    %edx,%eax
  101132:	c1 e0 02             	shl    $0x2,%eax
  101135:	01 d0                	add    %edx,%eax
  101137:	c1 e0 04             	shl    $0x4,%eax
  10113a:	29 c1                	sub    %eax,%ecx
  10113c:	89 c8                	mov    %ecx,%eax
  10113e:	0f b7 c0             	movzwl %ax,%eax
  101141:	29 c3                	sub    %eax,%ebx
  101143:	89 d8                	mov    %ebx,%eax
  101145:	0f b7 c0             	movzwl %ax,%eax
  101148:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10114e:	eb 2b                	jmp    10117b <cga_putc+0xf1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101150:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101156:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10115d:	8d 50 01             	lea    0x1(%eax),%edx
  101160:	0f b7 d2             	movzwl %dx,%edx
  101163:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10116a:	01 c0                	add    %eax,%eax
  10116c:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10116f:	8b 45 08             	mov    0x8(%ebp),%eax
  101172:	0f b7 c0             	movzwl %ax,%eax
  101175:	66 89 02             	mov    %ax,(%edx)
        break;
  101178:	eb 01                	jmp    10117b <cga_putc+0xf1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  10117a:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10117b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101182:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101187:	76 5d                	jbe    1011e6 <cga_putc+0x15c>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101189:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118e:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101194:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101199:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011a0:	00 
  1011a1:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011a5:	89 04 24             	mov    %eax,(%esp)
  1011a8:	e8 1a 1e 00 00       	call   102fc7 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011ad:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011b4:	eb 14                	jmp    1011ca <cga_putc+0x140>
            crt_buf[i] = 0x0700 | ' ';
  1011b6:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011bb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011be:	01 d2                	add    %edx,%edx
  1011c0:	01 d0                	add    %edx,%eax
  1011c2:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011c7:	ff 45 f4             	incl   -0xc(%ebp)
  1011ca:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011d1:	7e e3                	jle    1011b6 <cga_putc+0x12c>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011d3:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011da:	83 e8 50             	sub    $0x50,%eax
  1011dd:	0f b7 c0             	movzwl %ax,%eax
  1011e0:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011e6:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011ed:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011f1:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  1011f5:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1011f9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011fd:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011fe:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101205:	c1 e8 08             	shr    $0x8,%eax
  101208:	0f b7 c0             	movzwl %ax,%eax
  10120b:	0f b6 c0             	movzbl %al,%eax
  10120e:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101215:	42                   	inc    %edx
  101216:	0f b7 d2             	movzwl %dx,%edx
  101219:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  10121d:	88 45 e9             	mov    %al,-0x17(%ebp)
  101220:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101224:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101227:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101228:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10122f:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101233:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  101237:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  10123b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10123f:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101240:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101247:	0f b6 c0             	movzbl %al,%eax
  10124a:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101251:	42                   	inc    %edx
  101252:	0f b7 d2             	movzwl %dx,%edx
  101255:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  101259:	88 45 eb             	mov    %al,-0x15(%ebp)
  10125c:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  101260:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101263:	ee                   	out    %al,(%dx)
}
  101264:	90                   	nop
  101265:	83 c4 24             	add    $0x24,%esp
  101268:	5b                   	pop    %ebx
  101269:	5d                   	pop    %ebp
  10126a:	c3                   	ret    

0010126b <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10126b:	55                   	push   %ebp
  10126c:	89 e5                	mov    %esp,%ebp
  10126e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101271:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101278:	eb 08                	jmp    101282 <serial_putc_sub+0x17>
        delay();
  10127a:	e8 4c fb ff ff       	call   100dcb <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10127f:	ff 45 fc             	incl   -0x4(%ebp)
  101282:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101288:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10128b:	89 c2                	mov    %eax,%edx
  10128d:	ec                   	in     (%dx),%al
  10128e:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101291:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  101295:	0f b6 c0             	movzbl %al,%eax
  101298:	83 e0 20             	and    $0x20,%eax
  10129b:	85 c0                	test   %eax,%eax
  10129d:	75 09                	jne    1012a8 <serial_putc_sub+0x3d>
  10129f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012a6:	7e d2                	jle    10127a <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ab:	0f b6 c0             	movzbl %al,%eax
  1012ae:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  1012b4:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b7:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  1012bb:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1012bf:	ee                   	out    %al,(%dx)
}
  1012c0:	90                   	nop
  1012c1:	c9                   	leave  
  1012c2:	c3                   	ret    

001012c3 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012c3:	55                   	push   %ebp
  1012c4:	89 e5                	mov    %esp,%ebp
  1012c6:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012c9:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012cd:	74 0d                	je     1012dc <serial_putc+0x19>
        serial_putc_sub(c);
  1012cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d2:	89 04 24             	mov    %eax,(%esp)
  1012d5:	e8 91 ff ff ff       	call   10126b <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012da:	eb 24                	jmp    101300 <serial_putc+0x3d>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012dc:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e3:	e8 83 ff ff ff       	call   10126b <serial_putc_sub>
        serial_putc_sub(' ');
  1012e8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012ef:	e8 77 ff ff ff       	call   10126b <serial_putc_sub>
        serial_putc_sub('\b');
  1012f4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012fb:	e8 6b ff ff ff       	call   10126b <serial_putc_sub>
    }
}
  101300:	90                   	nop
  101301:	c9                   	leave  
  101302:	c3                   	ret    

00101303 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101303:	55                   	push   %ebp
  101304:	89 e5                	mov    %esp,%ebp
  101306:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101309:	eb 33                	jmp    10133e <cons_intr+0x3b>
        if (c != 0) {
  10130b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10130f:	74 2d                	je     10133e <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101311:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101316:	8d 50 01             	lea    0x1(%eax),%edx
  101319:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  10131f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101322:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101328:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10132d:	3d 00 02 00 00       	cmp    $0x200,%eax
  101332:	75 0a                	jne    10133e <cons_intr+0x3b>
                cons.wpos = 0;
  101334:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10133b:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10133e:	8b 45 08             	mov    0x8(%ebp),%eax
  101341:	ff d0                	call   *%eax
  101343:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101346:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10134a:	75 bf                	jne    10130b <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10134c:	90                   	nop
  10134d:	c9                   	leave  
  10134e:	c3                   	ret    

0010134f <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10134f:	55                   	push   %ebp
  101350:	89 e5                	mov    %esp,%ebp
  101352:	83 ec 10             	sub    $0x10,%esp
  101355:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10135b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10135e:	89 c2                	mov    %eax,%edx
  101360:	ec                   	in     (%dx),%al
  101361:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101364:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101368:	0f b6 c0             	movzbl %al,%eax
  10136b:	83 e0 01             	and    $0x1,%eax
  10136e:	85 c0                	test   %eax,%eax
  101370:	75 07                	jne    101379 <serial_proc_data+0x2a>
        return -1;
  101372:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101377:	eb 2a                	jmp    1013a3 <serial_proc_data+0x54>
  101379:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10137f:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101383:	89 c2                	mov    %eax,%edx
  101385:	ec                   	in     (%dx),%al
  101386:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  101389:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10138d:	0f b6 c0             	movzbl %al,%eax
  101390:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101393:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101397:	75 07                	jne    1013a0 <serial_proc_data+0x51>
        c = '\b';
  101399:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013a3:	c9                   	leave  
  1013a4:	c3                   	ret    

001013a5 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013a5:	55                   	push   %ebp
  1013a6:	89 e5                	mov    %esp,%ebp
  1013a8:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013ab:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013b0:	85 c0                	test   %eax,%eax
  1013b2:	74 0c                	je     1013c0 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013b4:	c7 04 24 4f 13 10 00 	movl   $0x10134f,(%esp)
  1013bb:	e8 43 ff ff ff       	call   101303 <cons_intr>
    }
}
  1013c0:	90                   	nop
  1013c1:	c9                   	leave  
  1013c2:	c3                   	ret    

001013c3 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013c3:	55                   	push   %ebp
  1013c4:	89 e5                	mov    %esp,%ebp
  1013c6:	83 ec 28             	sub    $0x28,%esp
  1013c9:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1013d2:	89 c2                	mov    %eax,%edx
  1013d4:	ec                   	in     (%dx),%al
  1013d5:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013d8:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013dc:	0f b6 c0             	movzbl %al,%eax
  1013df:	83 e0 01             	and    $0x1,%eax
  1013e2:	85 c0                	test   %eax,%eax
  1013e4:	75 0a                	jne    1013f0 <kbd_proc_data+0x2d>
        return -1;
  1013e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013eb:	e9 56 01 00 00       	jmp    101546 <kbd_proc_data+0x183>
  1013f0:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013f9:	89 c2                	mov    %eax,%edx
  1013fb:	ec                   	in     (%dx),%al
  1013fc:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013ff:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  101403:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101406:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10140a:	75 17                	jne    101423 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  10140c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101411:	83 c8 40             	or     $0x40,%eax
  101414:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101419:	b8 00 00 00 00       	mov    $0x0,%eax
  10141e:	e9 23 01 00 00       	jmp    101546 <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101423:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101427:	84 c0                	test   %al,%al
  101429:	79 45                	jns    101470 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10142b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101430:	83 e0 40             	and    $0x40,%eax
  101433:	85 c0                	test   %eax,%eax
  101435:	75 08                	jne    10143f <kbd_proc_data+0x7c>
  101437:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143b:	24 7f                	and    $0x7f,%al
  10143d:	eb 04                	jmp    101443 <kbd_proc_data+0x80>
  10143f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101443:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101446:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10144a:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101451:	0c 40                	or     $0x40,%al
  101453:	0f b6 c0             	movzbl %al,%eax
  101456:	f7 d0                	not    %eax
  101458:	89 c2                	mov    %eax,%edx
  10145a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10145f:	21 d0                	and    %edx,%eax
  101461:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101466:	b8 00 00 00 00       	mov    $0x0,%eax
  10146b:	e9 d6 00 00 00       	jmp    101546 <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  101470:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101475:	83 e0 40             	and    $0x40,%eax
  101478:	85 c0                	test   %eax,%eax
  10147a:	74 11                	je     10148d <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10147c:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101480:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101485:	83 e0 bf             	and    $0xffffffbf,%eax
  101488:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  10148d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101491:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101498:	0f b6 d0             	movzbl %al,%edx
  10149b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a0:	09 d0                	or     %edx,%eax
  1014a2:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014a7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ab:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014b2:	0f b6 d0             	movzbl %al,%edx
  1014b5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ba:	31 d0                	xor    %edx,%eax
  1014bc:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014c1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c6:	83 e0 03             	and    $0x3,%eax
  1014c9:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014d0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014d4:	01 d0                	add    %edx,%eax
  1014d6:	0f b6 00             	movzbl (%eax),%eax
  1014d9:	0f b6 c0             	movzbl %al,%eax
  1014dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014df:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e4:	83 e0 08             	and    $0x8,%eax
  1014e7:	85 c0                	test   %eax,%eax
  1014e9:	74 22                	je     10150d <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  1014eb:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014ef:	7e 0c                	jle    1014fd <kbd_proc_data+0x13a>
  1014f1:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014f5:	7f 06                	jg     1014fd <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  1014f7:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014fb:	eb 10                	jmp    10150d <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  1014fd:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101501:	7e 0a                	jle    10150d <kbd_proc_data+0x14a>
  101503:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101507:	7f 04                	jg     10150d <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101509:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10150d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101512:	f7 d0                	not    %eax
  101514:	83 e0 06             	and    $0x6,%eax
  101517:	85 c0                	test   %eax,%eax
  101519:	75 28                	jne    101543 <kbd_proc_data+0x180>
  10151b:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101522:	75 1f                	jne    101543 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101524:	c7 04 24 cd 3a 10 00 	movl   $0x103acd,(%esp)
  10152b:	e8 3c ed ff ff       	call   10026c <cprintf>
  101530:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  101536:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10153a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10153e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101542:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101543:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101546:	c9                   	leave  
  101547:	c3                   	ret    

00101548 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101548:	55                   	push   %ebp
  101549:	89 e5                	mov    %esp,%ebp
  10154b:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10154e:	c7 04 24 c3 13 10 00 	movl   $0x1013c3,(%esp)
  101555:	e8 a9 fd ff ff       	call   101303 <cons_intr>
}
  10155a:	90                   	nop
  10155b:	c9                   	leave  
  10155c:	c3                   	ret    

0010155d <kbd_init>:

static void
kbd_init(void) {
  10155d:	55                   	push   %ebp
  10155e:	89 e5                	mov    %esp,%ebp
  101560:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101563:	e8 e0 ff ff ff       	call   101548 <kbd_intr>
    pic_enable(IRQ_KBD);
  101568:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10156f:	e8 0e 01 00 00       	call   101682 <pic_enable>
}
  101574:	90                   	nop
  101575:	c9                   	leave  
  101576:	c3                   	ret    

00101577 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101577:	55                   	push   %ebp
  101578:	89 e5                	mov    %esp,%ebp
  10157a:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10157d:	e8 90 f8 ff ff       	call   100e12 <cga_init>
    serial_init();
  101582:	e8 6d f9 ff ff       	call   100ef4 <serial_init>
    kbd_init();
  101587:	e8 d1 ff ff ff       	call   10155d <kbd_init>
    if (!serial_exists) {
  10158c:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101591:	85 c0                	test   %eax,%eax
  101593:	75 0c                	jne    1015a1 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101595:	c7 04 24 d9 3a 10 00 	movl   $0x103ad9,(%esp)
  10159c:	e8 cb ec ff ff       	call   10026c <cprintf>
    }
}
  1015a1:	90                   	nop
  1015a2:	c9                   	leave  
  1015a3:	c3                   	ret    

001015a4 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015a4:	55                   	push   %ebp
  1015a5:	89 e5                	mov    %esp,%ebp
  1015a7:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ad:	89 04 24             	mov    %eax,(%esp)
  1015b0:	e8 95 fa ff ff       	call   10104a <lpt_putc>
    cga_putc(c);
  1015b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b8:	89 04 24             	mov    %eax,(%esp)
  1015bb:	e8 ca fa ff ff       	call   10108a <cga_putc>
    serial_putc(c);
  1015c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c3:	89 04 24             	mov    %eax,(%esp)
  1015c6:	e8 f8 fc ff ff       	call   1012c3 <serial_putc>
}
  1015cb:	90                   	nop
  1015cc:	c9                   	leave  
  1015cd:	c3                   	ret    

001015ce <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015ce:	55                   	push   %ebp
  1015cf:	89 e5                	mov    %esp,%ebp
  1015d1:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015d4:	e8 cc fd ff ff       	call   1013a5 <serial_intr>
    kbd_intr();
  1015d9:	e8 6a ff ff ff       	call   101548 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015de:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015e4:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015e9:	39 c2                	cmp    %eax,%edx
  1015eb:	74 36                	je     101623 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015ed:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015f2:	8d 50 01             	lea    0x1(%eax),%edx
  1015f5:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015fb:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101602:	0f b6 c0             	movzbl %al,%eax
  101605:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101608:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10160d:	3d 00 02 00 00       	cmp    $0x200,%eax
  101612:	75 0a                	jne    10161e <cons_getc+0x50>
            cons.rpos = 0;
  101614:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10161b:	00 00 00 
        }
        return c;
  10161e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101621:	eb 05                	jmp    101628 <cons_getc+0x5a>
    }
    return 0;
  101623:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101628:	c9                   	leave  
  101629:	c3                   	ret    

0010162a <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10162a:	55                   	push   %ebp
  10162b:	89 e5                	mov    %esp,%ebp
  10162d:	83 ec 14             	sub    $0x14,%esp
  101630:	8b 45 08             	mov    0x8(%ebp),%eax
  101633:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101637:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10163a:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101640:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101645:	85 c0                	test   %eax,%eax
  101647:	74 36                	je     10167f <pic_setmask+0x55>
        outb(IO_PIC1 + 1, mask);
  101649:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10164c:	0f b6 c0             	movzbl %al,%eax
  10164f:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101655:	88 45 fa             	mov    %al,-0x6(%ebp)
  101658:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  10165c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101660:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101661:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101665:	c1 e8 08             	shr    $0x8,%eax
  101668:	0f b7 c0             	movzwl %ax,%eax
  10166b:	0f b6 c0             	movzbl %al,%eax
  10166e:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101674:	88 45 fb             	mov    %al,-0x5(%ebp)
  101677:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  10167b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10167e:	ee                   	out    %al,(%dx)
    }
}
  10167f:	90                   	nop
  101680:	c9                   	leave  
  101681:	c3                   	ret    

00101682 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101682:	55                   	push   %ebp
  101683:	89 e5                	mov    %esp,%ebp
  101685:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101688:	8b 45 08             	mov    0x8(%ebp),%eax
  10168b:	ba 01 00 00 00       	mov    $0x1,%edx
  101690:	88 c1                	mov    %al,%cl
  101692:	d3 e2                	shl    %cl,%edx
  101694:	89 d0                	mov    %edx,%eax
  101696:	98                   	cwtl   
  101697:	f7 d0                	not    %eax
  101699:	0f bf d0             	movswl %ax,%edx
  10169c:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016a3:	98                   	cwtl   
  1016a4:	21 d0                	and    %edx,%eax
  1016a6:	98                   	cwtl   
  1016a7:	0f b7 c0             	movzwl %ax,%eax
  1016aa:	89 04 24             	mov    %eax,(%esp)
  1016ad:	e8 78 ff ff ff       	call   10162a <pic_setmask>
}
  1016b2:	90                   	nop
  1016b3:	c9                   	leave  
  1016b4:	c3                   	ret    

001016b5 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016b5:	55                   	push   %ebp
  1016b6:	89 e5                	mov    %esp,%ebp
  1016b8:	83 ec 34             	sub    $0x34,%esp
    did_init = 1;
  1016bb:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016c2:	00 00 00 
  1016c5:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016cb:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016cf:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016d3:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016d7:	ee                   	out    %al,(%dx)
  1016d8:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016de:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  1016e2:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  1016e6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1016e9:	ee                   	out    %al,(%dx)
  1016ea:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016f0:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016f4:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  1016f8:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016fc:	ee                   	out    %al,(%dx)
  1016fd:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  101703:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  101707:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10170b:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10170e:	ee                   	out    %al,(%dx)
  10170f:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  101715:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  101719:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  10171d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101721:	ee                   	out    %al,(%dx)
  101722:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  101728:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  10172c:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  101730:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101733:	ee                   	out    %al,(%dx)
  101734:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  10173a:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  10173e:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  101742:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101746:	ee                   	out    %al,(%dx)
  101747:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  10174d:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  101751:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101755:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101758:	ee                   	out    %al,(%dx)
  101759:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10175f:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  101763:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  101767:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10176b:	ee                   	out    %al,(%dx)
  10176c:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  101772:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  101776:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  10177a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10177d:	ee                   	out    %al,(%dx)
  10177e:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  101784:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  101788:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  10178c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101790:	ee                   	out    %al,(%dx)
  101791:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  101797:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  10179b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10179f:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1017a2:	ee                   	out    %al,(%dx)
  1017a3:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1017a9:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  1017ad:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  1017b1:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017b5:	ee                   	out    %al,(%dx)
  1017b6:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  1017bc:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  1017c0:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1017c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1017c7:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017c8:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017cf:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1017d4:	74 0f                	je     1017e5 <pic_init+0x130>
        pic_setmask(irq_mask);
  1017d6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017dd:	89 04 24             	mov    %eax,(%esp)
  1017e0:	e8 45 fe ff ff       	call   10162a <pic_setmask>
    }
}
  1017e5:	90                   	nop
  1017e6:	c9                   	leave  
  1017e7:	c3                   	ret    

001017e8 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017e8:	55                   	push   %ebp
  1017e9:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017eb:	fb                   	sti    
    sti();
}
  1017ec:	90                   	nop
  1017ed:	5d                   	pop    %ebp
  1017ee:	c3                   	ret    

001017ef <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017ef:	55                   	push   %ebp
  1017f0:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017f2:	fa                   	cli    
    cli();
}
  1017f3:	90                   	nop
  1017f4:	5d                   	pop    %ebp
  1017f5:	c3                   	ret    

001017f6 <print_ticks>:
#include <string.h>


#define TICK_NUM 100

static void print_ticks() {
  1017f6:	55                   	push   %ebp
  1017f7:	89 e5                	mov    %esp,%ebp
  1017f9:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017fc:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101803:	00 
  101804:	c7 04 24 00 3b 10 00 	movl   $0x103b00,(%esp)
  10180b:	e8 5c ea ff ff       	call   10026c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101810:	90                   	nop
  101811:	c9                   	leave  
  101812:	c3                   	ret    

00101813 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101813:	55                   	push   %ebp
  101814:	89 e5                	mov    %esp,%ebp
  101816:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101819:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101820:	e9 c4 00 00 00       	jmp    1018e9 <idt_init+0xd6>
        //在IDT中建立中断描述符，其中存储了中断处理例程的代码段GD_KTEXT和偏移量__vectors[i]，特权级为DPL_KERNEL。
        //这样通过查询idt[i]就可定位到中断服务例程的起始地址。
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101825:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101828:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10182f:	0f b7 d0             	movzwl %ax,%edx
  101832:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101835:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10183c:	00 
  10183d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101840:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101847:	00 08 00 
  10184a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184d:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101854:	00 
  101855:	80 e2 e0             	and    $0xe0,%dl
  101858:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10185f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101862:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101869:	00 
  10186a:	80 e2 1f             	and    $0x1f,%dl
  10186d:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101874:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101877:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10187e:	00 
  10187f:	80 e2 f0             	and    $0xf0,%dl
  101882:	80 ca 0e             	or     $0xe,%dl
  101885:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10188c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188f:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101896:	00 
  101897:	80 e2 ef             	and    $0xef,%dl
  10189a:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a4:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018ab:	00 
  1018ac:	80 e2 9f             	and    $0x9f,%dl
  1018af:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b9:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018c0:	00 
  1018c1:	80 ca 80             	or     $0x80,%dl
  1018c4:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ce:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018d5:	c1 e8 10             	shr    $0x10,%eax
  1018d8:	0f b7 d0             	movzwl %ax,%edx
  1018db:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018de:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018e5:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  1018e6:	ff 45 fc             	incl   -0x4(%ebp)
  1018e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ec:	3d ff 00 00 00       	cmp    $0xff,%eax
  1018f1:	0f 86 2e ff ff ff    	jbe    101825 <idt_init+0x12>
        //这样通过查询idt[i]就可定位到中断服务例程的起始地址。
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
	// set for switch from user to kernel
    // 为系统调用中断设置用户态权限(DPL3)
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  1018f7:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1018fc:	0f b7 c0             	movzwl %ax,%eax
  1018ff:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  101905:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  10190c:	08 00 
  10190e:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101915:	24 e0                	and    $0xe0,%al
  101917:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10191c:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101923:	24 1f                	and    $0x1f,%al
  101925:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10192a:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101931:	24 f0                	and    $0xf0,%al
  101933:	0c 0e                	or     $0xe,%al
  101935:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10193a:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101941:	24 ef                	and    $0xef,%al
  101943:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101948:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10194f:	0c 60                	or     $0x60,%al
  101951:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101956:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10195d:	0c 80                	or     $0x80,%al
  10195f:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101964:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101969:	c1 e8 10             	shr    $0x10,%eax
  10196c:	0f b7 c0             	movzwl %ax,%eax
  10196f:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101975:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  10197c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10197f:	0f 01 18             	lidtl  (%eax)
	// load the IDT
    // 载入LDT，将LDT存入LDTR中
    lidt(&idt_pd);
     
}
  101982:	90                   	nop
  101983:	c9                   	leave  
  101984:	c3                   	ret    

00101985 <trapname>:

static const char *
trapname(int trapno) {
  101985:	55                   	push   %ebp
  101986:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101988:	8b 45 08             	mov    0x8(%ebp),%eax
  10198b:	83 f8 13             	cmp    $0x13,%eax
  10198e:	77 0c                	ja     10199c <trapname+0x17>
        return excnames[trapno];
  101990:	8b 45 08             	mov    0x8(%ebp),%eax
  101993:	8b 04 85 60 3e 10 00 	mov    0x103e60(,%eax,4),%eax
  10199a:	eb 18                	jmp    1019b4 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10199c:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019a0:	7e 0d                	jle    1019af <trapname+0x2a>
  1019a2:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019a6:	7f 07                	jg     1019af <trapname+0x2a>
        return "Hardware Interrupt";
  1019a8:	b8 0a 3b 10 00       	mov    $0x103b0a,%eax
  1019ad:	eb 05                	jmp    1019b4 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019af:	b8 1d 3b 10 00       	mov    $0x103b1d,%eax
}
  1019b4:	5d                   	pop    %ebp
  1019b5:	c3                   	ret    

001019b6 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019b6:	55                   	push   %ebp
  1019b7:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bc:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019c0:	83 f8 08             	cmp    $0x8,%eax
  1019c3:	0f 94 c0             	sete   %al
  1019c6:	0f b6 c0             	movzbl %al,%eax
}
  1019c9:	5d                   	pop    %ebp
  1019ca:	c3                   	ret    

001019cb <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019cb:	55                   	push   %ebp
  1019cc:	89 e5                	mov    %esp,%ebp
  1019ce:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019d8:	c7 04 24 5e 3b 10 00 	movl   $0x103b5e,(%esp)
  1019df:	e8 88 e8 ff ff       	call   10026c <cprintf>
    print_regs(&tf->tf_regs);
  1019e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e7:	89 04 24             	mov    %eax,(%esp)
  1019ea:	e8 91 01 00 00       	call   101b80 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f2:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019fa:	c7 04 24 6f 3b 10 00 	movl   $0x103b6f,(%esp)
  101a01:	e8 66 e8 ff ff       	call   10026c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a06:	8b 45 08             	mov    0x8(%ebp),%eax
  101a09:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a11:	c7 04 24 82 3b 10 00 	movl   $0x103b82,(%esp)
  101a18:	e8 4f e8 ff ff       	call   10026c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a20:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a24:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a28:	c7 04 24 95 3b 10 00 	movl   $0x103b95,(%esp)
  101a2f:	e8 38 e8 ff ff       	call   10026c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a34:	8b 45 08             	mov    0x8(%ebp),%eax
  101a37:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a3f:	c7 04 24 a8 3b 10 00 	movl   $0x103ba8,(%esp)
  101a46:	e8 21 e8 ff ff       	call   10026c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a4e:	8b 40 30             	mov    0x30(%eax),%eax
  101a51:	89 04 24             	mov    %eax,(%esp)
  101a54:	e8 2c ff ff ff       	call   101985 <trapname>
  101a59:	89 c2                	mov    %eax,%edx
  101a5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5e:	8b 40 30             	mov    0x30(%eax),%eax
  101a61:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a65:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a69:	c7 04 24 bb 3b 10 00 	movl   $0x103bbb,(%esp)
  101a70:	e8 f7 e7 ff ff       	call   10026c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a75:	8b 45 08             	mov    0x8(%ebp),%eax
  101a78:	8b 40 34             	mov    0x34(%eax),%eax
  101a7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a7f:	c7 04 24 cd 3b 10 00 	movl   $0x103bcd,(%esp)
  101a86:	e8 e1 e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8e:	8b 40 38             	mov    0x38(%eax),%eax
  101a91:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a95:	c7 04 24 dc 3b 10 00 	movl   $0x103bdc,(%esp)
  101a9c:	e8 cb e7 ff ff       	call   10026c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101aa1:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa4:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101aa8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aac:	c7 04 24 eb 3b 10 00 	movl   $0x103beb,(%esp)
  101ab3:	e8 b4 e7 ff ff       	call   10026c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  101abb:	8b 40 40             	mov    0x40(%eax),%eax
  101abe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac2:	c7 04 24 fe 3b 10 00 	movl   $0x103bfe,(%esp)
  101ac9:	e8 9e e7 ff ff       	call   10026c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ace:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ad5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101adc:	eb 3d                	jmp    101b1b <print_trapframe+0x150>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101ade:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae1:	8b 50 40             	mov    0x40(%eax),%edx
  101ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ae7:	21 d0                	and    %edx,%eax
  101ae9:	85 c0                	test   %eax,%eax
  101aeb:	74 28                	je     101b15 <print_trapframe+0x14a>
  101aed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101af0:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101af7:	85 c0                	test   %eax,%eax
  101af9:	74 1a                	je     101b15 <print_trapframe+0x14a>
            cprintf("%s,", IA32flags[i]);
  101afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101afe:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b05:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b09:	c7 04 24 0d 3c 10 00 	movl   $0x103c0d,(%esp)
  101b10:	e8 57 e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b15:	ff 45 f4             	incl   -0xc(%ebp)
  101b18:	d1 65 f0             	shll   -0x10(%ebp)
  101b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b1e:	83 f8 17             	cmp    $0x17,%eax
  101b21:	76 bb                	jbe    101ade <print_trapframe+0x113>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b23:	8b 45 08             	mov    0x8(%ebp),%eax
  101b26:	8b 40 40             	mov    0x40(%eax),%eax
  101b29:	25 00 30 00 00       	and    $0x3000,%eax
  101b2e:	c1 e8 0c             	shr    $0xc,%eax
  101b31:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b35:	c7 04 24 11 3c 10 00 	movl   $0x103c11,(%esp)
  101b3c:	e8 2b e7 ff ff       	call   10026c <cprintf>

    if (!trap_in_kernel(tf)) {
  101b41:	8b 45 08             	mov    0x8(%ebp),%eax
  101b44:	89 04 24             	mov    %eax,(%esp)
  101b47:	e8 6a fe ff ff       	call   1019b6 <trap_in_kernel>
  101b4c:	85 c0                	test   %eax,%eax
  101b4e:	75 2d                	jne    101b7d <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b50:	8b 45 08             	mov    0x8(%ebp),%eax
  101b53:	8b 40 44             	mov    0x44(%eax),%eax
  101b56:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5a:	c7 04 24 1a 3c 10 00 	movl   $0x103c1a,(%esp)
  101b61:	e8 06 e7 ff ff       	call   10026c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b66:	8b 45 08             	mov    0x8(%ebp),%eax
  101b69:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b6d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b71:	c7 04 24 29 3c 10 00 	movl   $0x103c29,(%esp)
  101b78:	e8 ef e6 ff ff       	call   10026c <cprintf>
    }
}
  101b7d:	90                   	nop
  101b7e:	c9                   	leave  
  101b7f:	c3                   	ret    

00101b80 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b80:	55                   	push   %ebp
  101b81:	89 e5                	mov    %esp,%ebp
  101b83:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b86:	8b 45 08             	mov    0x8(%ebp),%eax
  101b89:	8b 00                	mov    (%eax),%eax
  101b8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b8f:	c7 04 24 3c 3c 10 00 	movl   $0x103c3c,(%esp)
  101b96:	e8 d1 e6 ff ff       	call   10026c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b9b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b9e:	8b 40 04             	mov    0x4(%eax),%eax
  101ba1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba5:	c7 04 24 4b 3c 10 00 	movl   $0x103c4b,(%esp)
  101bac:	e8 bb e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb4:	8b 40 08             	mov    0x8(%eax),%eax
  101bb7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bbb:	c7 04 24 5a 3c 10 00 	movl   $0x103c5a,(%esp)
  101bc2:	e8 a5 e6 ff ff       	call   10026c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bc7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bca:	8b 40 0c             	mov    0xc(%eax),%eax
  101bcd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd1:	c7 04 24 69 3c 10 00 	movl   $0x103c69,(%esp)
  101bd8:	e8 8f e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bdd:	8b 45 08             	mov    0x8(%ebp),%eax
  101be0:	8b 40 10             	mov    0x10(%eax),%eax
  101be3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be7:	c7 04 24 78 3c 10 00 	movl   $0x103c78,(%esp)
  101bee:	e8 79 e6 ff ff       	call   10026c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101bf3:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf6:	8b 40 14             	mov    0x14(%eax),%eax
  101bf9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bfd:	c7 04 24 87 3c 10 00 	movl   $0x103c87,(%esp)
  101c04:	e8 63 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c09:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0c:	8b 40 18             	mov    0x18(%eax),%eax
  101c0f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c13:	c7 04 24 96 3c 10 00 	movl   $0x103c96,(%esp)
  101c1a:	e8 4d e6 ff ff       	call   10026c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c1f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c22:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c25:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c29:	c7 04 24 a5 3c 10 00 	movl   $0x103ca5,(%esp)
  101c30:	e8 37 e6 ff ff       	call   10026c <cprintf>
}
  101c35:	90                   	nop
  101c36:	c9                   	leave  
  101c37:	c3                   	ret    

00101c38 <trap_dispatch>:
    }
}

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c38:	55                   	push   %ebp
  101c39:	89 e5                	mov    %esp,%ebp
  101c3b:	57                   	push   %edi
  101c3c:	56                   	push   %esi
  101c3d:	53                   	push   %ebx
  101c3e:	83 ec 3c             	sub    $0x3c,%esp
    char c;

    switch (tf->tf_trapno) {
  101c41:	8b 45 08             	mov    0x8(%ebp),%eax
  101c44:	8b 40 30             	mov    0x30(%eax),%eax
  101c47:	83 f8 2f             	cmp    $0x2f,%eax
  101c4a:	77 21                	ja     101c6d <trap_dispatch+0x35>
  101c4c:	83 f8 2e             	cmp    $0x2e,%eax
  101c4f:	0f 83 1a 04 00 00    	jae    10206f <trap_dispatch+0x437>
  101c55:	83 f8 21             	cmp    $0x21,%eax
  101c58:	0f 84 95 00 00 00    	je     101cf3 <trap_dispatch+0xbb>
  101c5e:	83 f8 24             	cmp    $0x24,%eax
  101c61:	74 67                	je     101cca <trap_dispatch+0x92>
  101c63:	83 f8 20             	cmp    $0x20,%eax
  101c66:	74 1c                	je     101c84 <trap_dispatch+0x4c>
  101c68:	e9 cd 03 00 00       	jmp    10203a <trap_dispatch+0x402>
  101c6d:	83 f8 78             	cmp    $0x78,%eax
  101c70:	0f 84 37 02 00 00    	je     101ead <trap_dispatch+0x275>
  101c76:	83 f8 79             	cmp    $0x79,%eax
  101c79:	0f 84 28 03 00 00    	je     101fa7 <trap_dispatch+0x36f>
  101c7f:	e9 b6 03 00 00       	jmp    10203a <trap_dispatch+0x402>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks = ticks + 1;
  101c84:	a1 28 f9 10 00       	mov    0x10f928,%eax
  101c89:	40                   	inc    %eax
  101c8a:	a3 28 f9 10 00       	mov    %eax,0x10f928
        if (ticks % TICK_NUM == 0){
  101c8f:	8b 0d 28 f9 10 00    	mov    0x10f928,%ecx
  101c95:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101c9a:	89 c8                	mov    %ecx,%eax
  101c9c:	f7 e2                	mul    %edx
  101c9e:	c1 ea 05             	shr    $0x5,%edx
  101ca1:	89 d0                	mov    %edx,%eax
  101ca3:	c1 e0 02             	shl    $0x2,%eax
  101ca6:	01 d0                	add    %edx,%eax
  101ca8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101caf:	01 d0                	add    %edx,%eax
  101cb1:	c1 e0 02             	shl    $0x2,%eax
  101cb4:	29 c1                	sub    %eax,%ecx
  101cb6:	89 ca                	mov    %ecx,%edx
  101cb8:	85 d2                	test   %edx,%edx
  101cba:	0f 85 b2 03 00 00    	jne    102072 <trap_dispatch+0x43a>
            print_ticks();
  101cc0:	e8 31 fb ff ff       	call   1017f6 <print_ticks>
        }
        break;
  101cc5:	e9 a8 03 00 00       	jmp    102072 <trap_dispatch+0x43a>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cca:	e8 ff f8 ff ff       	call   1015ce <cons_getc>
  101ccf:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cd2:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101cd6:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101cda:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cde:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ce2:	c7 04 24 b4 3c 10 00 	movl   $0x103cb4,(%esp)
  101ce9:	e8 7e e5 ff ff       	call   10026c <cprintf>
        break;
  101cee:	e9 89 03 00 00       	jmp    10207c <trap_dispatch+0x444>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101cf3:	e8 d6 f8 ff ff       	call   1015ce <cons_getc>
  101cf8:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101cfb:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101cff:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d03:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d07:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d0b:	c7 04 24 c6 3c 10 00 	movl   $0x103cc6,(%esp)
  101d12:	e8 55 e5 ff ff       	call   10026c <cprintf>

        if (c == '0') {
  101d17:	80 7d e7 30          	cmpb   $0x30,-0x19(%ebp)
  101d1b:	0f 85 8d 00 00 00    	jne    101dae <trap_dispatch+0x176>
  101d21:	8b 45 08             	mov    0x8(%ebp),%eax
  101d24:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
        }
}

static inline __attribute__((always_inline)) void switch_to_kernel(struct trapframe *tf) {
    if (tf->tf_cs != KERNEL_CS) {
  101d27:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d2a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d2e:	83 f8 08             	cmp    $0x8,%eax
  101d31:	74 6b                	je     101d9e <trap_dispatch+0x166>
        tf->tf_cs = KERNEL_CS;
  101d33:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d36:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
        tf->tf_ds = tf->tf_es = KERNEL_DS;
  101d3c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d3f:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101d45:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d48:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101d4c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d4f:	66 89 50 2c          	mov    %dx,0x2c(%eax)
        tf->tf_eflags &= ~FL_IOPL_MASK;
  101d53:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d56:	8b 40 40             	mov    0x40(%eax),%eax
  101d59:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101d5e:	89 c2                	mov    %eax,%edx
  101d60:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d63:	89 50 40             	mov    %edx,0x40(%eax)
        switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101d66:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d69:	8b 40 44             	mov    0x44(%eax),%eax
  101d6c:	83 e8 44             	sub    $0x44,%eax
  101d6f:	a3 8c f9 10 00       	mov    %eax,0x10f98c

        memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  101d74:	a1 8c f9 10 00       	mov    0x10f98c,%eax
  101d79:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  101d80:	00 
  101d81:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  101d84:	89 54 24 04          	mov    %edx,0x4(%esp)
  101d88:	89 04 24             	mov    %eax,(%esp)
  101d8b:	e8 37 12 00 00       	call   102fc7 <memmove>
        *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101d90:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101d93:	83 e8 04             	sub    $0x4,%eax
  101d96:	8b 15 8c f9 10 00    	mov    0x10f98c,%edx
  101d9c:	89 10                	mov    %edx,(%eax)
        cprintf("kbd [%03d] %c\n", c, c);

        if (c == '0') {
            //切换为内核态
            switch_to_kernel(tf);
            print_trapframe(tf);
  101d9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101da1:	89 04 24             	mov    %eax,(%esp)
  101da4:	e8 22 fc ff ff       	call   1019cb <print_trapframe>
        } else if (c == '3') {
            //切换为用户态
            switch_to_user(tf);
            print_trapframe(tf);
        }
        break;
  101da9:	e9 c7 02 00 00       	jmp    102075 <trap_dispatch+0x43d>

        if (c == '0') {
            //切换为内核态
            switch_to_kernel(tf);
            print_trapframe(tf);
        } else if (c == '3') {
  101dae:	80 7d e7 33          	cmpb   $0x33,-0x19(%ebp)
  101db2:	0f 85 bd 02 00 00    	jne    102075 <trap_dispatch+0x43d>
  101db8:	8b 45 08             	mov    0x8(%ebp),%eax
  101dbb:	89 45 e0             	mov    %eax,-0x20(%ebp)
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;
static struct trapframe *saved_tf;

static inline __attribute__((always_inline)) void switch_to_user(struct trapframe *tf) {
    if (tf->tf_cs != USER_CS) {
  101dbe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101dc1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101dc5:	83 f8 1b             	cmp    $0x1b,%eax
  101dc8:	0f 84 cf 00 00 00    	je     101e9d <trap_dispatch+0x265>
        // tf->tf_cs = USER_CS;
        // tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
        // tf->tf_eflags |= FL_IOPL_MASK;
        // tf->tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8
        
        switchk2u = *tf;
  101dce:	8b 55 e0             	mov    -0x20(%ebp),%edx
  101dd1:	b8 40 f9 10 00       	mov    $0x10f940,%eax
  101dd6:	bb 4c 00 00 00       	mov    $0x4c,%ebx
  101ddb:	89 c1                	mov    %eax,%ecx
  101ddd:	83 e1 01             	and    $0x1,%ecx
  101de0:	85 c9                	test   %ecx,%ecx
  101de2:	74 0c                	je     101df0 <trap_dispatch+0x1b8>
  101de4:	0f b6 0a             	movzbl (%edx),%ecx
  101de7:	88 08                	mov    %cl,(%eax)
  101de9:	8d 40 01             	lea    0x1(%eax),%eax
  101dec:	8d 52 01             	lea    0x1(%edx),%edx
  101def:	4b                   	dec    %ebx
  101df0:	89 c1                	mov    %eax,%ecx
  101df2:	83 e1 02             	and    $0x2,%ecx
  101df5:	85 c9                	test   %ecx,%ecx
  101df7:	74 0f                	je     101e08 <trap_dispatch+0x1d0>
  101df9:	0f b7 0a             	movzwl (%edx),%ecx
  101dfc:	66 89 08             	mov    %cx,(%eax)
  101dff:	8d 40 02             	lea    0x2(%eax),%eax
  101e02:	8d 52 02             	lea    0x2(%edx),%edx
  101e05:	83 eb 02             	sub    $0x2,%ebx
  101e08:	89 df                	mov    %ebx,%edi
  101e0a:	83 e7 fc             	and    $0xfffffffc,%edi
  101e0d:	b9 00 00 00 00       	mov    $0x0,%ecx
  101e12:	8b 34 0a             	mov    (%edx,%ecx,1),%esi
  101e15:	89 34 08             	mov    %esi,(%eax,%ecx,1)
  101e18:	83 c1 04             	add    $0x4,%ecx
  101e1b:	39 f9                	cmp    %edi,%ecx
  101e1d:	72 f3                	jb     101e12 <trap_dispatch+0x1da>
  101e1f:	01 c8                	add    %ecx,%eax
  101e21:	01 ca                	add    %ecx,%edx
  101e23:	b9 00 00 00 00       	mov    $0x0,%ecx
  101e28:	89 de                	mov    %ebx,%esi
  101e2a:	83 e6 02             	and    $0x2,%esi
  101e2d:	85 f6                	test   %esi,%esi
  101e2f:	74 0b                	je     101e3c <trap_dispatch+0x204>
  101e31:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
  101e35:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
  101e39:	83 c1 02             	add    $0x2,%ecx
  101e3c:	83 e3 01             	and    $0x1,%ebx
  101e3f:	85 db                	test   %ebx,%ebx
  101e41:	74 07                	je     101e4a <trap_dispatch+0x212>
  101e43:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
  101e47:	88 14 08             	mov    %dl,(%eax,%ecx,1)

        switchk2u.tf_cs = USER_CS;
  101e4a:	66 c7 05 7c f9 10 00 	movw   $0x1b,0x10f97c
  101e51:	1b 00 
        switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101e53:	66 c7 05 88 f9 10 00 	movw   $0x23,0x10f988
  101e5a:	23 00 
  101e5c:	0f b7 05 88 f9 10 00 	movzwl 0x10f988,%eax
  101e63:	66 a3 68 f9 10 00    	mov    %ax,0x10f968
  101e69:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101e70:	66 a3 6c f9 10 00    	mov    %ax,0x10f96c
        switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101e76:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101e79:	83 c0 44             	add    $0x44,%eax
  101e7c:	a3 84 f9 10 00       	mov    %eax,0x10f984
    
        // set eflags, make sure ucore can use io under user mode.
        // if CPL > IOPL, then cpu will generate a general protection.
        switchk2u.tf_eflags |= FL_IOPL_MASK;
  101e81:	a1 80 f9 10 00       	mov    0x10f980,%eax
  101e86:	0d 00 30 00 00       	or     $0x3000,%eax
  101e8b:	a3 80 f9 10 00       	mov    %eax,0x10f980
    
        // set temporary stack
        // then iret will jump to the right stack
        *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101e90:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101e93:	83 e8 04             	sub    $0x4,%eax
  101e96:	ba 40 f9 10 00       	mov    $0x10f940,%edx
  101e9b:	89 10                	mov    %edx,(%eax)
            switch_to_kernel(tf);
            print_trapframe(tf);
        } else if (c == '3') {
            //切换为用户态
            switch_to_user(tf);
            print_trapframe(tf);
  101e9d:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea0:	89 04 24             	mov    %eax,(%esp)
  101ea3:	e8 23 fb ff ff       	call   1019cb <print_trapframe>
        }
        break;
  101ea8:	e9 c8 01 00 00       	jmp    102075 <trap_dispatch+0x43d>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101ead:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101eb4:	83 f8 1b             	cmp    $0x1b,%eax
  101eb7:	0f 84 bb 01 00 00    	je     102078 <trap_dispatch+0x440>
  101ebd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec0:	89 45 dc             	mov    %eax,-0x24(%ebp)
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;
static struct trapframe *saved_tf;

static inline __attribute__((always_inline)) void switch_to_user(struct trapframe *tf) {
    if (tf->tf_cs != USER_CS) {
  101ec3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101ec6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101eca:	83 f8 1b             	cmp    $0x1b,%eax
  101ecd:	0f 84 a5 01 00 00    	je     102078 <trap_dispatch+0x440>
        // tf->tf_cs = USER_CS;
        // tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
        // tf->tf_eflags |= FL_IOPL_MASK;
        // tf->tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8
        
        switchk2u = *tf;
  101ed3:	8b 55 dc             	mov    -0x24(%ebp),%edx
  101ed6:	b8 40 f9 10 00       	mov    $0x10f940,%eax
  101edb:	bb 4c 00 00 00       	mov    $0x4c,%ebx
  101ee0:	89 c1                	mov    %eax,%ecx
  101ee2:	83 e1 01             	and    $0x1,%ecx
  101ee5:	85 c9                	test   %ecx,%ecx
  101ee7:	74 0c                	je     101ef5 <trap_dispatch+0x2bd>
  101ee9:	0f b6 0a             	movzbl (%edx),%ecx
  101eec:	88 08                	mov    %cl,(%eax)
  101eee:	8d 40 01             	lea    0x1(%eax),%eax
  101ef1:	8d 52 01             	lea    0x1(%edx),%edx
  101ef4:	4b                   	dec    %ebx
  101ef5:	89 c1                	mov    %eax,%ecx
  101ef7:	83 e1 02             	and    $0x2,%ecx
  101efa:	85 c9                	test   %ecx,%ecx
  101efc:	74 0f                	je     101f0d <trap_dispatch+0x2d5>
  101efe:	0f b7 0a             	movzwl (%edx),%ecx
  101f01:	66 89 08             	mov    %cx,(%eax)
  101f04:	8d 40 02             	lea    0x2(%eax),%eax
  101f07:	8d 52 02             	lea    0x2(%edx),%edx
  101f0a:	83 eb 02             	sub    $0x2,%ebx
  101f0d:	89 df                	mov    %ebx,%edi
  101f0f:	83 e7 fc             	and    $0xfffffffc,%edi
  101f12:	b9 00 00 00 00       	mov    $0x0,%ecx
  101f17:	8b 34 0a             	mov    (%edx,%ecx,1),%esi
  101f1a:	89 34 08             	mov    %esi,(%eax,%ecx,1)
  101f1d:	83 c1 04             	add    $0x4,%ecx
  101f20:	39 f9                	cmp    %edi,%ecx
  101f22:	72 f3                	jb     101f17 <trap_dispatch+0x2df>
  101f24:	01 c8                	add    %ecx,%eax
  101f26:	01 ca                	add    %ecx,%edx
  101f28:	b9 00 00 00 00       	mov    $0x0,%ecx
  101f2d:	89 de                	mov    %ebx,%esi
  101f2f:	83 e6 02             	and    $0x2,%esi
  101f32:	85 f6                	test   %esi,%esi
  101f34:	74 0b                	je     101f41 <trap_dispatch+0x309>
  101f36:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
  101f3a:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
  101f3e:	83 c1 02             	add    $0x2,%ecx
  101f41:	83 e3 01             	and    $0x1,%ebx
  101f44:	85 db                	test   %ebx,%ebx
  101f46:	74 07                	je     101f4f <trap_dispatch+0x317>
  101f48:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
  101f4c:	88 14 08             	mov    %dl,(%eax,%ecx,1)

        switchk2u.tf_cs = USER_CS;
  101f4f:	66 c7 05 7c f9 10 00 	movw   $0x1b,0x10f97c
  101f56:	1b 00 
        switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101f58:	66 c7 05 88 f9 10 00 	movw   $0x23,0x10f988
  101f5f:	23 00 
  101f61:	0f b7 05 88 f9 10 00 	movzwl 0x10f988,%eax
  101f68:	66 a3 68 f9 10 00    	mov    %ax,0x10f968
  101f6e:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101f75:	66 a3 6c f9 10 00    	mov    %ax,0x10f96c
        switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101f7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101f7e:	83 c0 44             	add    $0x44,%eax
  101f81:	a3 84 f9 10 00       	mov    %eax,0x10f984
    
        // set eflags, make sure ucore can use io under user mode.
        // if CPL > IOPL, then cpu will generate a general protection.
        switchk2u.tf_eflags |= FL_IOPL_MASK;
  101f86:	a1 80 f9 10 00       	mov    0x10f980,%eax
  101f8b:	0d 00 30 00 00       	or     $0x3000,%eax
  101f90:	a3 80 f9 10 00       	mov    %eax,0x10f980
    
        // set temporary stack
        // then iret will jump to the right stack
        *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101f95:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101f98:	83 e8 04             	sub    $0x4,%eax
  101f9b:	ba 40 f9 10 00       	mov    $0x10f940,%edx
  101fa0:	89 10                	mov    %edx,(%eax)
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
            switch_to_user(tf);
        }
        break;
  101fa2:	e9 d1 00 00 00       	jmp    102078 <trap_dispatch+0x440>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101fa7:	8b 45 08             	mov    0x8(%ebp),%eax
  101faa:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101fae:	83 f8 08             	cmp    $0x8,%eax
  101fb1:	0f 84 c4 00 00 00    	je     10207b <trap_dispatch+0x443>
  101fb7:	8b 45 08             	mov    0x8(%ebp),%eax
  101fba:	89 45 d8             	mov    %eax,-0x28(%ebp)
        *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
        }
}

static inline __attribute__((always_inline)) void switch_to_kernel(struct trapframe *tf) {
    if (tf->tf_cs != KERNEL_CS) {
  101fbd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101fc0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101fc4:	83 f8 08             	cmp    $0x8,%eax
  101fc7:	0f 84 ae 00 00 00    	je     10207b <trap_dispatch+0x443>
        tf->tf_cs = KERNEL_CS;
  101fcd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101fd0:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
        tf->tf_ds = tf->tf_es = KERNEL_DS;
  101fd6:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101fd9:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101fdf:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101fe2:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101fe6:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101fe9:	66 89 50 2c          	mov    %dx,0x2c(%eax)
        tf->tf_eflags &= ~FL_IOPL_MASK;
  101fed:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101ff0:	8b 40 40             	mov    0x40(%eax),%eax
  101ff3:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101ff8:	89 c2                	mov    %eax,%edx
  101ffa:	8b 45 d8             	mov    -0x28(%ebp),%eax
  101ffd:	89 50 40             	mov    %edx,0x40(%eax)
        switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  102000:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102003:	8b 40 44             	mov    0x44(%eax),%eax
  102006:	83 e8 44             	sub    $0x44,%eax
  102009:	a3 8c f9 10 00       	mov    %eax,0x10f98c

        memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  10200e:	a1 8c f9 10 00       	mov    0x10f98c,%eax
  102013:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  10201a:	00 
  10201b:	8b 55 d8             	mov    -0x28(%ebp),%edx
  10201e:	89 54 24 04          	mov    %edx,0x4(%esp)
  102022:	89 04 24             	mov    %eax,(%esp)
  102025:	e8 9d 0f 00 00       	call   102fc7 <memmove>
        *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  10202a:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10202d:	83 e8 04             	sub    $0x4,%eax
  102030:	8b 15 8c f9 10 00    	mov    0x10f98c,%edx
  102036:	89 10                	mov    %edx,(%eax)
        break;
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
            switch_to_kernel(tf);
        }
        break;
  102038:	eb 41                	jmp    10207b <trap_dispatch+0x443>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  10203a:	8b 45 08             	mov    0x8(%ebp),%eax
  10203d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  102041:	83 e0 03             	and    $0x3,%eax
  102044:	85 c0                	test   %eax,%eax
  102046:	75 34                	jne    10207c <trap_dispatch+0x444>
            print_trapframe(tf);
  102048:	8b 45 08             	mov    0x8(%ebp),%eax
  10204b:	89 04 24             	mov    %eax,(%esp)
  10204e:	e8 78 f9 ff ff       	call   1019cb <print_trapframe>
            panic("unexpected trap in kernel.\n");
  102053:	c7 44 24 08 d5 3c 10 	movl   $0x103cd5,0x8(%esp)
  10205a:	00 
  10205b:	c7 44 24 04 f7 00 00 	movl   $0xf7,0x4(%esp)
  102062:	00 
  102063:	c7 04 24 f1 3c 10 00 	movl   $0x103cf1,(%esp)
  10206a:	e8 54 e3 ff ff       	call   1003c3 <__panic>
        }
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  10206f:	90                   	nop
  102070:	eb 0a                	jmp    10207c <trap_dispatch+0x444>
         */
        ticks = ticks + 1;
        if (ticks % TICK_NUM == 0){
            print_ticks();
        }
        break;
  102072:	90                   	nop
  102073:	eb 07                	jmp    10207c <trap_dispatch+0x444>
        } else if (c == '3') {
            //切换为用户态
            switch_to_user(tf);
            print_trapframe(tf);
        }
        break;
  102075:	90                   	nop
  102076:	eb 04                	jmp    10207c <trap_dispatch+0x444>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
            switch_to_user(tf);
        }
        break;
  102078:	90                   	nop
  102079:	eb 01                	jmp    10207c <trap_dispatch+0x444>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
            switch_to_kernel(tf);
        }
        break;
  10207b:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  10207c:	90                   	nop
  10207d:	83 c4 3c             	add    $0x3c,%esp
  102080:	5b                   	pop    %ebx
  102081:	5e                   	pop    %esi
  102082:	5f                   	pop    %edi
  102083:	5d                   	pop    %ebp
  102084:	c3                   	ret    

00102085 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  102085:	55                   	push   %ebp
  102086:	89 e5                	mov    %esp,%ebp
  102088:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  10208b:	8b 45 08             	mov    0x8(%ebp),%eax
  10208e:	89 04 24             	mov    %eax,(%esp)
  102091:	e8 a2 fb ff ff       	call   101c38 <trap_dispatch>
}
  102096:	90                   	nop
  102097:	c9                   	leave  
  102098:	c3                   	ret    

00102099 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $0
  10209b:	6a 00                	push   $0x0
  jmp __alltraps
  10209d:	e9 69 0a 00 00       	jmp    102b0b <__alltraps>

001020a2 <vector1>:
.globl vector1
vector1:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $1
  1020a4:	6a 01                	push   $0x1
  jmp __alltraps
  1020a6:	e9 60 0a 00 00       	jmp    102b0b <__alltraps>

001020ab <vector2>:
.globl vector2
vector2:
  pushl $0
  1020ab:	6a 00                	push   $0x0
  pushl $2
  1020ad:	6a 02                	push   $0x2
  jmp __alltraps
  1020af:	e9 57 0a 00 00       	jmp    102b0b <__alltraps>

001020b4 <vector3>:
.globl vector3
vector3:
  pushl $0
  1020b4:	6a 00                	push   $0x0
  pushl $3
  1020b6:	6a 03                	push   $0x3
  jmp __alltraps
  1020b8:	e9 4e 0a 00 00       	jmp    102b0b <__alltraps>

001020bd <vector4>:
.globl vector4
vector4:
  pushl $0
  1020bd:	6a 00                	push   $0x0
  pushl $4
  1020bf:	6a 04                	push   $0x4
  jmp __alltraps
  1020c1:	e9 45 0a 00 00       	jmp    102b0b <__alltraps>

001020c6 <vector5>:
.globl vector5
vector5:
  pushl $0
  1020c6:	6a 00                	push   $0x0
  pushl $5
  1020c8:	6a 05                	push   $0x5
  jmp __alltraps
  1020ca:	e9 3c 0a 00 00       	jmp    102b0b <__alltraps>

001020cf <vector6>:
.globl vector6
vector6:
  pushl $0
  1020cf:	6a 00                	push   $0x0
  pushl $6
  1020d1:	6a 06                	push   $0x6
  jmp __alltraps
  1020d3:	e9 33 0a 00 00       	jmp    102b0b <__alltraps>

001020d8 <vector7>:
.globl vector7
vector7:
  pushl $0
  1020d8:	6a 00                	push   $0x0
  pushl $7
  1020da:	6a 07                	push   $0x7
  jmp __alltraps
  1020dc:	e9 2a 0a 00 00       	jmp    102b0b <__alltraps>

001020e1 <vector8>:
.globl vector8
vector8:
  pushl $8
  1020e1:	6a 08                	push   $0x8
  jmp __alltraps
  1020e3:	e9 23 0a 00 00       	jmp    102b0b <__alltraps>

001020e8 <vector9>:
.globl vector9
vector9:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $9
  1020ea:	6a 09                	push   $0x9
  jmp __alltraps
  1020ec:	e9 1a 0a 00 00       	jmp    102b0b <__alltraps>

001020f1 <vector10>:
.globl vector10
vector10:
  pushl $10
  1020f1:	6a 0a                	push   $0xa
  jmp __alltraps
  1020f3:	e9 13 0a 00 00       	jmp    102b0b <__alltraps>

001020f8 <vector11>:
.globl vector11
vector11:
  pushl $11
  1020f8:	6a 0b                	push   $0xb
  jmp __alltraps
  1020fa:	e9 0c 0a 00 00       	jmp    102b0b <__alltraps>

001020ff <vector12>:
.globl vector12
vector12:
  pushl $12
  1020ff:	6a 0c                	push   $0xc
  jmp __alltraps
  102101:	e9 05 0a 00 00       	jmp    102b0b <__alltraps>

00102106 <vector13>:
.globl vector13
vector13:
  pushl $13
  102106:	6a 0d                	push   $0xd
  jmp __alltraps
  102108:	e9 fe 09 00 00       	jmp    102b0b <__alltraps>

0010210d <vector14>:
.globl vector14
vector14:
  pushl $14
  10210d:	6a 0e                	push   $0xe
  jmp __alltraps
  10210f:	e9 f7 09 00 00       	jmp    102b0b <__alltraps>

00102114 <vector15>:
.globl vector15
vector15:
  pushl $0
  102114:	6a 00                	push   $0x0
  pushl $15
  102116:	6a 0f                	push   $0xf
  jmp __alltraps
  102118:	e9 ee 09 00 00       	jmp    102b0b <__alltraps>

0010211d <vector16>:
.globl vector16
vector16:
  pushl $0
  10211d:	6a 00                	push   $0x0
  pushl $16
  10211f:	6a 10                	push   $0x10
  jmp __alltraps
  102121:	e9 e5 09 00 00       	jmp    102b0b <__alltraps>

00102126 <vector17>:
.globl vector17
vector17:
  pushl $17
  102126:	6a 11                	push   $0x11
  jmp __alltraps
  102128:	e9 de 09 00 00       	jmp    102b0b <__alltraps>

0010212d <vector18>:
.globl vector18
vector18:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $18
  10212f:	6a 12                	push   $0x12
  jmp __alltraps
  102131:	e9 d5 09 00 00       	jmp    102b0b <__alltraps>

00102136 <vector19>:
.globl vector19
vector19:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $19
  102138:	6a 13                	push   $0x13
  jmp __alltraps
  10213a:	e9 cc 09 00 00       	jmp    102b0b <__alltraps>

0010213f <vector20>:
.globl vector20
vector20:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $20
  102141:	6a 14                	push   $0x14
  jmp __alltraps
  102143:	e9 c3 09 00 00       	jmp    102b0b <__alltraps>

00102148 <vector21>:
.globl vector21
vector21:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $21
  10214a:	6a 15                	push   $0x15
  jmp __alltraps
  10214c:	e9 ba 09 00 00       	jmp    102b0b <__alltraps>

00102151 <vector22>:
.globl vector22
vector22:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $22
  102153:	6a 16                	push   $0x16
  jmp __alltraps
  102155:	e9 b1 09 00 00       	jmp    102b0b <__alltraps>

0010215a <vector23>:
.globl vector23
vector23:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $23
  10215c:	6a 17                	push   $0x17
  jmp __alltraps
  10215e:	e9 a8 09 00 00       	jmp    102b0b <__alltraps>

00102163 <vector24>:
.globl vector24
vector24:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $24
  102165:	6a 18                	push   $0x18
  jmp __alltraps
  102167:	e9 9f 09 00 00       	jmp    102b0b <__alltraps>

0010216c <vector25>:
.globl vector25
vector25:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $25
  10216e:	6a 19                	push   $0x19
  jmp __alltraps
  102170:	e9 96 09 00 00       	jmp    102b0b <__alltraps>

00102175 <vector26>:
.globl vector26
vector26:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $26
  102177:	6a 1a                	push   $0x1a
  jmp __alltraps
  102179:	e9 8d 09 00 00       	jmp    102b0b <__alltraps>

0010217e <vector27>:
.globl vector27
vector27:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $27
  102180:	6a 1b                	push   $0x1b
  jmp __alltraps
  102182:	e9 84 09 00 00       	jmp    102b0b <__alltraps>

00102187 <vector28>:
.globl vector28
vector28:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $28
  102189:	6a 1c                	push   $0x1c
  jmp __alltraps
  10218b:	e9 7b 09 00 00       	jmp    102b0b <__alltraps>

00102190 <vector29>:
.globl vector29
vector29:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $29
  102192:	6a 1d                	push   $0x1d
  jmp __alltraps
  102194:	e9 72 09 00 00       	jmp    102b0b <__alltraps>

00102199 <vector30>:
.globl vector30
vector30:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $30
  10219b:	6a 1e                	push   $0x1e
  jmp __alltraps
  10219d:	e9 69 09 00 00       	jmp    102b0b <__alltraps>

001021a2 <vector31>:
.globl vector31
vector31:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $31
  1021a4:	6a 1f                	push   $0x1f
  jmp __alltraps
  1021a6:	e9 60 09 00 00       	jmp    102b0b <__alltraps>

001021ab <vector32>:
.globl vector32
vector32:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $32
  1021ad:	6a 20                	push   $0x20
  jmp __alltraps
  1021af:	e9 57 09 00 00       	jmp    102b0b <__alltraps>

001021b4 <vector33>:
.globl vector33
vector33:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $33
  1021b6:	6a 21                	push   $0x21
  jmp __alltraps
  1021b8:	e9 4e 09 00 00       	jmp    102b0b <__alltraps>

001021bd <vector34>:
.globl vector34
vector34:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $34
  1021bf:	6a 22                	push   $0x22
  jmp __alltraps
  1021c1:	e9 45 09 00 00       	jmp    102b0b <__alltraps>

001021c6 <vector35>:
.globl vector35
vector35:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $35
  1021c8:	6a 23                	push   $0x23
  jmp __alltraps
  1021ca:	e9 3c 09 00 00       	jmp    102b0b <__alltraps>

001021cf <vector36>:
.globl vector36
vector36:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $36
  1021d1:	6a 24                	push   $0x24
  jmp __alltraps
  1021d3:	e9 33 09 00 00       	jmp    102b0b <__alltraps>

001021d8 <vector37>:
.globl vector37
vector37:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $37
  1021da:	6a 25                	push   $0x25
  jmp __alltraps
  1021dc:	e9 2a 09 00 00       	jmp    102b0b <__alltraps>

001021e1 <vector38>:
.globl vector38
vector38:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $38
  1021e3:	6a 26                	push   $0x26
  jmp __alltraps
  1021e5:	e9 21 09 00 00       	jmp    102b0b <__alltraps>

001021ea <vector39>:
.globl vector39
vector39:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $39
  1021ec:	6a 27                	push   $0x27
  jmp __alltraps
  1021ee:	e9 18 09 00 00       	jmp    102b0b <__alltraps>

001021f3 <vector40>:
.globl vector40
vector40:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $40
  1021f5:	6a 28                	push   $0x28
  jmp __alltraps
  1021f7:	e9 0f 09 00 00       	jmp    102b0b <__alltraps>

001021fc <vector41>:
.globl vector41
vector41:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $41
  1021fe:	6a 29                	push   $0x29
  jmp __alltraps
  102200:	e9 06 09 00 00       	jmp    102b0b <__alltraps>

00102205 <vector42>:
.globl vector42
vector42:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $42
  102207:	6a 2a                	push   $0x2a
  jmp __alltraps
  102209:	e9 fd 08 00 00       	jmp    102b0b <__alltraps>

0010220e <vector43>:
.globl vector43
vector43:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $43
  102210:	6a 2b                	push   $0x2b
  jmp __alltraps
  102212:	e9 f4 08 00 00       	jmp    102b0b <__alltraps>

00102217 <vector44>:
.globl vector44
vector44:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $44
  102219:	6a 2c                	push   $0x2c
  jmp __alltraps
  10221b:	e9 eb 08 00 00       	jmp    102b0b <__alltraps>

00102220 <vector45>:
.globl vector45
vector45:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $45
  102222:	6a 2d                	push   $0x2d
  jmp __alltraps
  102224:	e9 e2 08 00 00       	jmp    102b0b <__alltraps>

00102229 <vector46>:
.globl vector46
vector46:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $46
  10222b:	6a 2e                	push   $0x2e
  jmp __alltraps
  10222d:	e9 d9 08 00 00       	jmp    102b0b <__alltraps>

00102232 <vector47>:
.globl vector47
vector47:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $47
  102234:	6a 2f                	push   $0x2f
  jmp __alltraps
  102236:	e9 d0 08 00 00       	jmp    102b0b <__alltraps>

0010223b <vector48>:
.globl vector48
vector48:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $48
  10223d:	6a 30                	push   $0x30
  jmp __alltraps
  10223f:	e9 c7 08 00 00       	jmp    102b0b <__alltraps>

00102244 <vector49>:
.globl vector49
vector49:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $49
  102246:	6a 31                	push   $0x31
  jmp __alltraps
  102248:	e9 be 08 00 00       	jmp    102b0b <__alltraps>

0010224d <vector50>:
.globl vector50
vector50:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $50
  10224f:	6a 32                	push   $0x32
  jmp __alltraps
  102251:	e9 b5 08 00 00       	jmp    102b0b <__alltraps>

00102256 <vector51>:
.globl vector51
vector51:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $51
  102258:	6a 33                	push   $0x33
  jmp __alltraps
  10225a:	e9 ac 08 00 00       	jmp    102b0b <__alltraps>

0010225f <vector52>:
.globl vector52
vector52:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $52
  102261:	6a 34                	push   $0x34
  jmp __alltraps
  102263:	e9 a3 08 00 00       	jmp    102b0b <__alltraps>

00102268 <vector53>:
.globl vector53
vector53:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $53
  10226a:	6a 35                	push   $0x35
  jmp __alltraps
  10226c:	e9 9a 08 00 00       	jmp    102b0b <__alltraps>

00102271 <vector54>:
.globl vector54
vector54:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $54
  102273:	6a 36                	push   $0x36
  jmp __alltraps
  102275:	e9 91 08 00 00       	jmp    102b0b <__alltraps>

0010227a <vector55>:
.globl vector55
vector55:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $55
  10227c:	6a 37                	push   $0x37
  jmp __alltraps
  10227e:	e9 88 08 00 00       	jmp    102b0b <__alltraps>

00102283 <vector56>:
.globl vector56
vector56:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $56
  102285:	6a 38                	push   $0x38
  jmp __alltraps
  102287:	e9 7f 08 00 00       	jmp    102b0b <__alltraps>

0010228c <vector57>:
.globl vector57
vector57:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $57
  10228e:	6a 39                	push   $0x39
  jmp __alltraps
  102290:	e9 76 08 00 00       	jmp    102b0b <__alltraps>

00102295 <vector58>:
.globl vector58
vector58:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $58
  102297:	6a 3a                	push   $0x3a
  jmp __alltraps
  102299:	e9 6d 08 00 00       	jmp    102b0b <__alltraps>

0010229e <vector59>:
.globl vector59
vector59:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $59
  1022a0:	6a 3b                	push   $0x3b
  jmp __alltraps
  1022a2:	e9 64 08 00 00       	jmp    102b0b <__alltraps>

001022a7 <vector60>:
.globl vector60
vector60:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $60
  1022a9:	6a 3c                	push   $0x3c
  jmp __alltraps
  1022ab:	e9 5b 08 00 00       	jmp    102b0b <__alltraps>

001022b0 <vector61>:
.globl vector61
vector61:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $61
  1022b2:	6a 3d                	push   $0x3d
  jmp __alltraps
  1022b4:	e9 52 08 00 00       	jmp    102b0b <__alltraps>

001022b9 <vector62>:
.globl vector62
vector62:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $62
  1022bb:	6a 3e                	push   $0x3e
  jmp __alltraps
  1022bd:	e9 49 08 00 00       	jmp    102b0b <__alltraps>

001022c2 <vector63>:
.globl vector63
vector63:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $63
  1022c4:	6a 3f                	push   $0x3f
  jmp __alltraps
  1022c6:	e9 40 08 00 00       	jmp    102b0b <__alltraps>

001022cb <vector64>:
.globl vector64
vector64:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $64
  1022cd:	6a 40                	push   $0x40
  jmp __alltraps
  1022cf:	e9 37 08 00 00       	jmp    102b0b <__alltraps>

001022d4 <vector65>:
.globl vector65
vector65:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $65
  1022d6:	6a 41                	push   $0x41
  jmp __alltraps
  1022d8:	e9 2e 08 00 00       	jmp    102b0b <__alltraps>

001022dd <vector66>:
.globl vector66
vector66:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $66
  1022df:	6a 42                	push   $0x42
  jmp __alltraps
  1022e1:	e9 25 08 00 00       	jmp    102b0b <__alltraps>

001022e6 <vector67>:
.globl vector67
vector67:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $67
  1022e8:	6a 43                	push   $0x43
  jmp __alltraps
  1022ea:	e9 1c 08 00 00       	jmp    102b0b <__alltraps>

001022ef <vector68>:
.globl vector68
vector68:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $68
  1022f1:	6a 44                	push   $0x44
  jmp __alltraps
  1022f3:	e9 13 08 00 00       	jmp    102b0b <__alltraps>

001022f8 <vector69>:
.globl vector69
vector69:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $69
  1022fa:	6a 45                	push   $0x45
  jmp __alltraps
  1022fc:	e9 0a 08 00 00       	jmp    102b0b <__alltraps>

00102301 <vector70>:
.globl vector70
vector70:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $70
  102303:	6a 46                	push   $0x46
  jmp __alltraps
  102305:	e9 01 08 00 00       	jmp    102b0b <__alltraps>

0010230a <vector71>:
.globl vector71
vector71:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $71
  10230c:	6a 47                	push   $0x47
  jmp __alltraps
  10230e:	e9 f8 07 00 00       	jmp    102b0b <__alltraps>

00102313 <vector72>:
.globl vector72
vector72:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $72
  102315:	6a 48                	push   $0x48
  jmp __alltraps
  102317:	e9 ef 07 00 00       	jmp    102b0b <__alltraps>

0010231c <vector73>:
.globl vector73
vector73:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $73
  10231e:	6a 49                	push   $0x49
  jmp __alltraps
  102320:	e9 e6 07 00 00       	jmp    102b0b <__alltraps>

00102325 <vector74>:
.globl vector74
vector74:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $74
  102327:	6a 4a                	push   $0x4a
  jmp __alltraps
  102329:	e9 dd 07 00 00       	jmp    102b0b <__alltraps>

0010232e <vector75>:
.globl vector75
vector75:
  pushl $0
  10232e:	6a 00                	push   $0x0
  pushl $75
  102330:	6a 4b                	push   $0x4b
  jmp __alltraps
  102332:	e9 d4 07 00 00       	jmp    102b0b <__alltraps>

00102337 <vector76>:
.globl vector76
vector76:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $76
  102339:	6a 4c                	push   $0x4c
  jmp __alltraps
  10233b:	e9 cb 07 00 00       	jmp    102b0b <__alltraps>

00102340 <vector77>:
.globl vector77
vector77:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $77
  102342:	6a 4d                	push   $0x4d
  jmp __alltraps
  102344:	e9 c2 07 00 00       	jmp    102b0b <__alltraps>

00102349 <vector78>:
.globl vector78
vector78:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $78
  10234b:	6a 4e                	push   $0x4e
  jmp __alltraps
  10234d:	e9 b9 07 00 00       	jmp    102b0b <__alltraps>

00102352 <vector79>:
.globl vector79
vector79:
  pushl $0
  102352:	6a 00                	push   $0x0
  pushl $79
  102354:	6a 4f                	push   $0x4f
  jmp __alltraps
  102356:	e9 b0 07 00 00       	jmp    102b0b <__alltraps>

0010235b <vector80>:
.globl vector80
vector80:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $80
  10235d:	6a 50                	push   $0x50
  jmp __alltraps
  10235f:	e9 a7 07 00 00       	jmp    102b0b <__alltraps>

00102364 <vector81>:
.globl vector81
vector81:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $81
  102366:	6a 51                	push   $0x51
  jmp __alltraps
  102368:	e9 9e 07 00 00       	jmp    102b0b <__alltraps>

0010236d <vector82>:
.globl vector82
vector82:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $82
  10236f:	6a 52                	push   $0x52
  jmp __alltraps
  102371:	e9 95 07 00 00       	jmp    102b0b <__alltraps>

00102376 <vector83>:
.globl vector83
vector83:
  pushl $0
  102376:	6a 00                	push   $0x0
  pushl $83
  102378:	6a 53                	push   $0x53
  jmp __alltraps
  10237a:	e9 8c 07 00 00       	jmp    102b0b <__alltraps>

0010237f <vector84>:
.globl vector84
vector84:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $84
  102381:	6a 54                	push   $0x54
  jmp __alltraps
  102383:	e9 83 07 00 00       	jmp    102b0b <__alltraps>

00102388 <vector85>:
.globl vector85
vector85:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $85
  10238a:	6a 55                	push   $0x55
  jmp __alltraps
  10238c:	e9 7a 07 00 00       	jmp    102b0b <__alltraps>

00102391 <vector86>:
.globl vector86
vector86:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $86
  102393:	6a 56                	push   $0x56
  jmp __alltraps
  102395:	e9 71 07 00 00       	jmp    102b0b <__alltraps>

0010239a <vector87>:
.globl vector87
vector87:
  pushl $0
  10239a:	6a 00                	push   $0x0
  pushl $87
  10239c:	6a 57                	push   $0x57
  jmp __alltraps
  10239e:	e9 68 07 00 00       	jmp    102b0b <__alltraps>

001023a3 <vector88>:
.globl vector88
vector88:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $88
  1023a5:	6a 58                	push   $0x58
  jmp __alltraps
  1023a7:	e9 5f 07 00 00       	jmp    102b0b <__alltraps>

001023ac <vector89>:
.globl vector89
vector89:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $89
  1023ae:	6a 59                	push   $0x59
  jmp __alltraps
  1023b0:	e9 56 07 00 00       	jmp    102b0b <__alltraps>

001023b5 <vector90>:
.globl vector90
vector90:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $90
  1023b7:	6a 5a                	push   $0x5a
  jmp __alltraps
  1023b9:	e9 4d 07 00 00       	jmp    102b0b <__alltraps>

001023be <vector91>:
.globl vector91
vector91:
  pushl $0
  1023be:	6a 00                	push   $0x0
  pushl $91
  1023c0:	6a 5b                	push   $0x5b
  jmp __alltraps
  1023c2:	e9 44 07 00 00       	jmp    102b0b <__alltraps>

001023c7 <vector92>:
.globl vector92
vector92:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $92
  1023c9:	6a 5c                	push   $0x5c
  jmp __alltraps
  1023cb:	e9 3b 07 00 00       	jmp    102b0b <__alltraps>

001023d0 <vector93>:
.globl vector93
vector93:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $93
  1023d2:	6a 5d                	push   $0x5d
  jmp __alltraps
  1023d4:	e9 32 07 00 00       	jmp    102b0b <__alltraps>

001023d9 <vector94>:
.globl vector94
vector94:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $94
  1023db:	6a 5e                	push   $0x5e
  jmp __alltraps
  1023dd:	e9 29 07 00 00       	jmp    102b0b <__alltraps>

001023e2 <vector95>:
.globl vector95
vector95:
  pushl $0
  1023e2:	6a 00                	push   $0x0
  pushl $95
  1023e4:	6a 5f                	push   $0x5f
  jmp __alltraps
  1023e6:	e9 20 07 00 00       	jmp    102b0b <__alltraps>

001023eb <vector96>:
.globl vector96
vector96:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $96
  1023ed:	6a 60                	push   $0x60
  jmp __alltraps
  1023ef:	e9 17 07 00 00       	jmp    102b0b <__alltraps>

001023f4 <vector97>:
.globl vector97
vector97:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $97
  1023f6:	6a 61                	push   $0x61
  jmp __alltraps
  1023f8:	e9 0e 07 00 00       	jmp    102b0b <__alltraps>

001023fd <vector98>:
.globl vector98
vector98:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $98
  1023ff:	6a 62                	push   $0x62
  jmp __alltraps
  102401:	e9 05 07 00 00       	jmp    102b0b <__alltraps>

00102406 <vector99>:
.globl vector99
vector99:
  pushl $0
  102406:	6a 00                	push   $0x0
  pushl $99
  102408:	6a 63                	push   $0x63
  jmp __alltraps
  10240a:	e9 fc 06 00 00       	jmp    102b0b <__alltraps>

0010240f <vector100>:
.globl vector100
vector100:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $100
  102411:	6a 64                	push   $0x64
  jmp __alltraps
  102413:	e9 f3 06 00 00       	jmp    102b0b <__alltraps>

00102418 <vector101>:
.globl vector101
vector101:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $101
  10241a:	6a 65                	push   $0x65
  jmp __alltraps
  10241c:	e9 ea 06 00 00       	jmp    102b0b <__alltraps>

00102421 <vector102>:
.globl vector102
vector102:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $102
  102423:	6a 66                	push   $0x66
  jmp __alltraps
  102425:	e9 e1 06 00 00       	jmp    102b0b <__alltraps>

0010242a <vector103>:
.globl vector103
vector103:
  pushl $0
  10242a:	6a 00                	push   $0x0
  pushl $103
  10242c:	6a 67                	push   $0x67
  jmp __alltraps
  10242e:	e9 d8 06 00 00       	jmp    102b0b <__alltraps>

00102433 <vector104>:
.globl vector104
vector104:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $104
  102435:	6a 68                	push   $0x68
  jmp __alltraps
  102437:	e9 cf 06 00 00       	jmp    102b0b <__alltraps>

0010243c <vector105>:
.globl vector105
vector105:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $105
  10243e:	6a 69                	push   $0x69
  jmp __alltraps
  102440:	e9 c6 06 00 00       	jmp    102b0b <__alltraps>

00102445 <vector106>:
.globl vector106
vector106:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $106
  102447:	6a 6a                	push   $0x6a
  jmp __alltraps
  102449:	e9 bd 06 00 00       	jmp    102b0b <__alltraps>

0010244e <vector107>:
.globl vector107
vector107:
  pushl $0
  10244e:	6a 00                	push   $0x0
  pushl $107
  102450:	6a 6b                	push   $0x6b
  jmp __alltraps
  102452:	e9 b4 06 00 00       	jmp    102b0b <__alltraps>

00102457 <vector108>:
.globl vector108
vector108:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $108
  102459:	6a 6c                	push   $0x6c
  jmp __alltraps
  10245b:	e9 ab 06 00 00       	jmp    102b0b <__alltraps>

00102460 <vector109>:
.globl vector109
vector109:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $109
  102462:	6a 6d                	push   $0x6d
  jmp __alltraps
  102464:	e9 a2 06 00 00       	jmp    102b0b <__alltraps>

00102469 <vector110>:
.globl vector110
vector110:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $110
  10246b:	6a 6e                	push   $0x6e
  jmp __alltraps
  10246d:	e9 99 06 00 00       	jmp    102b0b <__alltraps>

00102472 <vector111>:
.globl vector111
vector111:
  pushl $0
  102472:	6a 00                	push   $0x0
  pushl $111
  102474:	6a 6f                	push   $0x6f
  jmp __alltraps
  102476:	e9 90 06 00 00       	jmp    102b0b <__alltraps>

0010247b <vector112>:
.globl vector112
vector112:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $112
  10247d:	6a 70                	push   $0x70
  jmp __alltraps
  10247f:	e9 87 06 00 00       	jmp    102b0b <__alltraps>

00102484 <vector113>:
.globl vector113
vector113:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $113
  102486:	6a 71                	push   $0x71
  jmp __alltraps
  102488:	e9 7e 06 00 00       	jmp    102b0b <__alltraps>

0010248d <vector114>:
.globl vector114
vector114:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $114
  10248f:	6a 72                	push   $0x72
  jmp __alltraps
  102491:	e9 75 06 00 00       	jmp    102b0b <__alltraps>

00102496 <vector115>:
.globl vector115
vector115:
  pushl $0
  102496:	6a 00                	push   $0x0
  pushl $115
  102498:	6a 73                	push   $0x73
  jmp __alltraps
  10249a:	e9 6c 06 00 00       	jmp    102b0b <__alltraps>

0010249f <vector116>:
.globl vector116
vector116:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $116
  1024a1:	6a 74                	push   $0x74
  jmp __alltraps
  1024a3:	e9 63 06 00 00       	jmp    102b0b <__alltraps>

001024a8 <vector117>:
.globl vector117
vector117:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $117
  1024aa:	6a 75                	push   $0x75
  jmp __alltraps
  1024ac:	e9 5a 06 00 00       	jmp    102b0b <__alltraps>

001024b1 <vector118>:
.globl vector118
vector118:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $118
  1024b3:	6a 76                	push   $0x76
  jmp __alltraps
  1024b5:	e9 51 06 00 00       	jmp    102b0b <__alltraps>

001024ba <vector119>:
.globl vector119
vector119:
  pushl $0
  1024ba:	6a 00                	push   $0x0
  pushl $119
  1024bc:	6a 77                	push   $0x77
  jmp __alltraps
  1024be:	e9 48 06 00 00       	jmp    102b0b <__alltraps>

001024c3 <vector120>:
.globl vector120
vector120:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $120
  1024c5:	6a 78                	push   $0x78
  jmp __alltraps
  1024c7:	e9 3f 06 00 00       	jmp    102b0b <__alltraps>

001024cc <vector121>:
.globl vector121
vector121:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $121
  1024ce:	6a 79                	push   $0x79
  jmp __alltraps
  1024d0:	e9 36 06 00 00       	jmp    102b0b <__alltraps>

001024d5 <vector122>:
.globl vector122
vector122:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $122
  1024d7:	6a 7a                	push   $0x7a
  jmp __alltraps
  1024d9:	e9 2d 06 00 00       	jmp    102b0b <__alltraps>

001024de <vector123>:
.globl vector123
vector123:
  pushl $0
  1024de:	6a 00                	push   $0x0
  pushl $123
  1024e0:	6a 7b                	push   $0x7b
  jmp __alltraps
  1024e2:	e9 24 06 00 00       	jmp    102b0b <__alltraps>

001024e7 <vector124>:
.globl vector124
vector124:
  pushl $0
  1024e7:	6a 00                	push   $0x0
  pushl $124
  1024e9:	6a 7c                	push   $0x7c
  jmp __alltraps
  1024eb:	e9 1b 06 00 00       	jmp    102b0b <__alltraps>

001024f0 <vector125>:
.globl vector125
vector125:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $125
  1024f2:	6a 7d                	push   $0x7d
  jmp __alltraps
  1024f4:	e9 12 06 00 00       	jmp    102b0b <__alltraps>

001024f9 <vector126>:
.globl vector126
vector126:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $126
  1024fb:	6a 7e                	push   $0x7e
  jmp __alltraps
  1024fd:	e9 09 06 00 00       	jmp    102b0b <__alltraps>

00102502 <vector127>:
.globl vector127
vector127:
  pushl $0
  102502:	6a 00                	push   $0x0
  pushl $127
  102504:	6a 7f                	push   $0x7f
  jmp __alltraps
  102506:	e9 00 06 00 00       	jmp    102b0b <__alltraps>

0010250b <vector128>:
.globl vector128
vector128:
  pushl $0
  10250b:	6a 00                	push   $0x0
  pushl $128
  10250d:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102512:	e9 f4 05 00 00       	jmp    102b0b <__alltraps>

00102517 <vector129>:
.globl vector129
vector129:
  pushl $0
  102517:	6a 00                	push   $0x0
  pushl $129
  102519:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10251e:	e9 e8 05 00 00       	jmp    102b0b <__alltraps>

00102523 <vector130>:
.globl vector130
vector130:
  pushl $0
  102523:	6a 00                	push   $0x0
  pushl $130
  102525:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10252a:	e9 dc 05 00 00       	jmp    102b0b <__alltraps>

0010252f <vector131>:
.globl vector131
vector131:
  pushl $0
  10252f:	6a 00                	push   $0x0
  pushl $131
  102531:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102536:	e9 d0 05 00 00       	jmp    102b0b <__alltraps>

0010253b <vector132>:
.globl vector132
vector132:
  pushl $0
  10253b:	6a 00                	push   $0x0
  pushl $132
  10253d:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102542:	e9 c4 05 00 00       	jmp    102b0b <__alltraps>

00102547 <vector133>:
.globl vector133
vector133:
  pushl $0
  102547:	6a 00                	push   $0x0
  pushl $133
  102549:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10254e:	e9 b8 05 00 00       	jmp    102b0b <__alltraps>

00102553 <vector134>:
.globl vector134
vector134:
  pushl $0
  102553:	6a 00                	push   $0x0
  pushl $134
  102555:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10255a:	e9 ac 05 00 00       	jmp    102b0b <__alltraps>

0010255f <vector135>:
.globl vector135
vector135:
  pushl $0
  10255f:	6a 00                	push   $0x0
  pushl $135
  102561:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102566:	e9 a0 05 00 00       	jmp    102b0b <__alltraps>

0010256b <vector136>:
.globl vector136
vector136:
  pushl $0
  10256b:	6a 00                	push   $0x0
  pushl $136
  10256d:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102572:	e9 94 05 00 00       	jmp    102b0b <__alltraps>

00102577 <vector137>:
.globl vector137
vector137:
  pushl $0
  102577:	6a 00                	push   $0x0
  pushl $137
  102579:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10257e:	e9 88 05 00 00       	jmp    102b0b <__alltraps>

00102583 <vector138>:
.globl vector138
vector138:
  pushl $0
  102583:	6a 00                	push   $0x0
  pushl $138
  102585:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10258a:	e9 7c 05 00 00       	jmp    102b0b <__alltraps>

0010258f <vector139>:
.globl vector139
vector139:
  pushl $0
  10258f:	6a 00                	push   $0x0
  pushl $139
  102591:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102596:	e9 70 05 00 00       	jmp    102b0b <__alltraps>

0010259b <vector140>:
.globl vector140
vector140:
  pushl $0
  10259b:	6a 00                	push   $0x0
  pushl $140
  10259d:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1025a2:	e9 64 05 00 00       	jmp    102b0b <__alltraps>

001025a7 <vector141>:
.globl vector141
vector141:
  pushl $0
  1025a7:	6a 00                	push   $0x0
  pushl $141
  1025a9:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1025ae:	e9 58 05 00 00       	jmp    102b0b <__alltraps>

001025b3 <vector142>:
.globl vector142
vector142:
  pushl $0
  1025b3:	6a 00                	push   $0x0
  pushl $142
  1025b5:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1025ba:	e9 4c 05 00 00       	jmp    102b0b <__alltraps>

001025bf <vector143>:
.globl vector143
vector143:
  pushl $0
  1025bf:	6a 00                	push   $0x0
  pushl $143
  1025c1:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1025c6:	e9 40 05 00 00       	jmp    102b0b <__alltraps>

001025cb <vector144>:
.globl vector144
vector144:
  pushl $0
  1025cb:	6a 00                	push   $0x0
  pushl $144
  1025cd:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1025d2:	e9 34 05 00 00       	jmp    102b0b <__alltraps>

001025d7 <vector145>:
.globl vector145
vector145:
  pushl $0
  1025d7:	6a 00                	push   $0x0
  pushl $145
  1025d9:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1025de:	e9 28 05 00 00       	jmp    102b0b <__alltraps>

001025e3 <vector146>:
.globl vector146
vector146:
  pushl $0
  1025e3:	6a 00                	push   $0x0
  pushl $146
  1025e5:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1025ea:	e9 1c 05 00 00       	jmp    102b0b <__alltraps>

001025ef <vector147>:
.globl vector147
vector147:
  pushl $0
  1025ef:	6a 00                	push   $0x0
  pushl $147
  1025f1:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1025f6:	e9 10 05 00 00       	jmp    102b0b <__alltraps>

001025fb <vector148>:
.globl vector148
vector148:
  pushl $0
  1025fb:	6a 00                	push   $0x0
  pushl $148
  1025fd:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102602:	e9 04 05 00 00       	jmp    102b0b <__alltraps>

00102607 <vector149>:
.globl vector149
vector149:
  pushl $0
  102607:	6a 00                	push   $0x0
  pushl $149
  102609:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10260e:	e9 f8 04 00 00       	jmp    102b0b <__alltraps>

00102613 <vector150>:
.globl vector150
vector150:
  pushl $0
  102613:	6a 00                	push   $0x0
  pushl $150
  102615:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10261a:	e9 ec 04 00 00       	jmp    102b0b <__alltraps>

0010261f <vector151>:
.globl vector151
vector151:
  pushl $0
  10261f:	6a 00                	push   $0x0
  pushl $151
  102621:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102626:	e9 e0 04 00 00       	jmp    102b0b <__alltraps>

0010262b <vector152>:
.globl vector152
vector152:
  pushl $0
  10262b:	6a 00                	push   $0x0
  pushl $152
  10262d:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102632:	e9 d4 04 00 00       	jmp    102b0b <__alltraps>

00102637 <vector153>:
.globl vector153
vector153:
  pushl $0
  102637:	6a 00                	push   $0x0
  pushl $153
  102639:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10263e:	e9 c8 04 00 00       	jmp    102b0b <__alltraps>

00102643 <vector154>:
.globl vector154
vector154:
  pushl $0
  102643:	6a 00                	push   $0x0
  pushl $154
  102645:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10264a:	e9 bc 04 00 00       	jmp    102b0b <__alltraps>

0010264f <vector155>:
.globl vector155
vector155:
  pushl $0
  10264f:	6a 00                	push   $0x0
  pushl $155
  102651:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102656:	e9 b0 04 00 00       	jmp    102b0b <__alltraps>

0010265b <vector156>:
.globl vector156
vector156:
  pushl $0
  10265b:	6a 00                	push   $0x0
  pushl $156
  10265d:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102662:	e9 a4 04 00 00       	jmp    102b0b <__alltraps>

00102667 <vector157>:
.globl vector157
vector157:
  pushl $0
  102667:	6a 00                	push   $0x0
  pushl $157
  102669:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10266e:	e9 98 04 00 00       	jmp    102b0b <__alltraps>

00102673 <vector158>:
.globl vector158
vector158:
  pushl $0
  102673:	6a 00                	push   $0x0
  pushl $158
  102675:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10267a:	e9 8c 04 00 00       	jmp    102b0b <__alltraps>

0010267f <vector159>:
.globl vector159
vector159:
  pushl $0
  10267f:	6a 00                	push   $0x0
  pushl $159
  102681:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102686:	e9 80 04 00 00       	jmp    102b0b <__alltraps>

0010268b <vector160>:
.globl vector160
vector160:
  pushl $0
  10268b:	6a 00                	push   $0x0
  pushl $160
  10268d:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102692:	e9 74 04 00 00       	jmp    102b0b <__alltraps>

00102697 <vector161>:
.globl vector161
vector161:
  pushl $0
  102697:	6a 00                	push   $0x0
  pushl $161
  102699:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10269e:	e9 68 04 00 00       	jmp    102b0b <__alltraps>

001026a3 <vector162>:
.globl vector162
vector162:
  pushl $0
  1026a3:	6a 00                	push   $0x0
  pushl $162
  1026a5:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1026aa:	e9 5c 04 00 00       	jmp    102b0b <__alltraps>

001026af <vector163>:
.globl vector163
vector163:
  pushl $0
  1026af:	6a 00                	push   $0x0
  pushl $163
  1026b1:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1026b6:	e9 50 04 00 00       	jmp    102b0b <__alltraps>

001026bb <vector164>:
.globl vector164
vector164:
  pushl $0
  1026bb:	6a 00                	push   $0x0
  pushl $164
  1026bd:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1026c2:	e9 44 04 00 00       	jmp    102b0b <__alltraps>

001026c7 <vector165>:
.globl vector165
vector165:
  pushl $0
  1026c7:	6a 00                	push   $0x0
  pushl $165
  1026c9:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1026ce:	e9 38 04 00 00       	jmp    102b0b <__alltraps>

001026d3 <vector166>:
.globl vector166
vector166:
  pushl $0
  1026d3:	6a 00                	push   $0x0
  pushl $166
  1026d5:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1026da:	e9 2c 04 00 00       	jmp    102b0b <__alltraps>

001026df <vector167>:
.globl vector167
vector167:
  pushl $0
  1026df:	6a 00                	push   $0x0
  pushl $167
  1026e1:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1026e6:	e9 20 04 00 00       	jmp    102b0b <__alltraps>

001026eb <vector168>:
.globl vector168
vector168:
  pushl $0
  1026eb:	6a 00                	push   $0x0
  pushl $168
  1026ed:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1026f2:	e9 14 04 00 00       	jmp    102b0b <__alltraps>

001026f7 <vector169>:
.globl vector169
vector169:
  pushl $0
  1026f7:	6a 00                	push   $0x0
  pushl $169
  1026f9:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1026fe:	e9 08 04 00 00       	jmp    102b0b <__alltraps>

00102703 <vector170>:
.globl vector170
vector170:
  pushl $0
  102703:	6a 00                	push   $0x0
  pushl $170
  102705:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10270a:	e9 fc 03 00 00       	jmp    102b0b <__alltraps>

0010270f <vector171>:
.globl vector171
vector171:
  pushl $0
  10270f:	6a 00                	push   $0x0
  pushl $171
  102711:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102716:	e9 f0 03 00 00       	jmp    102b0b <__alltraps>

0010271b <vector172>:
.globl vector172
vector172:
  pushl $0
  10271b:	6a 00                	push   $0x0
  pushl $172
  10271d:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102722:	e9 e4 03 00 00       	jmp    102b0b <__alltraps>

00102727 <vector173>:
.globl vector173
vector173:
  pushl $0
  102727:	6a 00                	push   $0x0
  pushl $173
  102729:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10272e:	e9 d8 03 00 00       	jmp    102b0b <__alltraps>

00102733 <vector174>:
.globl vector174
vector174:
  pushl $0
  102733:	6a 00                	push   $0x0
  pushl $174
  102735:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10273a:	e9 cc 03 00 00       	jmp    102b0b <__alltraps>

0010273f <vector175>:
.globl vector175
vector175:
  pushl $0
  10273f:	6a 00                	push   $0x0
  pushl $175
  102741:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102746:	e9 c0 03 00 00       	jmp    102b0b <__alltraps>

0010274b <vector176>:
.globl vector176
vector176:
  pushl $0
  10274b:	6a 00                	push   $0x0
  pushl $176
  10274d:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102752:	e9 b4 03 00 00       	jmp    102b0b <__alltraps>

00102757 <vector177>:
.globl vector177
vector177:
  pushl $0
  102757:	6a 00                	push   $0x0
  pushl $177
  102759:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10275e:	e9 a8 03 00 00       	jmp    102b0b <__alltraps>

00102763 <vector178>:
.globl vector178
vector178:
  pushl $0
  102763:	6a 00                	push   $0x0
  pushl $178
  102765:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10276a:	e9 9c 03 00 00       	jmp    102b0b <__alltraps>

0010276f <vector179>:
.globl vector179
vector179:
  pushl $0
  10276f:	6a 00                	push   $0x0
  pushl $179
  102771:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102776:	e9 90 03 00 00       	jmp    102b0b <__alltraps>

0010277b <vector180>:
.globl vector180
vector180:
  pushl $0
  10277b:	6a 00                	push   $0x0
  pushl $180
  10277d:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102782:	e9 84 03 00 00       	jmp    102b0b <__alltraps>

00102787 <vector181>:
.globl vector181
vector181:
  pushl $0
  102787:	6a 00                	push   $0x0
  pushl $181
  102789:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10278e:	e9 78 03 00 00       	jmp    102b0b <__alltraps>

00102793 <vector182>:
.globl vector182
vector182:
  pushl $0
  102793:	6a 00                	push   $0x0
  pushl $182
  102795:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10279a:	e9 6c 03 00 00       	jmp    102b0b <__alltraps>

0010279f <vector183>:
.globl vector183
vector183:
  pushl $0
  10279f:	6a 00                	push   $0x0
  pushl $183
  1027a1:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1027a6:	e9 60 03 00 00       	jmp    102b0b <__alltraps>

001027ab <vector184>:
.globl vector184
vector184:
  pushl $0
  1027ab:	6a 00                	push   $0x0
  pushl $184
  1027ad:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1027b2:	e9 54 03 00 00       	jmp    102b0b <__alltraps>

001027b7 <vector185>:
.globl vector185
vector185:
  pushl $0
  1027b7:	6a 00                	push   $0x0
  pushl $185
  1027b9:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1027be:	e9 48 03 00 00       	jmp    102b0b <__alltraps>

001027c3 <vector186>:
.globl vector186
vector186:
  pushl $0
  1027c3:	6a 00                	push   $0x0
  pushl $186
  1027c5:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1027ca:	e9 3c 03 00 00       	jmp    102b0b <__alltraps>

001027cf <vector187>:
.globl vector187
vector187:
  pushl $0
  1027cf:	6a 00                	push   $0x0
  pushl $187
  1027d1:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1027d6:	e9 30 03 00 00       	jmp    102b0b <__alltraps>

001027db <vector188>:
.globl vector188
vector188:
  pushl $0
  1027db:	6a 00                	push   $0x0
  pushl $188
  1027dd:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1027e2:	e9 24 03 00 00       	jmp    102b0b <__alltraps>

001027e7 <vector189>:
.globl vector189
vector189:
  pushl $0
  1027e7:	6a 00                	push   $0x0
  pushl $189
  1027e9:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1027ee:	e9 18 03 00 00       	jmp    102b0b <__alltraps>

001027f3 <vector190>:
.globl vector190
vector190:
  pushl $0
  1027f3:	6a 00                	push   $0x0
  pushl $190
  1027f5:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1027fa:	e9 0c 03 00 00       	jmp    102b0b <__alltraps>

001027ff <vector191>:
.globl vector191
vector191:
  pushl $0
  1027ff:	6a 00                	push   $0x0
  pushl $191
  102801:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102806:	e9 00 03 00 00       	jmp    102b0b <__alltraps>

0010280b <vector192>:
.globl vector192
vector192:
  pushl $0
  10280b:	6a 00                	push   $0x0
  pushl $192
  10280d:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102812:	e9 f4 02 00 00       	jmp    102b0b <__alltraps>

00102817 <vector193>:
.globl vector193
vector193:
  pushl $0
  102817:	6a 00                	push   $0x0
  pushl $193
  102819:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10281e:	e9 e8 02 00 00       	jmp    102b0b <__alltraps>

00102823 <vector194>:
.globl vector194
vector194:
  pushl $0
  102823:	6a 00                	push   $0x0
  pushl $194
  102825:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10282a:	e9 dc 02 00 00       	jmp    102b0b <__alltraps>

0010282f <vector195>:
.globl vector195
vector195:
  pushl $0
  10282f:	6a 00                	push   $0x0
  pushl $195
  102831:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102836:	e9 d0 02 00 00       	jmp    102b0b <__alltraps>

0010283b <vector196>:
.globl vector196
vector196:
  pushl $0
  10283b:	6a 00                	push   $0x0
  pushl $196
  10283d:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102842:	e9 c4 02 00 00       	jmp    102b0b <__alltraps>

00102847 <vector197>:
.globl vector197
vector197:
  pushl $0
  102847:	6a 00                	push   $0x0
  pushl $197
  102849:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10284e:	e9 b8 02 00 00       	jmp    102b0b <__alltraps>

00102853 <vector198>:
.globl vector198
vector198:
  pushl $0
  102853:	6a 00                	push   $0x0
  pushl $198
  102855:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10285a:	e9 ac 02 00 00       	jmp    102b0b <__alltraps>

0010285f <vector199>:
.globl vector199
vector199:
  pushl $0
  10285f:	6a 00                	push   $0x0
  pushl $199
  102861:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102866:	e9 a0 02 00 00       	jmp    102b0b <__alltraps>

0010286b <vector200>:
.globl vector200
vector200:
  pushl $0
  10286b:	6a 00                	push   $0x0
  pushl $200
  10286d:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102872:	e9 94 02 00 00       	jmp    102b0b <__alltraps>

00102877 <vector201>:
.globl vector201
vector201:
  pushl $0
  102877:	6a 00                	push   $0x0
  pushl $201
  102879:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10287e:	e9 88 02 00 00       	jmp    102b0b <__alltraps>

00102883 <vector202>:
.globl vector202
vector202:
  pushl $0
  102883:	6a 00                	push   $0x0
  pushl $202
  102885:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10288a:	e9 7c 02 00 00       	jmp    102b0b <__alltraps>

0010288f <vector203>:
.globl vector203
vector203:
  pushl $0
  10288f:	6a 00                	push   $0x0
  pushl $203
  102891:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102896:	e9 70 02 00 00       	jmp    102b0b <__alltraps>

0010289b <vector204>:
.globl vector204
vector204:
  pushl $0
  10289b:	6a 00                	push   $0x0
  pushl $204
  10289d:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1028a2:	e9 64 02 00 00       	jmp    102b0b <__alltraps>

001028a7 <vector205>:
.globl vector205
vector205:
  pushl $0
  1028a7:	6a 00                	push   $0x0
  pushl $205
  1028a9:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1028ae:	e9 58 02 00 00       	jmp    102b0b <__alltraps>

001028b3 <vector206>:
.globl vector206
vector206:
  pushl $0
  1028b3:	6a 00                	push   $0x0
  pushl $206
  1028b5:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1028ba:	e9 4c 02 00 00       	jmp    102b0b <__alltraps>

001028bf <vector207>:
.globl vector207
vector207:
  pushl $0
  1028bf:	6a 00                	push   $0x0
  pushl $207
  1028c1:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1028c6:	e9 40 02 00 00       	jmp    102b0b <__alltraps>

001028cb <vector208>:
.globl vector208
vector208:
  pushl $0
  1028cb:	6a 00                	push   $0x0
  pushl $208
  1028cd:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1028d2:	e9 34 02 00 00       	jmp    102b0b <__alltraps>

001028d7 <vector209>:
.globl vector209
vector209:
  pushl $0
  1028d7:	6a 00                	push   $0x0
  pushl $209
  1028d9:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1028de:	e9 28 02 00 00       	jmp    102b0b <__alltraps>

001028e3 <vector210>:
.globl vector210
vector210:
  pushl $0
  1028e3:	6a 00                	push   $0x0
  pushl $210
  1028e5:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1028ea:	e9 1c 02 00 00       	jmp    102b0b <__alltraps>

001028ef <vector211>:
.globl vector211
vector211:
  pushl $0
  1028ef:	6a 00                	push   $0x0
  pushl $211
  1028f1:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1028f6:	e9 10 02 00 00       	jmp    102b0b <__alltraps>

001028fb <vector212>:
.globl vector212
vector212:
  pushl $0
  1028fb:	6a 00                	push   $0x0
  pushl $212
  1028fd:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102902:	e9 04 02 00 00       	jmp    102b0b <__alltraps>

00102907 <vector213>:
.globl vector213
vector213:
  pushl $0
  102907:	6a 00                	push   $0x0
  pushl $213
  102909:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10290e:	e9 f8 01 00 00       	jmp    102b0b <__alltraps>

00102913 <vector214>:
.globl vector214
vector214:
  pushl $0
  102913:	6a 00                	push   $0x0
  pushl $214
  102915:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10291a:	e9 ec 01 00 00       	jmp    102b0b <__alltraps>

0010291f <vector215>:
.globl vector215
vector215:
  pushl $0
  10291f:	6a 00                	push   $0x0
  pushl $215
  102921:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102926:	e9 e0 01 00 00       	jmp    102b0b <__alltraps>

0010292b <vector216>:
.globl vector216
vector216:
  pushl $0
  10292b:	6a 00                	push   $0x0
  pushl $216
  10292d:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102932:	e9 d4 01 00 00       	jmp    102b0b <__alltraps>

00102937 <vector217>:
.globl vector217
vector217:
  pushl $0
  102937:	6a 00                	push   $0x0
  pushl $217
  102939:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10293e:	e9 c8 01 00 00       	jmp    102b0b <__alltraps>

00102943 <vector218>:
.globl vector218
vector218:
  pushl $0
  102943:	6a 00                	push   $0x0
  pushl $218
  102945:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10294a:	e9 bc 01 00 00       	jmp    102b0b <__alltraps>

0010294f <vector219>:
.globl vector219
vector219:
  pushl $0
  10294f:	6a 00                	push   $0x0
  pushl $219
  102951:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102956:	e9 b0 01 00 00       	jmp    102b0b <__alltraps>

0010295b <vector220>:
.globl vector220
vector220:
  pushl $0
  10295b:	6a 00                	push   $0x0
  pushl $220
  10295d:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102962:	e9 a4 01 00 00       	jmp    102b0b <__alltraps>

00102967 <vector221>:
.globl vector221
vector221:
  pushl $0
  102967:	6a 00                	push   $0x0
  pushl $221
  102969:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10296e:	e9 98 01 00 00       	jmp    102b0b <__alltraps>

00102973 <vector222>:
.globl vector222
vector222:
  pushl $0
  102973:	6a 00                	push   $0x0
  pushl $222
  102975:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10297a:	e9 8c 01 00 00       	jmp    102b0b <__alltraps>

0010297f <vector223>:
.globl vector223
vector223:
  pushl $0
  10297f:	6a 00                	push   $0x0
  pushl $223
  102981:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102986:	e9 80 01 00 00       	jmp    102b0b <__alltraps>

0010298b <vector224>:
.globl vector224
vector224:
  pushl $0
  10298b:	6a 00                	push   $0x0
  pushl $224
  10298d:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102992:	e9 74 01 00 00       	jmp    102b0b <__alltraps>

00102997 <vector225>:
.globl vector225
vector225:
  pushl $0
  102997:	6a 00                	push   $0x0
  pushl $225
  102999:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10299e:	e9 68 01 00 00       	jmp    102b0b <__alltraps>

001029a3 <vector226>:
.globl vector226
vector226:
  pushl $0
  1029a3:	6a 00                	push   $0x0
  pushl $226
  1029a5:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1029aa:	e9 5c 01 00 00       	jmp    102b0b <__alltraps>

001029af <vector227>:
.globl vector227
vector227:
  pushl $0
  1029af:	6a 00                	push   $0x0
  pushl $227
  1029b1:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1029b6:	e9 50 01 00 00       	jmp    102b0b <__alltraps>

001029bb <vector228>:
.globl vector228
vector228:
  pushl $0
  1029bb:	6a 00                	push   $0x0
  pushl $228
  1029bd:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1029c2:	e9 44 01 00 00       	jmp    102b0b <__alltraps>

001029c7 <vector229>:
.globl vector229
vector229:
  pushl $0
  1029c7:	6a 00                	push   $0x0
  pushl $229
  1029c9:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1029ce:	e9 38 01 00 00       	jmp    102b0b <__alltraps>

001029d3 <vector230>:
.globl vector230
vector230:
  pushl $0
  1029d3:	6a 00                	push   $0x0
  pushl $230
  1029d5:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1029da:	e9 2c 01 00 00       	jmp    102b0b <__alltraps>

001029df <vector231>:
.globl vector231
vector231:
  pushl $0
  1029df:	6a 00                	push   $0x0
  pushl $231
  1029e1:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1029e6:	e9 20 01 00 00       	jmp    102b0b <__alltraps>

001029eb <vector232>:
.globl vector232
vector232:
  pushl $0
  1029eb:	6a 00                	push   $0x0
  pushl $232
  1029ed:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1029f2:	e9 14 01 00 00       	jmp    102b0b <__alltraps>

001029f7 <vector233>:
.globl vector233
vector233:
  pushl $0
  1029f7:	6a 00                	push   $0x0
  pushl $233
  1029f9:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1029fe:	e9 08 01 00 00       	jmp    102b0b <__alltraps>

00102a03 <vector234>:
.globl vector234
vector234:
  pushl $0
  102a03:	6a 00                	push   $0x0
  pushl $234
  102a05:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102a0a:	e9 fc 00 00 00       	jmp    102b0b <__alltraps>

00102a0f <vector235>:
.globl vector235
vector235:
  pushl $0
  102a0f:	6a 00                	push   $0x0
  pushl $235
  102a11:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102a16:	e9 f0 00 00 00       	jmp    102b0b <__alltraps>

00102a1b <vector236>:
.globl vector236
vector236:
  pushl $0
  102a1b:	6a 00                	push   $0x0
  pushl $236
  102a1d:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102a22:	e9 e4 00 00 00       	jmp    102b0b <__alltraps>

00102a27 <vector237>:
.globl vector237
vector237:
  pushl $0
  102a27:	6a 00                	push   $0x0
  pushl $237
  102a29:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102a2e:	e9 d8 00 00 00       	jmp    102b0b <__alltraps>

00102a33 <vector238>:
.globl vector238
vector238:
  pushl $0
  102a33:	6a 00                	push   $0x0
  pushl $238
  102a35:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102a3a:	e9 cc 00 00 00       	jmp    102b0b <__alltraps>

00102a3f <vector239>:
.globl vector239
vector239:
  pushl $0
  102a3f:	6a 00                	push   $0x0
  pushl $239
  102a41:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102a46:	e9 c0 00 00 00       	jmp    102b0b <__alltraps>

00102a4b <vector240>:
.globl vector240
vector240:
  pushl $0
  102a4b:	6a 00                	push   $0x0
  pushl $240
  102a4d:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102a52:	e9 b4 00 00 00       	jmp    102b0b <__alltraps>

00102a57 <vector241>:
.globl vector241
vector241:
  pushl $0
  102a57:	6a 00                	push   $0x0
  pushl $241
  102a59:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102a5e:	e9 a8 00 00 00       	jmp    102b0b <__alltraps>

00102a63 <vector242>:
.globl vector242
vector242:
  pushl $0
  102a63:	6a 00                	push   $0x0
  pushl $242
  102a65:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102a6a:	e9 9c 00 00 00       	jmp    102b0b <__alltraps>

00102a6f <vector243>:
.globl vector243
vector243:
  pushl $0
  102a6f:	6a 00                	push   $0x0
  pushl $243
  102a71:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102a76:	e9 90 00 00 00       	jmp    102b0b <__alltraps>

00102a7b <vector244>:
.globl vector244
vector244:
  pushl $0
  102a7b:	6a 00                	push   $0x0
  pushl $244
  102a7d:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102a82:	e9 84 00 00 00       	jmp    102b0b <__alltraps>

00102a87 <vector245>:
.globl vector245
vector245:
  pushl $0
  102a87:	6a 00                	push   $0x0
  pushl $245
  102a89:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102a8e:	e9 78 00 00 00       	jmp    102b0b <__alltraps>

00102a93 <vector246>:
.globl vector246
vector246:
  pushl $0
  102a93:	6a 00                	push   $0x0
  pushl $246
  102a95:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102a9a:	e9 6c 00 00 00       	jmp    102b0b <__alltraps>

00102a9f <vector247>:
.globl vector247
vector247:
  pushl $0
  102a9f:	6a 00                	push   $0x0
  pushl $247
  102aa1:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102aa6:	e9 60 00 00 00       	jmp    102b0b <__alltraps>

00102aab <vector248>:
.globl vector248
vector248:
  pushl $0
  102aab:	6a 00                	push   $0x0
  pushl $248
  102aad:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102ab2:	e9 54 00 00 00       	jmp    102b0b <__alltraps>

00102ab7 <vector249>:
.globl vector249
vector249:
  pushl $0
  102ab7:	6a 00                	push   $0x0
  pushl $249
  102ab9:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102abe:	e9 48 00 00 00       	jmp    102b0b <__alltraps>

00102ac3 <vector250>:
.globl vector250
vector250:
  pushl $0
  102ac3:	6a 00                	push   $0x0
  pushl $250
  102ac5:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102aca:	e9 3c 00 00 00       	jmp    102b0b <__alltraps>

00102acf <vector251>:
.globl vector251
vector251:
  pushl $0
  102acf:	6a 00                	push   $0x0
  pushl $251
  102ad1:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102ad6:	e9 30 00 00 00       	jmp    102b0b <__alltraps>

00102adb <vector252>:
.globl vector252
vector252:
  pushl $0
  102adb:	6a 00                	push   $0x0
  pushl $252
  102add:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102ae2:	e9 24 00 00 00       	jmp    102b0b <__alltraps>

00102ae7 <vector253>:
.globl vector253
vector253:
  pushl $0
  102ae7:	6a 00                	push   $0x0
  pushl $253
  102ae9:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102aee:	e9 18 00 00 00       	jmp    102b0b <__alltraps>

00102af3 <vector254>:
.globl vector254
vector254:
  pushl $0
  102af3:	6a 00                	push   $0x0
  pushl $254
  102af5:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102afa:	e9 0c 00 00 00       	jmp    102b0b <__alltraps>

00102aff <vector255>:
.globl vector255
vector255:
  pushl $0
  102aff:	6a 00                	push   $0x0
  pushl $255
  102b01:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102b06:	e9 00 00 00 00       	jmp    102b0b <__alltraps>

00102b0b <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102b0b:	1e                   	push   %ds
    pushl %es
  102b0c:	06                   	push   %es
    pushl %fs
  102b0d:	0f a0                	push   %fs
    pushl %gs
  102b0f:	0f a8                	push   %gs
    pushal
  102b11:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102b12:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102b17:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102b19:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102b1b:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102b1c:	e8 64 f5 ff ff       	call   102085 <trap>

    # pop the pushed stack pointer
    popl %esp
  102b21:	5c                   	pop    %esp

00102b22 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102b22:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102b23:	0f a9                	pop    %gs
    popl %fs
  102b25:	0f a1                	pop    %fs
    popl %es
  102b27:	07                   	pop    %es
    popl %ds
  102b28:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102b29:	83 c4 08             	add    $0x8,%esp
    iret
  102b2c:	cf                   	iret   

00102b2d <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102b2d:	55                   	push   %ebp
  102b2e:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102b30:	8b 45 08             	mov    0x8(%ebp),%eax
  102b33:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102b36:	b8 23 00 00 00       	mov    $0x23,%eax
  102b3b:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102b3d:	b8 23 00 00 00       	mov    $0x23,%eax
  102b42:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102b44:	b8 10 00 00 00       	mov    $0x10,%eax
  102b49:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102b4b:	b8 10 00 00 00       	mov    $0x10,%eax
  102b50:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102b52:	b8 10 00 00 00       	mov    $0x10,%eax
  102b57:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102b59:	ea 60 2b 10 00 08 00 	ljmp   $0x8,$0x102b60
}
  102b60:	90                   	nop
  102b61:	5d                   	pop    %ebp
  102b62:	c3                   	ret    

00102b63 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102b63:	55                   	push   %ebp
  102b64:	89 e5                	mov    %esp,%ebp
  102b66:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102b69:	b8 a0 f9 10 00       	mov    $0x10f9a0,%eax
  102b6e:	05 00 04 00 00       	add    $0x400,%eax
  102b73:	a3 c4 f8 10 00       	mov    %eax,0x10f8c4
    ts.ts_ss0 = KERNEL_DS;
  102b78:	66 c7 05 c8 f8 10 00 	movw   $0x10,0x10f8c8
  102b7f:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102b81:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102b88:	68 00 
  102b8a:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102b8f:	0f b7 c0             	movzwl %ax,%eax
  102b92:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102b98:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102b9d:	c1 e8 10             	shr    $0x10,%eax
  102ba0:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102ba5:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102bac:	24 f0                	and    $0xf0,%al
  102bae:	0c 09                	or     $0x9,%al
  102bb0:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102bb5:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102bbc:	0c 10                	or     $0x10,%al
  102bbe:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102bc3:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102bca:	24 9f                	and    $0x9f,%al
  102bcc:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102bd1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102bd8:	0c 80                	or     $0x80,%al
  102bda:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102bdf:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102be6:	24 f0                	and    $0xf0,%al
  102be8:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102bed:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102bf4:	24 ef                	and    $0xef,%al
  102bf6:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102bfb:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102c02:	24 df                	and    $0xdf,%al
  102c04:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102c09:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102c10:	0c 40                	or     $0x40,%al
  102c12:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102c17:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102c1e:	24 7f                	and    $0x7f,%al
  102c20:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102c25:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102c2a:	c1 e8 18             	shr    $0x18,%eax
  102c2d:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102c32:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102c39:	24 ef                	and    $0xef,%al
  102c3b:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102c40:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102c47:	e8 e1 fe ff ff       	call   102b2d <lgdt>
  102c4c:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102c52:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102c56:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102c59:	90                   	nop
  102c5a:	c9                   	leave  
  102c5b:	c3                   	ret    

00102c5c <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102c5c:	55                   	push   %ebp
  102c5d:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102c5f:	e8 ff fe ff ff       	call   102b63 <gdt_init>
}
  102c64:	90                   	nop
  102c65:	5d                   	pop    %ebp
  102c66:	c3                   	ret    

00102c67 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102c67:	55                   	push   %ebp
  102c68:	89 e5                	mov    %esp,%ebp
  102c6a:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102c6d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102c74:	eb 03                	jmp    102c79 <strlen+0x12>
        cnt ++;
  102c76:	ff 45 fc             	incl   -0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102c79:	8b 45 08             	mov    0x8(%ebp),%eax
  102c7c:	8d 50 01             	lea    0x1(%eax),%edx
  102c7f:	89 55 08             	mov    %edx,0x8(%ebp)
  102c82:	0f b6 00             	movzbl (%eax),%eax
  102c85:	84 c0                	test   %al,%al
  102c87:	75 ed                	jne    102c76 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102c89:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102c8c:	c9                   	leave  
  102c8d:	c3                   	ret    

00102c8e <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102c8e:	55                   	push   %ebp
  102c8f:	89 e5                	mov    %esp,%ebp
  102c91:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102c94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102c9b:	eb 03                	jmp    102ca0 <strnlen+0x12>
        cnt ++;
  102c9d:	ff 45 fc             	incl   -0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102ca0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ca3:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102ca6:	73 10                	jae    102cb8 <strnlen+0x2a>
  102ca8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cab:	8d 50 01             	lea    0x1(%eax),%edx
  102cae:	89 55 08             	mov    %edx,0x8(%ebp)
  102cb1:	0f b6 00             	movzbl (%eax),%eax
  102cb4:	84 c0                	test   %al,%al
  102cb6:	75 e5                	jne    102c9d <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102cb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102cbb:	c9                   	leave  
  102cbc:	c3                   	ret    

00102cbd <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102cbd:	55                   	push   %ebp
  102cbe:	89 e5                	mov    %esp,%ebp
  102cc0:	57                   	push   %edi
  102cc1:	56                   	push   %esi
  102cc2:	83 ec 20             	sub    $0x20,%esp
  102cc5:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ccb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cce:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102cd1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102cd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cd7:	89 d1                	mov    %edx,%ecx
  102cd9:	89 c2                	mov    %eax,%edx
  102cdb:	89 ce                	mov    %ecx,%esi
  102cdd:	89 d7                	mov    %edx,%edi
  102cdf:	ac                   	lods   %ds:(%esi),%al
  102ce0:	aa                   	stos   %al,%es:(%edi)
  102ce1:	84 c0                	test   %al,%al
  102ce3:	75 fa                	jne    102cdf <strcpy+0x22>
  102ce5:	89 fa                	mov    %edi,%edx
  102ce7:	89 f1                	mov    %esi,%ecx
  102ce9:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102cec:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102cef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102cf5:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102cf6:	83 c4 20             	add    $0x20,%esp
  102cf9:	5e                   	pop    %esi
  102cfa:	5f                   	pop    %edi
  102cfb:	5d                   	pop    %ebp
  102cfc:	c3                   	ret    

00102cfd <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102cfd:	55                   	push   %ebp
  102cfe:	89 e5                	mov    %esp,%ebp
  102d00:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102d03:	8b 45 08             	mov    0x8(%ebp),%eax
  102d06:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102d09:	eb 1e                	jmp    102d29 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102d0b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d0e:	0f b6 10             	movzbl (%eax),%edx
  102d11:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d14:	88 10                	mov    %dl,(%eax)
  102d16:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d19:	0f b6 00             	movzbl (%eax),%eax
  102d1c:	84 c0                	test   %al,%al
  102d1e:	74 03                	je     102d23 <strncpy+0x26>
            src ++;
  102d20:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102d23:	ff 45 fc             	incl   -0x4(%ebp)
  102d26:	ff 4d 10             	decl   0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102d29:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d2d:	75 dc                	jne    102d0b <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102d2f:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102d32:	c9                   	leave  
  102d33:	c3                   	ret    

00102d34 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102d34:	55                   	push   %ebp
  102d35:	89 e5                	mov    %esp,%ebp
  102d37:	57                   	push   %edi
  102d38:	56                   	push   %esi
  102d39:	83 ec 20             	sub    $0x20,%esp
  102d3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d42:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d45:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102d48:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d4e:	89 d1                	mov    %edx,%ecx
  102d50:	89 c2                	mov    %eax,%edx
  102d52:	89 ce                	mov    %ecx,%esi
  102d54:	89 d7                	mov    %edx,%edi
  102d56:	ac                   	lods   %ds:(%esi),%al
  102d57:	ae                   	scas   %es:(%edi),%al
  102d58:	75 08                	jne    102d62 <strcmp+0x2e>
  102d5a:	84 c0                	test   %al,%al
  102d5c:	75 f8                	jne    102d56 <strcmp+0x22>
  102d5e:	31 c0                	xor    %eax,%eax
  102d60:	eb 04                	jmp    102d66 <strcmp+0x32>
  102d62:	19 c0                	sbb    %eax,%eax
  102d64:	0c 01                	or     $0x1,%al
  102d66:	89 fa                	mov    %edi,%edx
  102d68:	89 f1                	mov    %esi,%ecx
  102d6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d6d:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102d70:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102d73:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102d76:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102d77:	83 c4 20             	add    $0x20,%esp
  102d7a:	5e                   	pop    %esi
  102d7b:	5f                   	pop    %edi
  102d7c:	5d                   	pop    %ebp
  102d7d:	c3                   	ret    

00102d7e <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102d7e:	55                   	push   %ebp
  102d7f:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d81:	eb 09                	jmp    102d8c <strncmp+0xe>
        n --, s1 ++, s2 ++;
  102d83:	ff 4d 10             	decl   0x10(%ebp)
  102d86:	ff 45 08             	incl   0x8(%ebp)
  102d89:	ff 45 0c             	incl   0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d8c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d90:	74 1a                	je     102dac <strncmp+0x2e>
  102d92:	8b 45 08             	mov    0x8(%ebp),%eax
  102d95:	0f b6 00             	movzbl (%eax),%eax
  102d98:	84 c0                	test   %al,%al
  102d9a:	74 10                	je     102dac <strncmp+0x2e>
  102d9c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d9f:	0f b6 10             	movzbl (%eax),%edx
  102da2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da5:	0f b6 00             	movzbl (%eax),%eax
  102da8:	38 c2                	cmp    %al,%dl
  102daa:	74 d7                	je     102d83 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102dac:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102db0:	74 18                	je     102dca <strncmp+0x4c>
  102db2:	8b 45 08             	mov    0x8(%ebp),%eax
  102db5:	0f b6 00             	movzbl (%eax),%eax
  102db8:	0f b6 d0             	movzbl %al,%edx
  102dbb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dbe:	0f b6 00             	movzbl (%eax),%eax
  102dc1:	0f b6 c0             	movzbl %al,%eax
  102dc4:	29 c2                	sub    %eax,%edx
  102dc6:	89 d0                	mov    %edx,%eax
  102dc8:	eb 05                	jmp    102dcf <strncmp+0x51>
  102dca:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102dcf:	5d                   	pop    %ebp
  102dd0:	c3                   	ret    

00102dd1 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102dd1:	55                   	push   %ebp
  102dd2:	89 e5                	mov    %esp,%ebp
  102dd4:	83 ec 04             	sub    $0x4,%esp
  102dd7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dda:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102ddd:	eb 13                	jmp    102df2 <strchr+0x21>
        if (*s == c) {
  102ddf:	8b 45 08             	mov    0x8(%ebp),%eax
  102de2:	0f b6 00             	movzbl (%eax),%eax
  102de5:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102de8:	75 05                	jne    102def <strchr+0x1e>
            return (char *)s;
  102dea:	8b 45 08             	mov    0x8(%ebp),%eax
  102ded:	eb 12                	jmp    102e01 <strchr+0x30>
        }
        s ++;
  102def:	ff 45 08             	incl   0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102df2:	8b 45 08             	mov    0x8(%ebp),%eax
  102df5:	0f b6 00             	movzbl (%eax),%eax
  102df8:	84 c0                	test   %al,%al
  102dfa:	75 e3                	jne    102ddf <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102dfc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102e01:	c9                   	leave  
  102e02:	c3                   	ret    

00102e03 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102e03:	55                   	push   %ebp
  102e04:	89 e5                	mov    %esp,%ebp
  102e06:	83 ec 04             	sub    $0x4,%esp
  102e09:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e0c:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102e0f:	eb 0e                	jmp    102e1f <strfind+0x1c>
        if (*s == c) {
  102e11:	8b 45 08             	mov    0x8(%ebp),%eax
  102e14:	0f b6 00             	movzbl (%eax),%eax
  102e17:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102e1a:	74 0f                	je     102e2b <strfind+0x28>
            break;
        }
        s ++;
  102e1c:	ff 45 08             	incl   0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102e1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e22:	0f b6 00             	movzbl (%eax),%eax
  102e25:	84 c0                	test   %al,%al
  102e27:	75 e8                	jne    102e11 <strfind+0xe>
  102e29:	eb 01                	jmp    102e2c <strfind+0x29>
        if (*s == c) {
            break;
  102e2b:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102e2c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102e2f:	c9                   	leave  
  102e30:	c3                   	ret    

00102e31 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102e31:	55                   	push   %ebp
  102e32:	89 e5                	mov    %esp,%ebp
  102e34:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102e37:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102e3e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102e45:	eb 03                	jmp    102e4a <strtol+0x19>
        s ++;
  102e47:	ff 45 08             	incl   0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102e4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4d:	0f b6 00             	movzbl (%eax),%eax
  102e50:	3c 20                	cmp    $0x20,%al
  102e52:	74 f3                	je     102e47 <strtol+0x16>
  102e54:	8b 45 08             	mov    0x8(%ebp),%eax
  102e57:	0f b6 00             	movzbl (%eax),%eax
  102e5a:	3c 09                	cmp    $0x9,%al
  102e5c:	74 e9                	je     102e47 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102e5e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e61:	0f b6 00             	movzbl (%eax),%eax
  102e64:	3c 2b                	cmp    $0x2b,%al
  102e66:	75 05                	jne    102e6d <strtol+0x3c>
        s ++;
  102e68:	ff 45 08             	incl   0x8(%ebp)
  102e6b:	eb 14                	jmp    102e81 <strtol+0x50>
    }
    else if (*s == '-') {
  102e6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e70:	0f b6 00             	movzbl (%eax),%eax
  102e73:	3c 2d                	cmp    $0x2d,%al
  102e75:	75 0a                	jne    102e81 <strtol+0x50>
        s ++, neg = 1;
  102e77:	ff 45 08             	incl   0x8(%ebp)
  102e7a:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102e81:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e85:	74 06                	je     102e8d <strtol+0x5c>
  102e87:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102e8b:	75 22                	jne    102eaf <strtol+0x7e>
  102e8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e90:	0f b6 00             	movzbl (%eax),%eax
  102e93:	3c 30                	cmp    $0x30,%al
  102e95:	75 18                	jne    102eaf <strtol+0x7e>
  102e97:	8b 45 08             	mov    0x8(%ebp),%eax
  102e9a:	40                   	inc    %eax
  102e9b:	0f b6 00             	movzbl (%eax),%eax
  102e9e:	3c 78                	cmp    $0x78,%al
  102ea0:	75 0d                	jne    102eaf <strtol+0x7e>
        s += 2, base = 16;
  102ea2:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102ea6:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102ead:	eb 29                	jmp    102ed8 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  102eaf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102eb3:	75 16                	jne    102ecb <strtol+0x9a>
  102eb5:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb8:	0f b6 00             	movzbl (%eax),%eax
  102ebb:	3c 30                	cmp    $0x30,%al
  102ebd:	75 0c                	jne    102ecb <strtol+0x9a>
        s ++, base = 8;
  102ebf:	ff 45 08             	incl   0x8(%ebp)
  102ec2:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102ec9:	eb 0d                	jmp    102ed8 <strtol+0xa7>
    }
    else if (base == 0) {
  102ecb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ecf:	75 07                	jne    102ed8 <strtol+0xa7>
        base = 10;
  102ed1:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102ed8:	8b 45 08             	mov    0x8(%ebp),%eax
  102edb:	0f b6 00             	movzbl (%eax),%eax
  102ede:	3c 2f                	cmp    $0x2f,%al
  102ee0:	7e 1b                	jle    102efd <strtol+0xcc>
  102ee2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee5:	0f b6 00             	movzbl (%eax),%eax
  102ee8:	3c 39                	cmp    $0x39,%al
  102eea:	7f 11                	jg     102efd <strtol+0xcc>
            dig = *s - '0';
  102eec:	8b 45 08             	mov    0x8(%ebp),%eax
  102eef:	0f b6 00             	movzbl (%eax),%eax
  102ef2:	0f be c0             	movsbl %al,%eax
  102ef5:	83 e8 30             	sub    $0x30,%eax
  102ef8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102efb:	eb 48                	jmp    102f45 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102efd:	8b 45 08             	mov    0x8(%ebp),%eax
  102f00:	0f b6 00             	movzbl (%eax),%eax
  102f03:	3c 60                	cmp    $0x60,%al
  102f05:	7e 1b                	jle    102f22 <strtol+0xf1>
  102f07:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0a:	0f b6 00             	movzbl (%eax),%eax
  102f0d:	3c 7a                	cmp    $0x7a,%al
  102f0f:	7f 11                	jg     102f22 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102f11:	8b 45 08             	mov    0x8(%ebp),%eax
  102f14:	0f b6 00             	movzbl (%eax),%eax
  102f17:	0f be c0             	movsbl %al,%eax
  102f1a:	83 e8 57             	sub    $0x57,%eax
  102f1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f20:	eb 23                	jmp    102f45 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102f22:	8b 45 08             	mov    0x8(%ebp),%eax
  102f25:	0f b6 00             	movzbl (%eax),%eax
  102f28:	3c 40                	cmp    $0x40,%al
  102f2a:	7e 3b                	jle    102f67 <strtol+0x136>
  102f2c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2f:	0f b6 00             	movzbl (%eax),%eax
  102f32:	3c 5a                	cmp    $0x5a,%al
  102f34:	7f 31                	jg     102f67 <strtol+0x136>
            dig = *s - 'A' + 10;
  102f36:	8b 45 08             	mov    0x8(%ebp),%eax
  102f39:	0f b6 00             	movzbl (%eax),%eax
  102f3c:	0f be c0             	movsbl %al,%eax
  102f3f:	83 e8 37             	sub    $0x37,%eax
  102f42:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102f45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f48:	3b 45 10             	cmp    0x10(%ebp),%eax
  102f4b:	7d 19                	jge    102f66 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  102f4d:	ff 45 08             	incl   0x8(%ebp)
  102f50:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f53:	0f af 45 10          	imul   0x10(%ebp),%eax
  102f57:	89 c2                	mov    %eax,%edx
  102f59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f5c:	01 d0                	add    %edx,%eax
  102f5e:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102f61:	e9 72 ff ff ff       	jmp    102ed8 <strtol+0xa7>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102f66:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102f67:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f6b:	74 08                	je     102f75 <strtol+0x144>
        *endptr = (char *) s;
  102f6d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f70:	8b 55 08             	mov    0x8(%ebp),%edx
  102f73:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102f75:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102f79:	74 07                	je     102f82 <strtol+0x151>
  102f7b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f7e:	f7 d8                	neg    %eax
  102f80:	eb 03                	jmp    102f85 <strtol+0x154>
  102f82:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102f85:	c9                   	leave  
  102f86:	c3                   	ret    

00102f87 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102f87:	55                   	push   %ebp
  102f88:	89 e5                	mov    %esp,%ebp
  102f8a:	57                   	push   %edi
  102f8b:	83 ec 24             	sub    $0x24,%esp
  102f8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f91:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102f94:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102f98:	8b 55 08             	mov    0x8(%ebp),%edx
  102f9b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102f9e:	88 45 f7             	mov    %al,-0x9(%ebp)
  102fa1:	8b 45 10             	mov    0x10(%ebp),%eax
  102fa4:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102fa7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102faa:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102fae:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102fb1:	89 d7                	mov    %edx,%edi
  102fb3:	f3 aa                	rep stos %al,%es:(%edi)
  102fb5:	89 fa                	mov    %edi,%edx
  102fb7:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102fba:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102fbd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102fc0:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102fc1:	83 c4 24             	add    $0x24,%esp
  102fc4:	5f                   	pop    %edi
  102fc5:	5d                   	pop    %ebp
  102fc6:	c3                   	ret    

00102fc7 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102fc7:	55                   	push   %ebp
  102fc8:	89 e5                	mov    %esp,%ebp
  102fca:	57                   	push   %edi
  102fcb:	56                   	push   %esi
  102fcc:	53                   	push   %ebx
  102fcd:	83 ec 30             	sub    $0x30,%esp
  102fd0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fd6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fd9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102fdc:	8b 45 10             	mov    0x10(%ebp),%eax
  102fdf:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102fe2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fe5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102fe8:	73 42                	jae    10302c <memmove+0x65>
  102fea:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102ff0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ff3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102ff6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ff9:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ffc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fff:	c1 e8 02             	shr    $0x2,%eax
  103002:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103004:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103007:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10300a:	89 d7                	mov    %edx,%edi
  10300c:	89 c6                	mov    %eax,%esi
  10300e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103010:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103013:	83 e1 03             	and    $0x3,%ecx
  103016:	74 02                	je     10301a <memmove+0x53>
  103018:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10301a:	89 f0                	mov    %esi,%eax
  10301c:	89 fa                	mov    %edi,%edx
  10301e:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103021:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103024:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103027:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  10302a:	eb 36                	jmp    103062 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10302c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10302f:	8d 50 ff             	lea    -0x1(%eax),%edx
  103032:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103035:	01 c2                	add    %eax,%edx
  103037:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10303a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10303d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103040:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103043:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103046:	89 c1                	mov    %eax,%ecx
  103048:	89 d8                	mov    %ebx,%eax
  10304a:	89 d6                	mov    %edx,%esi
  10304c:	89 c7                	mov    %eax,%edi
  10304e:	fd                   	std    
  10304f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103051:	fc                   	cld    
  103052:	89 f8                	mov    %edi,%eax
  103054:	89 f2                	mov    %esi,%edx
  103056:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103059:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10305c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  10305f:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103062:	83 c4 30             	add    $0x30,%esp
  103065:	5b                   	pop    %ebx
  103066:	5e                   	pop    %esi
  103067:	5f                   	pop    %edi
  103068:	5d                   	pop    %ebp
  103069:	c3                   	ret    

0010306a <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  10306a:	55                   	push   %ebp
  10306b:	89 e5                	mov    %esp,%ebp
  10306d:	57                   	push   %edi
  10306e:	56                   	push   %esi
  10306f:	83 ec 20             	sub    $0x20,%esp
  103072:	8b 45 08             	mov    0x8(%ebp),%eax
  103075:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103078:	8b 45 0c             	mov    0xc(%ebp),%eax
  10307b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10307e:	8b 45 10             	mov    0x10(%ebp),%eax
  103081:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103084:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103087:	c1 e8 02             	shr    $0x2,%eax
  10308a:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  10308c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10308f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103092:	89 d7                	mov    %edx,%edi
  103094:	89 c6                	mov    %eax,%esi
  103096:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103098:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10309b:	83 e1 03             	and    $0x3,%ecx
  10309e:	74 02                	je     1030a2 <memcpy+0x38>
  1030a0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1030a2:	89 f0                	mov    %esi,%eax
  1030a4:	89 fa                	mov    %edi,%edx
  1030a6:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1030a9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1030ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1030af:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  1030b2:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1030b3:	83 c4 20             	add    $0x20,%esp
  1030b6:	5e                   	pop    %esi
  1030b7:	5f                   	pop    %edi
  1030b8:	5d                   	pop    %ebp
  1030b9:	c3                   	ret    

001030ba <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1030ba:	55                   	push   %ebp
  1030bb:	89 e5                	mov    %esp,%ebp
  1030bd:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1030c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1030c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030c9:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1030cc:	eb 2e                	jmp    1030fc <memcmp+0x42>
        if (*s1 != *s2) {
  1030ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030d1:	0f b6 10             	movzbl (%eax),%edx
  1030d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030d7:	0f b6 00             	movzbl (%eax),%eax
  1030da:	38 c2                	cmp    %al,%dl
  1030dc:	74 18                	je     1030f6 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1030de:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030e1:	0f b6 00             	movzbl (%eax),%eax
  1030e4:	0f b6 d0             	movzbl %al,%edx
  1030e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030ea:	0f b6 00             	movzbl (%eax),%eax
  1030ed:	0f b6 c0             	movzbl %al,%eax
  1030f0:	29 c2                	sub    %eax,%edx
  1030f2:	89 d0                	mov    %edx,%eax
  1030f4:	eb 18                	jmp    10310e <memcmp+0x54>
        }
        s1 ++, s2 ++;
  1030f6:	ff 45 fc             	incl   -0x4(%ebp)
  1030f9:	ff 45 f8             	incl   -0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1030fc:	8b 45 10             	mov    0x10(%ebp),%eax
  1030ff:	8d 50 ff             	lea    -0x1(%eax),%edx
  103102:	89 55 10             	mov    %edx,0x10(%ebp)
  103105:	85 c0                	test   %eax,%eax
  103107:	75 c5                	jne    1030ce <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  103109:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10310e:	c9                   	leave  
  10310f:	c3                   	ret    

00103110 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  103110:	55                   	push   %ebp
  103111:	89 e5                	mov    %esp,%ebp
  103113:	83 ec 58             	sub    $0x58,%esp
  103116:	8b 45 10             	mov    0x10(%ebp),%eax
  103119:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10311c:	8b 45 14             	mov    0x14(%ebp),%eax
  10311f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  103122:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103125:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  103128:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10312b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  10312e:	8b 45 18             	mov    0x18(%ebp),%eax
  103131:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103134:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103137:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10313a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10313d:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103140:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103143:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103146:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10314a:	74 1c                	je     103168 <printnum+0x58>
  10314c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10314f:	ba 00 00 00 00       	mov    $0x0,%edx
  103154:	f7 75 e4             	divl   -0x1c(%ebp)
  103157:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10315a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10315d:	ba 00 00 00 00       	mov    $0x0,%edx
  103162:	f7 75 e4             	divl   -0x1c(%ebp)
  103165:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103168:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10316b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10316e:	f7 75 e4             	divl   -0x1c(%ebp)
  103171:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103174:	89 55 dc             	mov    %edx,-0x24(%ebp)
  103177:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10317a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10317d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103180:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103183:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103186:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  103189:	8b 45 18             	mov    0x18(%ebp),%eax
  10318c:	ba 00 00 00 00       	mov    $0x0,%edx
  103191:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  103194:	77 56                	ja     1031ec <printnum+0xdc>
  103196:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  103199:	72 05                	jb     1031a0 <printnum+0x90>
  10319b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  10319e:	77 4c                	ja     1031ec <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  1031a0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1031a3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031a6:	8b 45 20             	mov    0x20(%ebp),%eax
  1031a9:	89 44 24 18          	mov    %eax,0x18(%esp)
  1031ad:	89 54 24 14          	mov    %edx,0x14(%esp)
  1031b1:	8b 45 18             	mov    0x18(%ebp),%eax
  1031b4:	89 44 24 10          	mov    %eax,0x10(%esp)
  1031b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031bb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1031be:	89 44 24 08          	mov    %eax,0x8(%esp)
  1031c2:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1031c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d0:	89 04 24             	mov    %eax,(%esp)
  1031d3:	e8 38 ff ff ff       	call   103110 <printnum>
  1031d8:	eb 1b                	jmp    1031f5 <printnum+0xe5>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1031da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031dd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031e1:	8b 45 20             	mov    0x20(%ebp),%eax
  1031e4:	89 04 24             	mov    %eax,(%esp)
  1031e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ea:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  1031ec:	ff 4d 1c             	decl   0x1c(%ebp)
  1031ef:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1031f3:	7f e5                	jg     1031da <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1031f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1031f8:	05 30 3f 10 00       	add    $0x103f30,%eax
  1031fd:	0f b6 00             	movzbl (%eax),%eax
  103200:	0f be c0             	movsbl %al,%eax
  103203:	8b 55 0c             	mov    0xc(%ebp),%edx
  103206:	89 54 24 04          	mov    %edx,0x4(%esp)
  10320a:	89 04 24             	mov    %eax,(%esp)
  10320d:	8b 45 08             	mov    0x8(%ebp),%eax
  103210:	ff d0                	call   *%eax
}
  103212:	90                   	nop
  103213:	c9                   	leave  
  103214:	c3                   	ret    

00103215 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103215:	55                   	push   %ebp
  103216:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103218:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10321c:	7e 14                	jle    103232 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  10321e:	8b 45 08             	mov    0x8(%ebp),%eax
  103221:	8b 00                	mov    (%eax),%eax
  103223:	8d 48 08             	lea    0x8(%eax),%ecx
  103226:	8b 55 08             	mov    0x8(%ebp),%edx
  103229:	89 0a                	mov    %ecx,(%edx)
  10322b:	8b 50 04             	mov    0x4(%eax),%edx
  10322e:	8b 00                	mov    (%eax),%eax
  103230:	eb 30                	jmp    103262 <getuint+0x4d>
    }
    else if (lflag) {
  103232:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103236:	74 16                	je     10324e <getuint+0x39>
        return va_arg(*ap, unsigned long);
  103238:	8b 45 08             	mov    0x8(%ebp),%eax
  10323b:	8b 00                	mov    (%eax),%eax
  10323d:	8d 48 04             	lea    0x4(%eax),%ecx
  103240:	8b 55 08             	mov    0x8(%ebp),%edx
  103243:	89 0a                	mov    %ecx,(%edx)
  103245:	8b 00                	mov    (%eax),%eax
  103247:	ba 00 00 00 00       	mov    $0x0,%edx
  10324c:	eb 14                	jmp    103262 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  10324e:	8b 45 08             	mov    0x8(%ebp),%eax
  103251:	8b 00                	mov    (%eax),%eax
  103253:	8d 48 04             	lea    0x4(%eax),%ecx
  103256:	8b 55 08             	mov    0x8(%ebp),%edx
  103259:	89 0a                	mov    %ecx,(%edx)
  10325b:	8b 00                	mov    (%eax),%eax
  10325d:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103262:	5d                   	pop    %ebp
  103263:	c3                   	ret    

00103264 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  103264:	55                   	push   %ebp
  103265:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103267:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10326b:	7e 14                	jle    103281 <getint+0x1d>
        return va_arg(*ap, long long);
  10326d:	8b 45 08             	mov    0x8(%ebp),%eax
  103270:	8b 00                	mov    (%eax),%eax
  103272:	8d 48 08             	lea    0x8(%eax),%ecx
  103275:	8b 55 08             	mov    0x8(%ebp),%edx
  103278:	89 0a                	mov    %ecx,(%edx)
  10327a:	8b 50 04             	mov    0x4(%eax),%edx
  10327d:	8b 00                	mov    (%eax),%eax
  10327f:	eb 28                	jmp    1032a9 <getint+0x45>
    }
    else if (lflag) {
  103281:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103285:	74 12                	je     103299 <getint+0x35>
        return va_arg(*ap, long);
  103287:	8b 45 08             	mov    0x8(%ebp),%eax
  10328a:	8b 00                	mov    (%eax),%eax
  10328c:	8d 48 04             	lea    0x4(%eax),%ecx
  10328f:	8b 55 08             	mov    0x8(%ebp),%edx
  103292:	89 0a                	mov    %ecx,(%edx)
  103294:	8b 00                	mov    (%eax),%eax
  103296:	99                   	cltd   
  103297:	eb 10                	jmp    1032a9 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  103299:	8b 45 08             	mov    0x8(%ebp),%eax
  10329c:	8b 00                	mov    (%eax),%eax
  10329e:	8d 48 04             	lea    0x4(%eax),%ecx
  1032a1:	8b 55 08             	mov    0x8(%ebp),%edx
  1032a4:	89 0a                	mov    %ecx,(%edx)
  1032a6:	8b 00                	mov    (%eax),%eax
  1032a8:	99                   	cltd   
    }
}
  1032a9:	5d                   	pop    %ebp
  1032aa:	c3                   	ret    

001032ab <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1032ab:	55                   	push   %ebp
  1032ac:	89 e5                	mov    %esp,%ebp
  1032ae:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1032b1:	8d 45 14             	lea    0x14(%ebp),%eax
  1032b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1032b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032ba:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1032be:	8b 45 10             	mov    0x10(%ebp),%eax
  1032c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1032c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1032cf:	89 04 24             	mov    %eax,(%esp)
  1032d2:	e8 03 00 00 00       	call   1032da <vprintfmt>
    va_end(ap);
}
  1032d7:	90                   	nop
  1032d8:	c9                   	leave  
  1032d9:	c3                   	ret    

001032da <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1032da:	55                   	push   %ebp
  1032db:	89 e5                	mov    %esp,%ebp
  1032dd:	56                   	push   %esi
  1032de:	53                   	push   %ebx
  1032df:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1032e2:	eb 17                	jmp    1032fb <vprintfmt+0x21>
            if (ch == '\0') {
  1032e4:	85 db                	test   %ebx,%ebx
  1032e6:	0f 84 bf 03 00 00    	je     1036ab <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  1032ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032f3:	89 1c 24             	mov    %ebx,(%esp)
  1032f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f9:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1032fb:	8b 45 10             	mov    0x10(%ebp),%eax
  1032fe:	8d 50 01             	lea    0x1(%eax),%edx
  103301:	89 55 10             	mov    %edx,0x10(%ebp)
  103304:	0f b6 00             	movzbl (%eax),%eax
  103307:	0f b6 d8             	movzbl %al,%ebx
  10330a:	83 fb 25             	cmp    $0x25,%ebx
  10330d:	75 d5                	jne    1032e4 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  10330f:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103313:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10331a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10331d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103320:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103327:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10332a:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10332d:	8b 45 10             	mov    0x10(%ebp),%eax
  103330:	8d 50 01             	lea    0x1(%eax),%edx
  103333:	89 55 10             	mov    %edx,0x10(%ebp)
  103336:	0f b6 00             	movzbl (%eax),%eax
  103339:	0f b6 d8             	movzbl %al,%ebx
  10333c:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10333f:	83 f8 55             	cmp    $0x55,%eax
  103342:	0f 87 37 03 00 00    	ja     10367f <vprintfmt+0x3a5>
  103348:	8b 04 85 54 3f 10 00 	mov    0x103f54(,%eax,4),%eax
  10334f:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103351:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103355:	eb d6                	jmp    10332d <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  103357:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  10335b:	eb d0                	jmp    10332d <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  10335d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  103364:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103367:	89 d0                	mov    %edx,%eax
  103369:	c1 e0 02             	shl    $0x2,%eax
  10336c:	01 d0                	add    %edx,%eax
  10336e:	01 c0                	add    %eax,%eax
  103370:	01 d8                	add    %ebx,%eax
  103372:	83 e8 30             	sub    $0x30,%eax
  103375:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  103378:	8b 45 10             	mov    0x10(%ebp),%eax
  10337b:	0f b6 00             	movzbl (%eax),%eax
  10337e:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103381:	83 fb 2f             	cmp    $0x2f,%ebx
  103384:	7e 38                	jle    1033be <vprintfmt+0xe4>
  103386:	83 fb 39             	cmp    $0x39,%ebx
  103389:	7f 33                	jg     1033be <vprintfmt+0xe4>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  10338b:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  10338e:	eb d4                	jmp    103364 <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  103390:	8b 45 14             	mov    0x14(%ebp),%eax
  103393:	8d 50 04             	lea    0x4(%eax),%edx
  103396:	89 55 14             	mov    %edx,0x14(%ebp)
  103399:	8b 00                	mov    (%eax),%eax
  10339b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  10339e:	eb 1f                	jmp    1033bf <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  1033a0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033a4:	79 87                	jns    10332d <vprintfmt+0x53>
                width = 0;
  1033a6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1033ad:	e9 7b ff ff ff       	jmp    10332d <vprintfmt+0x53>

        case '#':
            altflag = 1;
  1033b2:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1033b9:	e9 6f ff ff ff       	jmp    10332d <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  1033be:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  1033bf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033c3:	0f 89 64 ff ff ff    	jns    10332d <vprintfmt+0x53>
                width = precision, precision = -1;
  1033c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1033cc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1033cf:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1033d6:	e9 52 ff ff ff       	jmp    10332d <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1033db:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  1033de:	e9 4a ff ff ff       	jmp    10332d <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1033e3:	8b 45 14             	mov    0x14(%ebp),%eax
  1033e6:	8d 50 04             	lea    0x4(%eax),%edx
  1033e9:	89 55 14             	mov    %edx,0x14(%ebp)
  1033ec:	8b 00                	mov    (%eax),%eax
  1033ee:	8b 55 0c             	mov    0xc(%ebp),%edx
  1033f1:	89 54 24 04          	mov    %edx,0x4(%esp)
  1033f5:	89 04 24             	mov    %eax,(%esp)
  1033f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033fb:	ff d0                	call   *%eax
            break;
  1033fd:	e9 a4 02 00 00       	jmp    1036a6 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103402:	8b 45 14             	mov    0x14(%ebp),%eax
  103405:	8d 50 04             	lea    0x4(%eax),%edx
  103408:	89 55 14             	mov    %edx,0x14(%ebp)
  10340b:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10340d:	85 db                	test   %ebx,%ebx
  10340f:	79 02                	jns    103413 <vprintfmt+0x139>
                err = -err;
  103411:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103413:	83 fb 06             	cmp    $0x6,%ebx
  103416:	7f 0b                	jg     103423 <vprintfmt+0x149>
  103418:	8b 34 9d 14 3f 10 00 	mov    0x103f14(,%ebx,4),%esi
  10341f:	85 f6                	test   %esi,%esi
  103421:	75 23                	jne    103446 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  103423:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103427:	c7 44 24 08 41 3f 10 	movl   $0x103f41,0x8(%esp)
  10342e:	00 
  10342f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103432:	89 44 24 04          	mov    %eax,0x4(%esp)
  103436:	8b 45 08             	mov    0x8(%ebp),%eax
  103439:	89 04 24             	mov    %eax,(%esp)
  10343c:	e8 6a fe ff ff       	call   1032ab <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103441:	e9 60 02 00 00       	jmp    1036a6 <vprintfmt+0x3cc>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  103446:	89 74 24 0c          	mov    %esi,0xc(%esp)
  10344a:	c7 44 24 08 4a 3f 10 	movl   $0x103f4a,0x8(%esp)
  103451:	00 
  103452:	8b 45 0c             	mov    0xc(%ebp),%eax
  103455:	89 44 24 04          	mov    %eax,0x4(%esp)
  103459:	8b 45 08             	mov    0x8(%ebp),%eax
  10345c:	89 04 24             	mov    %eax,(%esp)
  10345f:	e8 47 fe ff ff       	call   1032ab <printfmt>
            }
            break;
  103464:	e9 3d 02 00 00       	jmp    1036a6 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103469:	8b 45 14             	mov    0x14(%ebp),%eax
  10346c:	8d 50 04             	lea    0x4(%eax),%edx
  10346f:	89 55 14             	mov    %edx,0x14(%ebp)
  103472:	8b 30                	mov    (%eax),%esi
  103474:	85 f6                	test   %esi,%esi
  103476:	75 05                	jne    10347d <vprintfmt+0x1a3>
                p = "(null)";
  103478:	be 4d 3f 10 00       	mov    $0x103f4d,%esi
            }
            if (width > 0 && padc != '-') {
  10347d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103481:	7e 76                	jle    1034f9 <vprintfmt+0x21f>
  103483:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103487:	74 70                	je     1034f9 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103489:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10348c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103490:	89 34 24             	mov    %esi,(%esp)
  103493:	e8 f6 f7 ff ff       	call   102c8e <strnlen>
  103498:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10349b:	29 c2                	sub    %eax,%edx
  10349d:	89 d0                	mov    %edx,%eax
  10349f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1034a2:	eb 16                	jmp    1034ba <vprintfmt+0x1e0>
                    putch(padc, putdat);
  1034a4:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1034a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1034ab:	89 54 24 04          	mov    %edx,0x4(%esp)
  1034af:	89 04 24             	mov    %eax,(%esp)
  1034b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b5:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  1034b7:	ff 4d e8             	decl   -0x18(%ebp)
  1034ba:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1034be:	7f e4                	jg     1034a4 <vprintfmt+0x1ca>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1034c0:	eb 37                	jmp    1034f9 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  1034c2:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1034c6:	74 1f                	je     1034e7 <vprintfmt+0x20d>
  1034c8:	83 fb 1f             	cmp    $0x1f,%ebx
  1034cb:	7e 05                	jle    1034d2 <vprintfmt+0x1f8>
  1034cd:	83 fb 7e             	cmp    $0x7e,%ebx
  1034d0:	7e 15                	jle    1034e7 <vprintfmt+0x20d>
                    putch('?', putdat);
  1034d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034d9:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  1034e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e3:	ff d0                	call   *%eax
  1034e5:	eb 0f                	jmp    1034f6 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  1034e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ea:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034ee:	89 1c 24             	mov    %ebx,(%esp)
  1034f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f4:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1034f6:	ff 4d e8             	decl   -0x18(%ebp)
  1034f9:	89 f0                	mov    %esi,%eax
  1034fb:	8d 70 01             	lea    0x1(%eax),%esi
  1034fe:	0f b6 00             	movzbl (%eax),%eax
  103501:	0f be d8             	movsbl %al,%ebx
  103504:	85 db                	test   %ebx,%ebx
  103506:	74 27                	je     10352f <vprintfmt+0x255>
  103508:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10350c:	78 b4                	js     1034c2 <vprintfmt+0x1e8>
  10350e:	ff 4d e4             	decl   -0x1c(%ebp)
  103511:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103515:	79 ab                	jns    1034c2 <vprintfmt+0x1e8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103517:	eb 16                	jmp    10352f <vprintfmt+0x255>
                putch(' ', putdat);
  103519:	8b 45 0c             	mov    0xc(%ebp),%eax
  10351c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103520:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103527:	8b 45 08             	mov    0x8(%ebp),%eax
  10352a:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  10352c:	ff 4d e8             	decl   -0x18(%ebp)
  10352f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103533:	7f e4                	jg     103519 <vprintfmt+0x23f>
                putch(' ', putdat);
            }
            break;
  103535:	e9 6c 01 00 00       	jmp    1036a6 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10353a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10353d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103541:	8d 45 14             	lea    0x14(%ebp),%eax
  103544:	89 04 24             	mov    %eax,(%esp)
  103547:	e8 18 fd ff ff       	call   103264 <getint>
  10354c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10354f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103552:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103555:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103558:	85 d2                	test   %edx,%edx
  10355a:	79 26                	jns    103582 <vprintfmt+0x2a8>
                putch('-', putdat);
  10355c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10355f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103563:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  10356a:	8b 45 08             	mov    0x8(%ebp),%eax
  10356d:	ff d0                	call   *%eax
                num = -(long long)num;
  10356f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103572:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103575:	f7 d8                	neg    %eax
  103577:	83 d2 00             	adc    $0x0,%edx
  10357a:	f7 da                	neg    %edx
  10357c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10357f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103582:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103589:	e9 a8 00 00 00       	jmp    103636 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  10358e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103591:	89 44 24 04          	mov    %eax,0x4(%esp)
  103595:	8d 45 14             	lea    0x14(%ebp),%eax
  103598:	89 04 24             	mov    %eax,(%esp)
  10359b:	e8 75 fc ff ff       	call   103215 <getuint>
  1035a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035a3:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1035a6:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1035ad:	e9 84 00 00 00       	jmp    103636 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1035b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1035b5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035b9:	8d 45 14             	lea    0x14(%ebp),%eax
  1035bc:	89 04 24             	mov    %eax,(%esp)
  1035bf:	e8 51 fc ff ff       	call   103215 <getuint>
  1035c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035c7:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1035ca:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1035d1:	eb 63                	jmp    103636 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  1035d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035da:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  1035e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1035e4:	ff d0                	call   *%eax
            putch('x', putdat);
  1035e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035ed:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  1035f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1035f7:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1035f9:	8b 45 14             	mov    0x14(%ebp),%eax
  1035fc:	8d 50 04             	lea    0x4(%eax),%edx
  1035ff:	89 55 14             	mov    %edx,0x14(%ebp)
  103602:	8b 00                	mov    (%eax),%eax
  103604:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103607:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10360e:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103615:	eb 1f                	jmp    103636 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103617:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10361a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10361e:	8d 45 14             	lea    0x14(%ebp),%eax
  103621:	89 04 24             	mov    %eax,(%esp)
  103624:	e8 ec fb ff ff       	call   103215 <getuint>
  103629:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10362c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10362f:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103636:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10363a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10363d:	89 54 24 18          	mov    %edx,0x18(%esp)
  103641:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103644:	89 54 24 14          	mov    %edx,0x14(%esp)
  103648:	89 44 24 10          	mov    %eax,0x10(%esp)
  10364c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10364f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103652:	89 44 24 08          	mov    %eax,0x8(%esp)
  103656:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10365a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10365d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103661:	8b 45 08             	mov    0x8(%ebp),%eax
  103664:	89 04 24             	mov    %eax,(%esp)
  103667:	e8 a4 fa ff ff       	call   103110 <printnum>
            break;
  10366c:	eb 38                	jmp    1036a6 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  10366e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103671:	89 44 24 04          	mov    %eax,0x4(%esp)
  103675:	89 1c 24             	mov    %ebx,(%esp)
  103678:	8b 45 08             	mov    0x8(%ebp),%eax
  10367b:	ff d0                	call   *%eax
            break;
  10367d:	eb 27                	jmp    1036a6 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10367f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103682:	89 44 24 04          	mov    %eax,0x4(%esp)
  103686:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  10368d:	8b 45 08             	mov    0x8(%ebp),%eax
  103690:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103692:	ff 4d 10             	decl   0x10(%ebp)
  103695:	eb 03                	jmp    10369a <vprintfmt+0x3c0>
  103697:	ff 4d 10             	decl   0x10(%ebp)
  10369a:	8b 45 10             	mov    0x10(%ebp),%eax
  10369d:	48                   	dec    %eax
  10369e:	0f b6 00             	movzbl (%eax),%eax
  1036a1:	3c 25                	cmp    $0x25,%al
  1036a3:	75 f2                	jne    103697 <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  1036a5:	90                   	nop
        }
    }
  1036a6:	e9 37 fc ff ff       	jmp    1032e2 <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  1036ab:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  1036ac:	83 c4 40             	add    $0x40,%esp
  1036af:	5b                   	pop    %ebx
  1036b0:	5e                   	pop    %esi
  1036b1:	5d                   	pop    %ebp
  1036b2:	c3                   	ret    

001036b3 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1036b3:	55                   	push   %ebp
  1036b4:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1036b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036b9:	8b 40 08             	mov    0x8(%eax),%eax
  1036bc:	8d 50 01             	lea    0x1(%eax),%edx
  1036bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036c2:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1036c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036c8:	8b 10                	mov    (%eax),%edx
  1036ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036cd:	8b 40 04             	mov    0x4(%eax),%eax
  1036d0:	39 c2                	cmp    %eax,%edx
  1036d2:	73 12                	jae    1036e6 <sprintputch+0x33>
        *b->buf ++ = ch;
  1036d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036d7:	8b 00                	mov    (%eax),%eax
  1036d9:	8d 48 01             	lea    0x1(%eax),%ecx
  1036dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  1036df:	89 0a                	mov    %ecx,(%edx)
  1036e1:	8b 55 08             	mov    0x8(%ebp),%edx
  1036e4:	88 10                	mov    %dl,(%eax)
    }
}
  1036e6:	90                   	nop
  1036e7:	5d                   	pop    %ebp
  1036e8:	c3                   	ret    

001036e9 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1036e9:	55                   	push   %ebp
  1036ea:	89 e5                	mov    %esp,%ebp
  1036ec:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1036ef:	8d 45 14             	lea    0x14(%ebp),%eax
  1036f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1036f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1036f8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1036fc:	8b 45 10             	mov    0x10(%ebp),%eax
  1036ff:	89 44 24 08          	mov    %eax,0x8(%esp)
  103703:	8b 45 0c             	mov    0xc(%ebp),%eax
  103706:	89 44 24 04          	mov    %eax,0x4(%esp)
  10370a:	8b 45 08             	mov    0x8(%ebp),%eax
  10370d:	89 04 24             	mov    %eax,(%esp)
  103710:	e8 08 00 00 00       	call   10371d <vsnprintf>
  103715:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103718:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10371b:	c9                   	leave  
  10371c:	c3                   	ret    

0010371d <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10371d:	55                   	push   %ebp
  10371e:	89 e5                	mov    %esp,%ebp
  103720:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103723:	8b 45 08             	mov    0x8(%ebp),%eax
  103726:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103729:	8b 45 0c             	mov    0xc(%ebp),%eax
  10372c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10372f:	8b 45 08             	mov    0x8(%ebp),%eax
  103732:	01 d0                	add    %edx,%eax
  103734:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103737:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10373e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103742:	74 0a                	je     10374e <vsnprintf+0x31>
  103744:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103747:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10374a:	39 c2                	cmp    %eax,%edx
  10374c:	76 07                	jbe    103755 <vsnprintf+0x38>
        return -E_INVAL;
  10374e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103753:	eb 2a                	jmp    10377f <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103755:	8b 45 14             	mov    0x14(%ebp),%eax
  103758:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10375c:	8b 45 10             	mov    0x10(%ebp),%eax
  10375f:	89 44 24 08          	mov    %eax,0x8(%esp)
  103763:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103766:	89 44 24 04          	mov    %eax,0x4(%esp)
  10376a:	c7 04 24 b3 36 10 00 	movl   $0x1036b3,(%esp)
  103771:	e8 64 fb ff ff       	call   1032da <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103776:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103779:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10377c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10377f:	c9                   	leave  
  103780:	c3                   	ret    
