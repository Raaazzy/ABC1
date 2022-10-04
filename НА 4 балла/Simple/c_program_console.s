	.file	"c_program_console.c"
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 4000
A: #array A
	.zero	4000
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 4000
B: #array B
	.zero	4000
	.globl	length
	.align 4
	.type	length, @object
	.size	length, 4
length: #length of A
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i: # iterator
	.zero	4
	.text
	.globl	Task
	.type	Task, @function
Task: # Solution function
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L4:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jns	.L3
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L3
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	B(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	addl	$1, -4(%rbp)
.L3:
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L4
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	Task, .-Task
	.section	.rodata
	.align 8
.LC0:
	.string	"Input length (0 < length <= %d): "
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect length = %d\n"
.LC3:
	.string	"A[%d]? "
.LC4:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1000, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	length(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	length(%rip), %eax
	testl	%eax, %eax
	jle	.L7
	movl	length(%rip), %eax
	cmpl	$1000, %eax
	jle	.L8
.L7:
	movl	length(%rip), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L9
.L8:
	movl	$0, i(%rip)
	jmp	.L10
.L11:
	movl	i(%rip), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	A(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L10:
	movl	i(%rip), %edx
	movl	length(%rip), %eax
	cmpl	%eax, %edx
	jl	.L11
	movl	length(%rip), %eax
	movl	%eax, %esi
	leaq	A(%rip), %rax
	movq	%rax, %rdi
	call	Task
	movl	%eax, -4(%rbp)
	movl	$0, i(%rip)
	jmp	.L12
.L13:
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	B(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L12:
	movl	i(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jg	.L13
	movl	$0, %eax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
