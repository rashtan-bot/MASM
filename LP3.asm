;Write a program to find the factorial of a number.
		area fact,code,readonly 		;allocate memory for code segment
		entry 							;beginning of the code segment
		ldr r0,mem 						;load the address in mem into r0
		ldrb r1,[r0] 					;get the input
		mov r2,#1 						;initial result 0!=1
		cmp r1,#0 						;check for 0
		beq store 						;if the input is 0 then store 1 as result
		mov r2,r1 						;store input in r2
up 		add r1,r1,#-1 					;decrement input by 1 and store it in r1
		cmp r1,#0 						;check for 0
		beq store 						;if it is 0 then store the result
		mul r3,r2,r1 					;multiply r1 & r2 then store result in r3
		mov r2,r3 						;store partial product in r2
		b up 							;execute label up
store 	ldr r0,res 						;load the address in res into r0
		str r2,[r0] 					;store the result
l 		b		l 						;infinite loop
mem 	dcd		0x40000000 				;memory location for input
res 	dcd		0x40000010 				;memory location for output
		end 							;end of the code segment
