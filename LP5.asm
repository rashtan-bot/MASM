;Write a program to find the square of a number (1 to 10) using a look-up table.
		area sqr,code,readonly 		;allocate memory for code segment
		entry 						;beginning of the code segment
		ldr r0,lookup 				;load address of lookup table to r0
		ldr r2,res 					;load address of res to r2
		ldrb r1,[r0] 				;load the number to r1
		add r0,r0,r1 				;add the contents of r0 & r1
		ldrb r3,[r0] 				;load the square of number to r3
		strb r3,[r2] 				;store the result at the address pointed by r2
l 		b 		l 					;infinite loop
lookup 	dcd 	0x40000000 			;starting address of lookup table
res 	dcd		0x4000000B 			;starting address of the result
		end							;end of the code segment
