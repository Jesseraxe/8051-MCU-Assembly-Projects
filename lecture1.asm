complement:
mov a, p2; load p2 to a
anl a, #11110000b; catch complement
mov b, a;store complement
cpl a; negate complement from input
anl a, #11110000b; catch true value of abcd
;xch a, b; turn on if switch on is 0 and switch off is 1


init:
;mov abcd and cpl from bit 2.4 to registers
;mov abcd to r3-r0
mov r0, a; store d
rr a
mov r1, a;store c
rr a
mov r2, a;store b
rr a
mov r3, a;store a
mov a, b
;mov cpl to r7-r4
mov r4, a;store d'
rr a
mov r5, a;store c'
rr a
mov r6, a;store b'
rr a
mov r7, a;store a'

one:
;solving is done on 2.4 bit
;a+(b'c)+d
mov a, r6;position b'
anl a, r1;b'c
orl a, r3;a+b'c
orl a, r0;a+(b'c)+d
rr a; mov to 2.3
anl a, #00001000b; catch bit
cpl a
mov p1, a; store bit
clr a; clear for equation 2

two:
;(axc)d+a'd'
mov a, r3;position a
xrl a, r1;axc
anl a, r0;(axc)d
mov 10h, a;store
mov a, r7;position a'
anl a, r4;a'd'
orl a, 10h;(axc)d+a'd'
rr a;move to 2.2
rr a
anl a, #00000100b; catch bit
orl a, 8; combine result from one and two
cpl a; complement result for output
mov p0, a; output to port 0
