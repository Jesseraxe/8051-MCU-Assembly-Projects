org 00h
init:
lcall clear_memory
mov r7, #11000011b
mov r6, #080H
mov p1, r6
mov p0, r7
mov r2, #1
mov  r0, #30h
mov r3, #255
mov 2ah, #50
jnb p3.0 , main
jmp init
clearing:
lcall clear_stack
ljmp input
main:
cjne r6, #80h, input
jmp clearing
draw:
lcall display
mov 2bh, 2ah
display_stack:
	
	mov 29h, #20
	display_stack_loop:
	lcall draw_stack
	djnz 29h, display_stack_loop
	djnz 2bh, display_stack
lcall end_condition


jmp main

input:
jnb p3.0, stack
jmp shift

shift:
mov a, r2
jnz shift_left
jz shift_right

switch_shift_right:
	mov r2, #0
	jmp draw

switch_shift_left:
	mov r2, #1
	jmp draw
	
	shift_left:
	mov a, r7
	rl a
	mov r7, a
	cpl a
	anl a, #10000000b
	jnz switch_shift_right
	jmp draw
	shift_right:
	mov a, r7
	rr a
	mov r7, a
	cpl a
	anl a, #00000001b
	jnz switch_shift_left
	jmp draw
	


	
display:
	mov 28h, #255
	display_loop:
	mov p0, r7
	mov p1, r6
	djnz 28h, display_loop
	ret

stack:
	dec 2ah
	dec 2ah
	dec 2ah
	
	mov a, r7
	mov r4, a
	mov a, r6
	rr a
	mov r6, a

compare:
	mov a, r4
	cpl a
	mov b, r3
	anl a, b
	cpl a
	mov @r0, a
	inc r0
	cpl a
	mov r3, a
	cpl a
	mov r7, a
	wait:
	jb p3.0, display_stack
	jmp wait
draw_stack:
	mov r1, #30h
	mov 18h, #10000000b
	draw_stack_loop:
	
	mov a, @r1
	jz draw_stack_end
	call clear
	mov p0, a
	mov a, 18h
	mov p1, a
	rr a
	mov 18h, a
	inc r1
	call clear
	jmp draw_stack_loop
draw_stack_end:
	ret



clear:
mov p0, #255
mov p1, #0
ret
clear_memory:
	mov r0, #09h
	clear_memory_loop:
	mov @r0, #0
	inc r0
	cjne r0, #60h, clear_memory_loop
	clr c
	ret

end_condition:
	mov r0, #30h
	end_condition_loop:
	mov a, @r0
	jz not_end
	inc r0
	cjne a, #255, end_condition_loop
	jmp restart
not_end:
	ret

restart:
	lcall clear
	ljmp init

clear_stack:
	mov 30h, #0
	mov 31h, #0
	mov 32h, #0   
	mov 33h, #0
	mov 34h, #0
	mov 35h, #0
	mov 36h, #0
	mov 37h, #0
	ret
end
