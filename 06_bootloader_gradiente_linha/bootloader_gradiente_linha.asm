xor ax, ax
mov es, ax
mov ds, ax
;mov cs, ax

;INT 10 - VIDEO - DEFINIR MODO DE VÍDEO
;AH = 00h
;AL = modo (veja abaixo)
;13h = G 40x25 8x8 320x200 256/256k A000 VGA,MCGA,ATI VIP
;
;
;AX -> AH, AL
;BX -> BH, BL
;CX -> CH, CL
;DX -> BH, DL
;SI -> FONTE
;DI -> DESTINO
;BP -> BASE
;SP -> TOPO DA PILHA
;IP -> PROXIMA INSTRUCAO

mov al, 0x13
int 0x10
;MEMORIA DE VIDEO 0XA000
xor di, di
mov ax, 0xa000
mov es, ax

mov cx, 0x140 ; mov para cx 320
mov ax, 0x0000
aquiloop:
mov [es:di], al
inc di
inc al
dec cx
cmp cx, 0x00
jne aquiloop

jmp $

times 510 - ($ -- $$) db 0x00
dw 0xaa55
