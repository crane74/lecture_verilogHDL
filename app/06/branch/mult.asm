	LDIU r0, #2
	LD r1,(r0)
	LDIU r0, #3
	LD r2,(r0)
	LDIU r3, #0
loop:	ADD r3, r1
	ADDI r2, #-1
	BNZ r2, loop
	LDIU r0, #0
	ST r3,(r0)
end:	BEZ r2, end

