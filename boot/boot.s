;hang.asm

mov ax,07c0h;���ö�ջ
add ax,288
mov ss,ax
mov sp,4096
mov ax,07c0h
mov ds,ax
hang:
mov si,welcome
call println
call delay
jmp hang

println: ;�ַ�����ַ��ŵ�bx
	push ax
	push bx
	mov ah,0eh
repeat
	lodsb ;��ȡ�ַ�
	cmp al,0
	je	printend
	int 10h
	jmp repeat

printend:
	mov al,0dh ;�س�
	int 10h
	mov al,0ah ;����
	int 10h
	pop bx
	pop ax
	ret

delay:
	push ax
	push bx
	mov ax, 0ffffh
delay_repeat_1:
	dec ax
	cmp ax,0
	je delay_end
	mov bx,01ffh
delay_repeat_2:
	dec bx
	cmp bx,0
	je delay_repeat_1
	jmp delay_repeat_2
delay_end:
	pop bx
	pop ax
	ret

welcome: db 'hello world ',0
times 510-($-$$)  db 0;
dw 0xAA55
