section .data
res times 10 dd 0.0
val dd 0.0
zero dd 0.0

section .text
	bits 64
	default rel

	global asmhello
	global kernel
	extern printf

	
	kernel:
		mov r11, 3 ;start of loop
		sub rdx, 3 ;end the loop
		start:
		cmp r11, rdx ;checks if it done
		je end
		cmp r11, rdx ;checks if it done
		jg end 
		mov r12, r11 ; copy curr index
		mov r13, r11 ; copy curr index
		sub r12, 3 ; start of 2nd loop
		add r13, 4 ; end of 2nd loop
		

		movss xmm5, [zero] ;reset val
		movss [val], xmm5 ;reset xmm5
			inner:
			movss xmm5, [val] ;take address of val
			movss xmm14, [rcx+(r12*4)] ;iterate array
			VADDSS xmm5, xmm14, [val]
			movss [val], xmm5
			inc r12
			cmp r13, r12
			jne inner

		cmp r11, 13
		jl store
		continue: 
			inc r11
			jmp start
		end: 
		xor rax, rax
		ret
	store: 
		mov r14, r11
		sub r14, 3
		movss [r8+(r14*4)], xmm5
		JMP continue
