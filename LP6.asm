;Write a program to find the largest or smallest number in an array of 32 numbers.
		area largest,code,readonly 		;allocate memory for code segment
		entry 							;beginning of the code segment
		mov r5,#5 						;No.of comparisons
		ldr r0,A 						;load address of array to r0
		ldr r2,[r0] 					;load the first number to r2
next 	add r0,#4 						;increment the address by 4
		ldr r3,[r0] 					;load the second number to r3
		cmp r2,r3 						;compare r2 with r3
		bhs large 						;unsigned higher or same
		mov r2,r3 						;copy the content of r3 to r2
large 	subs r5,#1 						;decrement r5 by 1
		bne next 						;if r5 is !=0 then go to next
		ldr r1,res 						;load the address at res to r1
		str r2,[r1] 					;store the result
l 		b 		l 						;infinite loop
A 		dcd 	0x40000000 				;starting address of the array
res 	dcd 	0x40000020 				;starting address of the result
		end 							;end of the code segment
