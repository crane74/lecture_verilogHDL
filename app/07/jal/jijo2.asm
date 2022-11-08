	LDHI r6,#0x02
 	LDIU r0, #0x00
	LD r1, (r0)
	MV r2, r1
	JAL mult
	ST r3, (r0)
end: 	JMP end

mult: ADDI r6,#-1
	 ST r2,(r6)
   LDIU r3, #0x00
loop:	ADD r3, r1
	ADDI r2, #-1
	BNZ r2, loop
	LD r2, (r6)
	ADDI r6,#1
	JR r7
