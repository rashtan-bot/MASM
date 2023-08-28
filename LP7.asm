;Write a program to arrange a series of 32 bit numbers in ascending/descending order.
		area assort,code,readonly	;allocate memory for code segment
		entry						;beginning of code segment
		mov r5,#5					;N-1 passes
nxtpass	ldr r0,A					;load starting address of array into r0
		mov r4,r5					;N-1 comparision
nxtcomp	ldr r2,[r0]					;read first number
		mov r1,r2					;save number in r1
		add r0,#4					;Update the pointer
		ldr r2,[r0]					;read second number
		cmp	r1,r2					;Compare first number with second number
		bls	noexg					;If first number is less than second number then the exchange is not required
		str r1,[r0],#-4				;exchange the number
		str r2,[r0],#4				;exchange the number
noexg	subs r4,#1					;decrement number of comparisions
		bne	nxtcomp					;if r4!=0 goto nxtcomp
		subs r5,#1					;decrement number of comparisions
		bne nxtpass					;if r5!=0 goto next
l		b		l					;infinite loop
A		dcd		0x40000000			;Starting address of array
		end							;end of code segment