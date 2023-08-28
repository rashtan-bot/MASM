;Write a program to count the number of ones and zeros in two consecutive memory locations.
			area count,code,readonly		;allocate memory for code segment
			entry							;beginning of code segment
			ldr r0,memory 					;load the address of memory
			ldr r1,[r0] 					;load 32-bit number
			mov r4,#32 						;load rotation count
rotate 		rors r1,#1 						;rotate right by one bit, update cpsr
			bcs ones 						;if carry=1
			add r3,r3,#1		 			;increment zero's counter
			b next 							;branch to next rotation
ones 		add r2,r2,#1		 			;increment one's counter
next 		add r4,r4,#-1		 			;decrement the rotation count
			cmp r4,#0 						;check whether rotation count is zero
			bne rotate 						;if no go to rotate
			add r0,r0,#4 					;load address of memory for no.of one's
			strb r2,[r0] 					;store number of one's
			add r0,r0,#1 					;load address of memory for no.of zero's
			strb r3,[r0] 					;store number of zero's
l 			b 		l						;infinite loop
memory 		dcd		0x40000000	 			;memory address
			end								;end of the code segment
