;A = 0'S
;B = 1'S
ORG 0000H
MOV R0, #32H ;0011 0010
MOV R1, #8
MOV A, R0
CLR C
ROTATE:
RRC A ;ROTATE WITH CARRY
JC COUNTER ;JUMP IF 1
JNC LOOP
COUNTER:
INC B ; # OF 1'S
LOOP:
DJNZ R1, ROTATE ;DECREMENT COUNTER
MOV A, #8
SUBB A, B ;# OF 0'S

END