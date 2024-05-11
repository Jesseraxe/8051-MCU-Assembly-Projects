ORG 00H

MAIN:
    ; First demultiplexer is selected, check which line is selected
    MOV A, P1
    CPL A
    ANL A, #11B
    ; Output the selected line
    CJNE A, #00B, LINE_1
    MOV P2, #1110B ; Output 0001 on output lines
    MOV P0, #1110B ; Output 0001 on output lines
    MOV C, P3.3
    JC NO_INPUT1
    ; Check Input of demux 2
    MOV C, P3.2
    JC NO_INPUT2
    SJMP MAIN
LINE_1:
    CJNE A, #01B, LINE_2
    MOV P2, #1101B ; Output 0010 on output lines
    MOV P0, #1101B ; Output 0010 on output lines
    ; Check Input of demux 1
    MOV C, P3.3
    JC NO_INPUT1
    ; Check Input of demux 2
    MOV C, P3.2
    JC NO_INPUT2
    SJMP MAIN
LINE_2:
    CJNE A, #10B, LINE_3
    MOV P2, #1011B ; Output 0100 on output lines
    MOV P0, #1011B ; Output 0100 on output lines
    ; Check Input of demux 1
    MOV C, P3.3
    JC NO_INPUT1
    ; Check Input of demux 2
    MOV C, P3.2
    JC NO_INPUT2
    SJMP MAIN
LINE_3:
    MOV P2, #0111B ; Output 1000 on output lines
    MOV P0, #0111B ; Output 1000 on output lines
    ; Check Input of demux 1
    MOV C, P3.3
    JC NO_INPUT1
    ; Check Input of demux 2
    MOV C, P3.2
    JC NO_INPUT2
    SJMP MAIN
NO_INPUT1:
    MOV P0, #1111B
    SJMP MAIN
NO_INPUT2:
    MOV P2, #1111B
    SJMP MAIN
END