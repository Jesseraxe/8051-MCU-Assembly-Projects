ORG 00H

START:
	;Immediate Addressing Mode & Register Addressing Mode
	mov A, #2FH ; move 2FH to acc A
	mov 08H, A ; move A to data mem 0x08H
	mov B, #3BH ; move 3BH to acc B
	mov 09H, B ; move B to data mem 0x09H
	mov R7, #12H ; move 12H to R7
	mov 0AH, R7 ; move r7 to data mem 0x0AH
	;Direct Addressing Mode
	mov 10H, 0AH ; move data of 0x0AH to 0x10H
	mov 11H, 08H ; move data of 0x08H to 0x11H
	mov 12H, 09H ; move data of 0x09H to 0x12H
	;Indirect Addressing Mode
	mov R0, #12H ; store address 0x12H in R0
	mov 18H, @R0 ; point to value stored in R0
	mov R1, #10H ; store address 0x10H in R1
	mov 19H, @R1 ; point to value stored in R1
	mov 1AH, @R0 ; point to value stored in R0
	;Base Index Addressing Mode
	movc A, @A+DPTR ; store ROM data pointer address at acc A
	mov 20H, A ; move A to 0x20H
	movc A, @A+PC ; store ROM program counter address at acc A
	mov 21H, A ; move A to 0x21H
	movx A, @DPTR ; store external memory data pointer address at acc A
	mov 22H, A ; move A to 0x22H
END




