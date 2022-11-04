  LDIU r0, #0
  LDIU r3, #0
  LDIU r4, #8
loop:	LD r2,(r0)
	ADD r3,r2
  ADDI r0,#1
	ADDI r4, #-1
	BNZ r4, loop
  ST r3,(r0)
end: BEZ r4, end

