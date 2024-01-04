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
	left: .space 4
	right: .space 4
	up: .space 4
	down: .space 4
	zero: .space 4
	total: .space 4
	newlines: .space 4
	newcolumns: .space 4
	indexul: .space 4
	currentpoz: .space 4
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
	formatprintf: .asciz "%d "
	formatscanf: .asciz "%d"
	enter: .asciz "\n"
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
		xor %edx, %edx
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
		xor %edx, %edx
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
	afisare:
		movl $1, lineIndex
		for_liness:
			movl lineIndex, %ecx
			cmp newlines, %ecx
			je final2
			movl $1, columnIndex
			for_columnss:
				movl columnIndex, %ecx
				cmp newcolumns, %ecx
				je contt
				xor %eax, %eax
				xor %edx, %edx
				movl columnIndex, %ebx
				movl lineIndex, %eax
				movl columns, %edx
				mull %edx
				addl %ebx, %eax
				lea matrix, %edi
				movl (%edi, %eax, 4), %ebx
				push %ebx
				push $formatprintf
				call printf
				addl $8, %esp
				pushl $0
				call fflush
				add $4, %esp
				incl columnIndex
				jmp for_columnss
		contt:
			movl $4, %eax
			movl $1, %ebx
			movl $enter, %ecx
			movl $2, %edx
			int $0x80
			incl lineIndex
			jmp for_liness
    final2:
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




