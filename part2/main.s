# -4[rbp]- i
# -196[rbp] - length
# -212[rbp] - argc
# -224[rbp] - argv
# -16[rbp] - input
# -112[rbp] - A
# -192[rbp] - B
# -20[rbp] - b_size
# -32[rbp] - output

	.file	"c_program_console.c"
	.intel_syntax noprefix
	.text
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
	.string	"r"
.LC5:
	.string	"input.txt"
.LC6:
	.string	"w"
.LC7:
	.string	"output.txt"
.LC8:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 224
	mov	DWORD PTR -212[rbp], edi #запись argc 
	mov	QWORD PTR -224[rbp], rsi #запись argv
	cmp	DWORD PTR -212[rbp], 1	 #сравниваем argc c 1
	jle	.L2
	mov	rax, QWORD PTR -224[rbp] #запись argv в rax
	add	rax, 8 # сдвигаю указатель на аргумент командной строки(первый - имя программы)
	mov	rax, QWORD PTR [rax] # передаю в rax значение аргумента командной строки
	mov	rdi, rax # Передаю в rdi(первый аргумент ф-ции) значение аргумента командной строки
	call	atoi@PLT
	test	eax, eax
	jne	.L3
.L2: # считывание length
	mov	esi, 20
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -196[rbp] # устанавливаем ссылку на length
	mov r12d, -196[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	test	eax, eax
	jle	.L4
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	cmp	eax, 20 # сравнение  length с 20
	jle	.L5
.L4: # if length is incorrect
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	mov	esi, eax # 2-й аргумент ф-ции.
	lea	rax, .LC2[rip]
	mov	rdi, rax # 1-й аргумент ф-ции.
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L25
.L5: # инициализация i
	mov	ebx, 0 # инициализируем i нулем
	jmp	.L7
.L8: 
	mov	eax, ebx # записываю i в регистр eax
	mov	esi, eax # 2-й аргумент ф-ции.
	lea	rax, .LC3[rip]
	mov	rdi, rax # 1-й аргумент ф-ции.
	mov	eax, 0
	call	printf@PLT
	mov	eax, ebx # записываю i в регистр eax
	cdqe
	lea	rdx, 0[0+rax*4] # записываю смещение в байтах на i в rdx
	lea	rax, -112[rbp] #записываю &A[0] в rax
	mov r13, -112[rbp]
	add	rax, rdx # добавляю смещение к нулевому эл-ту, тем самым получаю i-ый эл-т
	mov	rsi, rax #второй аргумент ф-ции
	lea	rax, .LC1[rip]
	mov	rdi, rax #первый аргумент ф-ции
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	ebx, 1 # инкрементирую i
.L7:
	mov	eax, DWORD PTR -196[rbp]# записываем length в eax
	cmp	ebx, eax # сравниваю i и length
	jl	.L8
	jmp	.L9
.L3:
	mov	rax, QWORD PTR -224[rbp] # запись argv в rax
	add	rax, 8 # сдвигаю указатель на аргумент командной строки(первый - имя программы)
	mov	rax, QWORD PTR [rax] # передаю в rax значение аргумента командной строки
	mov	rdi, rax # Передаю в rdi(первый аргумент ф-ции) значение аргумента командной строки
	call	atoi@PLT
	cmp	eax, 1 # сравниваю аргумент командной строки с 1
	jne	.L10
	lea	rax, .LC4[rip]
	mov	rsi, rax # 2-й аргумент ф-ции
	lea	rax, .LC5[rip]
	mov	rdi, rax # 1-й аргумент ф-ции.
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax #записываем rax в input
	lea	rdx, -196[rbp]# записываем length в rdx
	mov r12d, -196[rbp]
	mov	rax, QWORD PTR -16[rbp] # записываем input в rax
	lea	rcx, .LC1[rip]
	mov	rsi, rcx # 2-й аргумент ф-ции
	mov	rdi, rax # 1-й аргумент ф-ции.
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	test	eax, eax
	jle	.L11
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	cmp	eax, 20
	jle	.L12
.L11:
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	mov	esi, eax # 2-й аргумент ф-ции.
	lea	rax, .LC2[rip] 
	mov	rdi, rax # 1-й аргумент ф-ции.
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L25
.L12:#инициализирую i 0
	mov	ebx, 0 #инициализирую i 0
	jmp	.L13
.L14:
	mov	eax, ebx # записываю i в регистр eax
	cdqe
	lea	rdx, 0[0+rax*4] # записываю смещение в байтах на i в rdx
	lea	rax, -112[rbp] #записываю &A[0] в rax
	mov r13, -112[rbp]
	add	rdx, rax # добавляю смещение к нулевому эл-ту, тем самым получаю i-ый эл-т
	mov	rax, QWORD PTR -16[rbp] # записываем input в rax
	lea	rcx, .LC1[rip]
	mov	rsi, rcx # 2-й аргумент ф-ции.
	mov	rdi, rax # 1-й аргумент ф-ции.
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	ebx, 1 #инкрементирую i
.L13:
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	cmp	ebx, eax #сравниваю i и length
	jl	.L14
	jmp	.L9
.L10:
	mov	rax, QWORD PTR -224[rbp] # запись argv в rax
	add	rax, 8 # сдвигаю указатель на аргумент командной строки(первый - имя программы)
	mov	rax, QWORD PTR [rax]# передаю в rax значение аргумента командной строки
	mov	rdi, rax# Передаю в rdi(первый аргумент ф-ции) значение аргумента командной строки
	call	atoi@PLT
	cmp	eax, 2 # сравниваю аргумент командной строки с 2
	jne	.L9
	mov	edi, 0
	call	time@PLT
	mov	edi, eax # передаю в edi(первый аргумент ф-ции) eax(возвращаемое значение time())
	call	srand@PLT
	mov	DWORD PTR -196[rbp], 0 # записываем 0 в length
	jmp	.L15
.L16:
	call	rand@PLT
	mov	DWORD PTR -196[rbp], eax # записываем eax в length
.L15:
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	test	eax, eax
	jle	.L16
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	cmp	eax, 20
	jg	.L16
	mov	ebx, 0 #инициализирую i 0
	jmp	.L17
.L19:
	call	rand@PLT
	mov	edx, ebx  # записываю i в регистр edx
	movsx	rdx, edx
	mov	DWORD PTR -112[rbp+rdx*4], eax #записываю рандомное число(Возвращено из ф-ции в регистре eax) на i-ю позицию массива A
	mov	eax, ebx  # записываю i в регистр eax
	cdqe
	mov	eax, DWORD PTR -112[rbp+rax*4] #записываю A[i] в eax
	and	eax, 3
	test	eax, eax
	jne	.L18
	mov	eax, ebx  # записываю i в регистр eax
	cdqe
	mov	eax, DWORD PTR -112[rbp+rax*4] #записываю A[i] в eax
	neg	eax
	mov	edx, eax
	mov	eax, ebx  # записываю i в регистр eax
	cdqe
	mov	DWORD PTR -112[rbp+rax*4], edx #записываю A[i] в A[i]
.L18:
	add	ebx, 1 #инкрементирую i
.L17:
	mov	eax, DWORD PTR -196[rbp] # записываем length в eax
	cmp	ebx, eax #сравниваю length и i
	jl	.L19
.L9:
	mov	ecx, DWORD PTR -196[rbp] # записываем length в ecx
	lea	rdx, -192[rbp] #записываю &B[0] в rdx (третий аргумент ф-ции)
	mov r14, -192[rbp]
	lea	rax, -112[rbp] #записываю &A[0] в rax
	mov r13, -112[rbp]
	mov	esi, ecx #записываю ecx в esi  (второй аргумент ф-ции)
	mov	rdi, rax # перевожу rax в rdi (первый аргумент ф-ции)
	call	Task@PLT
	mov	r15d, eax # записываю (возвращаемое значение из Task) eax в b_size 
	cmp	DWORD PTR -212[rbp], 1 # сравниваем argc c 1
	jle	.L20
	mov	rax, QWORD PTR -224[rbp] # запись argv в rax
	add	rax, 8  # сдвигаю указатель на аргумент командной строки(первый - имя программы)
	mov	rax, QWORD PTR [rax] # передаю в rax значение аргумента командной строки
	mov	rdi, rax # Передаю в rdi(первый аргумент ф-ции) значение аргумента командной строки
	call	atoi@PLT
	cmp	eax, 1 # сравниваю аргумент командной строки с 1
	jne	.L20
	lea	rax, .LC6[rip]
	mov	rsi, rax # 2-й аргумент ф-ции.
	lea	rax, .LC7[rip]
	mov	rdi, rax #первый аргумент ф-ции
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax #заполняю output из rax(возвращаемое значение fopen)
	mov	ebx, 0 #инициализирую i 0
	jmp	.L21
.L22:
	mov	eax, ebx  # записываю i в регистр eax
	cdqe
	mov	edx, DWORD PTR -192[rbp+rax*4] #записываю B[i] в edx
	mov	rax, QWORD PTR -32[rbp] #записываю output в rax
	lea	rcx, .LC1[rip]
	mov	rsi, rcx # второй аргумент ф-ции
	mov	rdi, rax #записываю output в rdi(первый аргумент ф-ции)
	mov	eax, 0
	call	fprintf@PLT
	add	ebx, 1 #инкрементирую i
.L21:
	mov	eax, ebx  # записываю i в регистр eax
	cmp	eax, r15d # сравниваю b_size и i
	jl	.L22
	mov	eax, 0
	jmp	.L25
.L20: #инициализирую i 0
	mov	ebx, 0 #инициализирую i 0
	jmp	.L23
.L24:
	mov	eax, ebx  # записываю i в регистр eax
	cdqe
	mov	eax, DWORD PTR -192[rbp+rax*4] #записываю B[i] в edx
	mov	esi, eax # второй аргумент ф-ции
	lea	rax, .LC8[rip]
	mov	rdi, rax # первый аргумент ф-ции
	mov	eax, 0
	call	printf@PLT
	add	ebx, 1 #инкрементирую i
.L23:
	mov	eax, ebx  # записываю i в регистр eax
	cmp	eax, r15d # сравниваю b_size и i
	jl	.L24
	mov	eax, 0
.L25:
	leave
	ret
	.size	main, .-main
