section .text
global _start

_start:
    mov eax, 1
    mov ebx, 5

    cmp eax, ebx
    je label1
    jmp label2

    label1:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg
        mov edx, len
        int 0x80
        jmp fim

    label2:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, len2
        int 0x80

fim:
    mov eax, 1
    mov ebx, 0
    int 0x80


section .data
msg db 'eh igual', 0x0a
len equ $ - msg
msg2 db 'nao eh igual', 0x0a
len2 equ $ - msg2