	LDHI r6, #0x01
 	LDIU r0, #0x5
	JAL sumx
end: 	JMP end

sumx:	
	JR r7
