 	LDIU r0, #0x00
	LD r1, (r0)
	MV r2, r1
	LDI r4,#7
	JALR r4
	ST r3, (r0)
end: 	JMP end

mult:	LDIU r3, #0x00
loop:	ADD r3, r1
	ADDI r2, #-1
	BNZ r2, loop
	JR r7
