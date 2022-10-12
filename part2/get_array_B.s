#rbx - параметр A
#r12d - параметр size
#r13 - параметр B
#r14d - counter
#r15d - i
	.file	"get_array_B.c"
	.intel_syntax noprefix
	.text
	.globl	Task
	.type	Task, @function
Task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	rbx, rdi # параметр A
	mov	r12d, esi # параметр size
	mov	r13, rdx # параметр B
	mov	r14d, 0 # counter
	mov	r15d, 0 # i
	jmp	.L2
.L4:
	mov	eax, r15d
	cdqe
	lea	rdx, 0[0+rax*4] #сдвиг для i
	mov	rax, rbx # массив &A в rax
	add	rax, rdx #получаем &A[i]
	mov	eax, DWORD PTR [rax] ##получаем A[i]
	test	eax, eax
	jns	.L3
	mov	eax, r15d #i в регистр eax
	cdqe
	lea	rdx, 0[0+rax*4]#сдвиг для i
	mov	rax, rbx # массив &A в rax
	add	rax, rdx #получаем &A[i]
	mov	eax, DWORD PTR [rax]##получаем A[i]
	and	eax, 1
	test	eax, eax
	jne	.L3
	mov	eax, r15d#i в регистр eax
	cdqe
	lea	rdx, 0[0+rax*4]#сдвиг для i
	mov	rax, rbx #получаем &A[i]
	add	rax, rdx
	mov	edx, r14d#counter в регистр edx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]#сдвиг для i
	mov	rdx, r13  # массив &B в rdx
	add	rdx, rcx
	mov	eax, DWORD PTR [rax] ##получаем A[i]
	mov	DWORD PTR [rdx], eax 
	add	r14d, 1 # инкрементируем counter
.L3:
	add	r15d, 1 # инкрементирую i
.L2:
	mov	eax, r15d
	cmp	eax, r12d # сравниваю i и size
	jl	.L4
	mov	eax, r14d # возвращаю counter
	pop	rbp
	ret
	.size	Task, .-Task
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
