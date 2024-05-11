; P8. Write an assembly language program to convert a BCD number into ASCII.
; BCD = 0<NUMBER> => ASCII = 3<NUMBER>
; EXAMPLE: (NOTE: BCD IS FROM 0 TO 9 LANG)
; BCD = 07 => ASCII = 37
ORG 0000H
MOV A, #07H
XRL A, #30H
END
