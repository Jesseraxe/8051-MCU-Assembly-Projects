; P9. Write an assembly language program to convert a binary (hex) number into decimal.
; EXAMPLE = 57H = 0101 0111 => 87
MOV R0, #69H ; INPUT
MOV A, R0
; if c8 <= number <= ffh then first digit is 2
; if 64h <= number <= c7h then first digit is 1
; if number <= 63h then first digit is 0
; store first digit sa r7, second and third digit sa r6
MOV R3, #0C7H
ACALL COMPARISON
MOV A, R0
JNC CHECKER1
NEXT:
CLR C
MOV R3, #63H
ACALL COMPARISON
MOV A, R0
JNC CHECKER2
NEXT1:
CLR C
MOV R7, #00H
FINAL:
MOV B, #0AH
DIV AB ; A=QUOTIENT, B=REMAINDER
MOV R6, B
MOV B, #10H
MUL AB
ADD A, R6
SJMP ENDL
COMPARISON:
MOV B, R3 ; b = C7h
SUBB A, B ; NOTE: IF A>B THEN C=0
RET
CHECKER1:
SUBB A, #200
MOV R7, #02H
SJMP FINAL
CHECKER2:
SUBB A, #100
MOV R7, #01H
SJMP FINAL
ENDL:
MOV R6, A
END