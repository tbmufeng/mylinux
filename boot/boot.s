;hang.asm
hang:
mov ah,0x0e
mov al,01
mov bl,07
int 10
end:
jmp hang
times 510-($hang-$end)  db 0;
dw 0AA55h
