[org 0x7c00]

mov si, nome
mov ah, 0x0e

imprimir:
	lodsb
	cmp al, 0
	je fim
	int 0x10
	jmp imprimir
	
fim:
	jmp $

nome db "Carlos"

times((512-2) - ($ - $$)) db 0x00
dw 0xAA55
