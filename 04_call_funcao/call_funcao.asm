section .data
msg db "Isso eh um teste",0xA
len equ $-msg

msg2 db "Isso foi chamado depois de um call",0xA
len2 equ $-msg2

section .text
global _start

_start:

mov edx, len
mov ecx, msg
mov ebx, 1
mov eax, 4
int 0x80

call _outrafuncao
mov ebx, 0
mov eax, 1
int 0x80

_outrafuncao:
push ebp
mov ebp, esp

mov edx, len2
mov ecx, msg2
mov ebx, 1
mov eax, 4
int 0x80

pop ebp
ret
