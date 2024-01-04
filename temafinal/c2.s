.section .data
	matrix: .space 1600
	copy: .space 1600
	columnIndex: .space 4
	lineIndex: .space 4
	lines: .space 4
	columns: .space 4
	puncte: .space 4
	iteratii: .space 4
	index: .space 4
	eight: .space 4
	left: .space 4
	right: .space 4
	up: .space 4
	down: .space 4
	zero: .space 4
	total: .space 4
	newlines: .space 4
	newcolumns: .space 4
	totallines: .space 4
	totalcolumns: .space 4
	indexul: .space 4
	currentpoz: .space 4
	mesajcriptat: .space 1200
	up1: .space 4
	up2: .space 4
	up3: .space 4
	now1: .space 4
	now2: .space 4
	now3: .space 4
	down1: .space 4
	down2: .space 4
	down3: .space 4
	sum: .space 4
	ex: .space 4
	totalcopy: .space 4
	lenmesajtext: .space 4
	criptare: .space 4
	mesajtext: .space 1200
	mesajhexa: .space 1200
	zerox: .asciz "0x"
	formatchar: .asciz "%c"
	formatprintf: .asciz "%d "
	formatscanf: .asciz "%d"
	char: .asciz "%c"
	enter: .asciz "\n"
	stringscanf: .asciz "%s"
	stringprintf: .asciz "%s\n"
	special: .asciz "%X"
.text
.global main
	main:
		pushl $lines
		pushl $formatscanf
		call scanf
		addl $8, %esp
		movl lines, %eax
		add $2, %eax
		movl %eax, lines
		pushl $columns
		pushl $formatscanf
		call scanf
		addl $8, %esp
		movl columns, %eax
		add $2, %eax
		movl %eax, columns
		movl lines, %eax
		movl columns, %ebx
		mov $0, %edx
		mul %ebx
		movl %eax, total
		pushl $puncte
		pushl $formatscanf
		call scanf
		addl $8, %esp
	movl $0, index
et_for:
		movl index, %ecx
		cmp puncte, %ecx
		je final1
		pushl $left
		pushl $formatscanf
		call scanf
		addl $8, %esp
		movl left, %eax
		add $1, %eax
		movl %eax, left
		pushl $right
		pushl $formatscanf
		call scanf
		addl $8, %esp
		movl right, %eax
		add $1, %eax
		movl %eax, right
		movl left, %eax
		movl columns, %ebx
		mov $0, %edx
		mul %ebx
		addl right, %eax
		movl %eax, %ebx
		lea matrix, %edi
		movl $1, (%edi, %ebx, 4)
		incl index
		jmp et_for
	final1:
	pushl $iteratii
	pushl $formatscanf
	call scanf
	addl $8, %esp
	movl $0, index
	movl lines, %eax
	subl $1, %eax
	movl %eax, newlines
	movl columns, %eax
	subl $1, %eax
	movl %eax, newcolumns
iterare:
		movl index, %ecx
		cmp iteratii, %ecx
		je final3
		movl $1, lineIndex
		for_lines:
			movl lineIndex, %ecx
			cmp newlines, %ecx
			je finit
			movl $1, columnIndex
			for_columns:
				movl columnIndex, %ecx
				cmp newcolumns, %ecx
				je cont	
				xor %eax, %eax
				xor %edx, %edx
				movl columnIndex, %ebx
				movl lineIndex, %eax
				movl columns, %ecx
				mull %ecx
				addl %ebx, %eax
				lea matrix, %edi
				movl (%edi, %eax, 4), %ebx
				movl %ebx, now2
				movl %ecx, %eax
				subl $1, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, now1
				movl %ecx, %eax
				addl $1, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, now3
				xor %eax, %eax
				xor %edx, %edx
				movl columnIndex, %ebx
				movl lineIndex, %eax
				sub $1, %eax
				movl columns, %ecx
				xor %edx, %edx
				mull %ecx
				addl %ebx, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, up2
				sub $1, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, up1
				add $2, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, up3
				movl columnIndex, %ebx
				movl lineIndex, %eax
				add $1, %eax
				movl columns, %ecx
				mull %ecx
				addl %ebx, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, down2
				sub $1, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, down1
				add $2, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, down3
				movl columnIndex, %ebx
				movl lineIndex, %eax
				movl columns, %ecx
				mull %ecx
				addl %ebx, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, now2
				movl %eax, currentpoz
				sub $1, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, now1
				add $2, %eax
				movl (%edi, %eax, 4), %ebx
				movl %ebx, now3
				xor %eax, %eax
				add up1, %eax
				add up2, %eax
				add up3, %eax
				add down1, %eax
				add down2, %eax
				add down3, %eax
				add now1, %eax
				add now3, %eax
				movl %eax, sum
				movl now2, %ebx
				jmp et_makezero
				back:
				movl sum, %eax
				movl now2, %ebx
				cmp $0, %ebx
				je ifzero
				jmp overifzero
				ifzero:
					cmp $3, %eax
					je makeone
					jmp overmakeone
					makeone:
						movl currentpoz, %eax
						lea copy, %esi
						movl $1, (%esi, %eax, 4)
					overmakeone:
				overifzero:
				movl sum, %eax
				movl now2, %ebx
				cmp $1, %ebx
				je ifone
				jmp overifone
				ifone:
					cmp $3, %eax
					je makeone2
					cmp $2, %eax
					je makeone2
					jmp overmakeone2
					makeone2:
						movl currentpoz, %eax
						lea copy, %esi
						movl $1, (%esi, %eax, 4)
						movl (%esi, %eax, 4), %ebx
					overmakeone2:
				overifone:
				incl columnIndex
				jmp for_columns
		cont:
			incl lineIndex
			jmp for_lines
		finit:
		jmp et_copymain
		backmain:
		incl index
		jmp iterare
