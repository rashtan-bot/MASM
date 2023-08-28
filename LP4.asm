;Write a program to add an array of 16 bit numbers and store the 32 bit result in internal RAM.
		area asum,code,readonly	 	;allocate memory for code segment
		entry 						;beginning of the code segment
		ldr r0,mem 					;load r0 with the starting address
		mov r1,#4 					;load the array size into r1
		ldrh r2,[r0] 				;load first number
		add r1,#-1 					;decrement the counter by 1
up 		add r0,r0,#2 				;Increment the pointer by 2
		ldrh r3,[r0] 				;load second number
		add r2,r3,r2	 			;r2=r3+r2
		add r1,#-1 					;decrement the counter by 1
		cmp r1,#0 					;Is ctr=0
		bne up 						;if ctr!=0 then execute label up
		ldr r0,res 					;load starting address of res into r0
		str r2,[r0] 				;store the result
l		b		l 					;infinite loop
mem 	dcd		0x40000000 			;starting address of the array
res 	dcd		0x40000010 			;starting address of the result
		end 						;end of the code segment
