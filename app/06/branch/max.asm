	LDIU r0, #0
	LDIU r3, #0
	LDIU r4, #8
loop:	LD r2,(r0)
	SUB r2,r3
	BMI r2,skip
	ADD r3,r2
skip: ADDI r0,#1
	ADDI r4, #-1 
	BNZ r4, loop
end:	BEZ r4, end

