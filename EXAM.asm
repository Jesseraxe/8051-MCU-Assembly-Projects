org 0000h
    mov r5, #96
    mov r4, #59 ; +3 offset because decrement is done before displaying

start:
    mov a, #8
    lcall cmdwr
    
solving:
    jmp lowerbyte

higherbyte:
    clr c
    mov a, r5
    dec a
    mov r5, a
    mov r3, a
    mov r4, #99
    cjne a, #89, lowerbyte
    jmp end
lowerbyte:
    mov a, r4
    subb a, #3 ;decrement by 3
    jc higherbyte ;jump if borrow
    mov r4, a
    mov r1, a
    mov a, r5
    mov r3, a
output:
    lcall display_higherbyte
    lcall display_lowerbyte
    jmp start

org 0030h
cmdwr:  
    mov dptr, #cmd
rep1:
    clr a
    movc a, @a+dptr
    jz last1
    mov p3, a
    clr p2.0
    clr p2.1
    setb p2.2
    lcall delay
    clr p2.2
    inc dptr
    sjmp rep1
last1:  ret

org 0050h

delay:
    ;mov r7, #0ffh
    ret

display_higherbyte:
thousands:
    mov b, #10
    mov a, R3
    div ab
    mov r3, a
    mov r2, b
    add a, #30h ; Convert to ASCII
    mov p3, a
    setb p2.0
    clr p2.1
    setb p2.2
    lcall delay
    clr p2.2
hundreds:
    mov a, r2
    add a, #30h ; Convert to ASCII
    mov p3, a
    setb p2.0
    clr p2.1
    setb p2.2
    lcall delay
    clr p2.2
    ret
    clr p2.2
display_lowerbyte:
tens:
    mov b, #10
    mov a, R1
    div ab
    mov r1, a
    mov r0, b
    add a, #30h ; Convert to ASCII
    mov p3, a
    setb p2.0
    clr p2.1
    setb p2.2
    lcall delay
    clr p2.2
ones:
    mov a, r0
    add a, #30h ; Convert to ASCII
    mov p3, a
    setb p2.0
    clr p2.1
    setb p2.2
    lcall delay
    clr p2.2

    ret

org 0100h
cmd: db 38h, 0fh, 080h, 00h ; Set DDRAM address command (0x80) for address 0x00

end:
end
