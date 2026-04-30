xor ax, ax
mov es, ax
mov ds, ax
mov ss, ax

;Escrever Pixel Gráfico em Coordenada
;AH = 0C
;	AL = valor de cor (XOR'ED com pixel atual se bit 7=1)
;	BH = número da página, veja PÁGINAS DE VÍDEO
;	CX = número da coluna (baseado em zero) X
;	DX = número da linha (baseado em zero) Y

;não retorna nada

;	- se o bit 7 for 1, a cor especificada é XOR'ed com o pixel atual
;	- número de página em BH ignorado para o modo gráfico de 4 cores 320x200
;	- esta função é conhecida por destruir AX e possivelmente SI e DI em
;	  em alguns sistemas PS/2 VGA

mov al, 0x13
int 0x10

mov ah, 0x0c
mov al, 0x0f
mov bh, 0x00
xor cx, cx
xor dx, dx
bordacima:
int 0x10
inc al
inc cx
cmp cx, 319
jl bordacima

bordadireita:
int 0x10
inc al
inc dx
cmp dx, 200
jl bordadireita

xor cx, cx
mov dx, 199
bordabaixo:
int 0x10
inc al
inc cx
cmp cx, 319
jl bordabaixo

xor cx, cx
xor dx, dx
bordaesq:
int 0x10
inc al
inc dx
cmp dx, 200
jl bordaesq

xor cx, cx
xor dx, dx
mov al, 0x2c
mov cx, 91
mov dx, 43
c1:
int 0x10
inc cx
cmp cx, 148
jl c1

xor cx, cx
xor dx, dx
mov cx, 91
mov dx, 43
c2:
int 0x10
inc dx
cmp dx, 147
jl c2

xor cx, cx
xor dx, dx
mov cx, 91
mov dx, 147
c3:
int 0x10
inc cx
cmp cx, 148
jl c3

xor cx, cx
xor dx, dx
mov cx, 116
mov dx, 60
mov al, 0x0a
a1:
int 0x10
inc dx
cmp dx, 91
jl a1

a2:
int 0x10
inc cx
cmp cx, 145
jl a2

a3:
int 0x10
dec dx
cmp dx, 60
jg a3

a4:
int 0x10
inc dx
cmp dx, 126
jl a4

xor cx, cx
xor dx, dx
mov cx, 155
mov dx, 43
mov al, 0x0b
zero1:
int 0x10
inc dx
cmp dx, 147
jl zero1

zero2:
int 0x10
inc cx
cmp cx, 211
jl zero2

zero3:
int 0x10
dec dx
cmp dx, 43
jg zero3

zero4:
int 0x10
dec cx
cmp cx, 155
jg zero4

xor cx, cx
xor dx, dx
mov cx, 192
mov dx, 56
mov al, 0x0c
s1:
int 0x10
dec cx
cmp cx, 168
jg s1

s2:
int 0x10
inc dx
cmp dx, 80
jl s2

s3:
int 0x10
inc cx
cmp cx, 192
jl s3

s4:
int 0x10
inc dx
cmp dx, 126
jl s4

s5:
int 0x10
dec cx
cmp cx, 168
jg s5

s6:
int 0x10
dec dx
cmp dx, 100
jg s6

jmp $

times 510 - ($ - $$) db 0x00
dw 0xAA55
