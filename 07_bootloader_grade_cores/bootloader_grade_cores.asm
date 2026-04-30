mov ax, 0x13
int 0x10

push 0xa000
pop es

xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx
xor di, di

push ax

; contador: cl
; numero de linhas: ch
; quadrados_y: dh
; quadrados_x: dl
;memoria video: es:di
;cor: ax

;320x192 
;320 -> 16 quadros por linha de 20 pixels
;192 -> 16 quadro por coluna com 12 pixels cada
; escrevedno 2 bits por vez

principal:
mov [es:di], ax
inc di
inc di
inc cl
inc cl
cmp cl, 0x14
je mudacor
jmp principal

mudacor:
add ax, 0x0101
inc dl
cmp dl, 0x10
je fechalinha
xor cl, cl
jmp principal

fechalinha:
inc ch
cmp ch, 0x0c
je incQuadradoY
pop ax
push ax
xor cl, cl
xor dl, dl
jmp principal

incQuadradoY:
pop ax
add ax, 0x1010
push ax
xor cx, cx
xor dl, dl
inc dh
cmp dh, 0x10
je fim
jmp principal

fim:
jmp $

times 510 - ($ -- $$) db 0x00
dw 0xaa55


