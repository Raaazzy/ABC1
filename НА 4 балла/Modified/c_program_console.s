	.file	"c_program_console.c"
	.intel_syntax noprefix
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
i: #iterator
	.zero	4
	.text
	.globl	Task
	.type	Task, @function
Task: #Solution function
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L3
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	and	eax, 1
	test	eax, eax
	jne	.L3
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	lea	rdx, B[rip]
	mov	DWORD PTR [rcx+rdx], eax
	add	DWORD PTR -4[rbp], 1
.L3:
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L4
	mov	eax, DWORD PTR -4[rbp]
	pop	rbp
	ret
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	esi, 1000
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, length[rip]
	mov	rsi, rax
	lea	rax, .LC1[rip] //Аргумент для scanf
	mov	rdi, rax //Записываю значение аргумента для scanf
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR length[rip]//Считывает длинну
	test	eax, eax
	jle	.L7
	mov	eax, DWORD PTR length[rip]//Считывает длинну
	cmp	eax, 1000
	jle	.L8
.L7: //Incorrect input
	mov	eax, DWORD PTR length[rip] //Считывает длинну
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L9
.L8:
	mov	DWORD PTR i[rip], 0 //инициализирует итератор
	jmp	.L10
.L11:
	mov	eax, DWORD PTR i[rip] //Записывается итератор в регистр
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR i[rip] //Записывается итератор в регистр
	cdqe
	lea	rdx, 0[0+rax*4] //
	lea	rax, A[rip] //записываем указатель на массив A в регистр
	add	rax, rdx //двигаем указатель на значение итератора
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR i[rip] //Записывается итератор в регистр
	add	eax, 1 //Увеличиваю итератор на 1
	mov	DWORD PTR i[rip], eax //Записывается регистр в итератор
.L10:
	mov	edx, DWORD PTR i[rip] //Записывается итератор в регистр
	mov	eax, DWORD PTR length[rip] //Записывается длинну в регистр
	cmp	edx, eax
	jl	.L11
	mov	eax, DWORD PTR length[rip] //Записывается длинну в регистр
	mov	esi, eax
	lea	rax, A[rip] 
	mov	rdi, rax
	call	Task
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR i[rip], 0 //Записываю 0 в итератор
	jmp	.L12
.L13://For для вывода массива B
	mov	eax, DWORD PTR i[rip] //Записывается итератор в регистр
	cdqe
	lea	rdx, 0[0+rax*4]//???
	lea	rax, B[rip] //Передаем указатель на Массив B
	mov	eax, DWORD PTR [rdx+rax] //Получаем значение массива B от итератора
	mov	esi, eax 
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR i[rip]//Записывается итератор в регистр
	add	eax, 1
	mov	DWORD PTR i[rip], eax //Хаписывается Итератор+1 в итератор
.L12:
	mov	eax, DWORD PTR i[rip]
	cmp	DWORD PTR -4[rbp], eax
	jg	.L13
	mov	eax, 0
.L9:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