final3:
lea matrix, %edi
pushl $criptare
pushl $formatscanf
call scanf
addl $8, %esp
movl criptare, %eax
cmp $0, %eax
je cerinta1
cmp $1, %eax
je cerinta2
jmp pestecerinta1
cerinta1:
	pushl $mesajtext
	pushl $stringscanf
	call scanf
	addl $8, %esp
	lea mesajtext, %esi
	movl $0, %eax
	lenmesaj:
		cmpb $0, (%esi)
		je finallen
		inc %eax
		inc %esi
		jmp lenmesaj
		finallen:
		movl %eax, lenmesajtext
	pushl $zerox	
	call printf
	add $4, %esp
	pushl $0
	call fflush
	add $4, %esp
	mov $0, %eax
	mov $0, %ebx
	mov $0, %ecx
	mov $0, %edx
	lea mesajtext, %esi
	biti:
		cmp %ecx, lenmesajtext	
		je endof
		movl $8, eight	
		mov $0, %eax		
			compose:
				cmp %edx, total	
				je makez
				jmp overmakez
				makez:
				mov $0, %edx
				overmakez:
	
				movl eight, %ebx
				cmp $0, %ebx		
				je end_compose
				movl (%edi, %edx, 4), %ebx	
				sal $1, %eax		
				add %ebx, %eax		
				decl eight
				inc %edx	
				jmp compose
			end_compose:
		xorb (%esi, %ecx, 1), %al
	pusha
		movl %eax, %ebx
		sar $4, %ebx
		cmp $0, %ebx
		ja saltul
		push %ebx
		push $special
		call printf
		add $8, %esp
		pushl $0
		call fflush
		add $4, %esp
		popa
		pusha
		saltul:
		push %eax
		push $special
		call printf
		add $8, %esp
		pushl $0
		call fflush
		add $4, %esp
	popa
	inc %ecx
	jmp biti
	endof:
pestecerinta1:
jmp et_exit
jmp pestecerinta2

cerinta2:
 pushl $mesajtext
	pushl $stringscanf
	call scanf
	addl $8, %esp
	lea mesajtext, %esi
	add $2, %esi
	movl $0, %eax
	movl $0, lenmesajtext

	lenmesaj2:
		cmpb $0, (%esi)
		je finallen2
		inc %eax
		inc %esi
		jmp lenmesaj2
		finallen2:
		movl %eax, lenmesajtext
	mov lenmesajtext, %eax
	sar $1, %eax
	movl %eax, lenmesajtext
	lea mesajtext, %esi
	add $2, %esi
	mov $0, %eax
	mov $0, %ebx
	mov $0, %ecx
	mov $0, %edx
	biti2:
		cmp %ecx, lenmesajtext	
		je endof2
		movl $8, eight	
		xorl %eax, %eax		
			compose2:
				cmpl %edx, total	
				je makez2
				jmp overmakez2
				makez2:
				mov $0, %edx
				overmakez2:	
				mov eight, %ebx
				cmp $0, %ebx		
				je end_compose2
				movl (%edi, %edx, 4), %ebx	
				sal $1, %eax
				add %ebx, %eax	
				movl ex, %ebx	
				decl eight
				inc %edx	
				jmp compose2
			end_compose2:
			movl %eax, ex
		mov $0, %eax
		movl %ecx, %ebx
		sal $1, %ebx
		movb (%esi, %ebx, 1), %ah
		cmpb $60, %ah
		jl nb
		sub $55, %ah
		jmp p2
		nb:
		sub $48, %ah
		p2:
		inc %ebx
		mov (%esi, %ebx, 1), %al
		cmp $60, %al
		jl num
		sub $55, %al
		jmp ok
		num:
		sub $48, %al
		ok:	
		mov %al, %bl		
		sar $4, %eax		
		add %bl, %al		
	movl ex, %ebx
	xorb %al, %bl
		pusha
		push %ebx
		push $char
		call printf
		add $8, %esp
		push $0 
		call fflush 
		add $4, %esp
		popa
	incl %ecx
	jmp biti2
	endof2:
	pestecerinta2:
jmp overcopymain
et_copymain:
	movl $0, indexul
	lea matrix, %edi
	lea copy, %esi
	copiere:
		movl indexul, %ecx
		cmp total, %ecx
		je backmain
		movl (%esi, %ecx, 4), %ebx
		movl %ebx, (%edi, %ecx, 4)
		incl indexul
		jmp copiere
		jmp back
	finalcopy:
		overcopymain:
jmp overmakezero
et_makezero:
	movl $0, indexul
	lea copy, %edi
		movl currentpoz, %eax
		movl $0, (%edi, %eax, 4)
		jmp back	
	overmakezero:
et_exit:
		mov $1, %eax
		mov $0, %ebx
		int $0x80





