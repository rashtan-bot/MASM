;Write a program to multiply 16 bit numbers.
		area mul,code,readonly			;allocate the memory for code segment
		entry							;beginning of the code segment
		ldrh r1,n1						;load register r5 with 16 bit value in n1
		ldrh r2,n2						;load register r7 with 16 bit value in n2
		mul r3,r1,r2
		ldr r0,prod		
		str r3,[r0]						;copy the content of register r5 to r7
l		b		l						;unconditional branching
n1		dcw		5						;Initialize memory location n1=5
n2		dcw		6						;Initialize memory location n2=6
prod	dcd		0x40000000				
		end								;end of the code segment
