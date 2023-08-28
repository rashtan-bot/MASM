;Write a program to find the sum of the first 10 integer numbers.
		area sum,code,readonly		;allocate memory for code segment
		entry 						;beginning of the code segment
		mov r0,#10					;counter for 10 integer numbers
		mov r1,#0					;copy partial sum to register r1
		mov r2,#1					;copy first number to register r2
next	add r1,r1,r2				;add partial sum with first number
		add r2,#1					;update the next integer value
		subs r0,#1					;decrement the counter
		bne next					;if counter r0!=0 repeat
		ldr r3,res					;get the address of the result
		str r1,[r3]					;store the result (final sum)
l		b		l					;infinite loop
res		dcd		0x40000000			;initialize memory location res with address
		end							;end of the code segment
