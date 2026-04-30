# 02 — Bootloader: Print Nome

## 📄 Arquivo: `02_bootloader_print_nome.asm`

Bootloader de 512 bytes que imprime o nome **"Carlos"** na tela usando a BIOS.

---

## 🎯 O que faz

1. Carrega o endereço da string `"Carlos"` no registrador `SI`.
2. Usa a interrupção `int 0x10` (AH=0x0E — modo teletype) para imprimir cada caractere.
3. Percorre a string byte a byte com `lodsb` até encontrar o terminador nulo (`0`).
4. Entra em loop infinito (`jmp $`) após imprimir.

---

## 🧠 Conceitos

- **`[org 0x7c00]`:** Informa ao NASM que o código será carregado no endereço 0x7C00 pela BIOS.
- **`lodsb`:** Carrega o byte apontado por `DS:SI` em `AL` e incrementa `SI`.
- **`int 0x10` (AH=0x0E):** Interrupção de vídeo BIOS — modo teletype (imprime caractere em `AL`).
- **Assinatura MBR:** `0xAA55` nos últimos 2 bytes do setor de 512 bytes, identificando o setor como bootável.
- **`times (510) - ($ - $$) db 0x00`:** Preenche com zeros até completar 510 bytes.
- **`jmp $`:** Loop infinito — mantém o processador ocupado sem travar.

---

## 🔧 Compilação

```bash
nasm -f bin 02_bootloader_print_nome.asm -o 02_bootloader_print_nome.bin
qemu-system-x86_64 02_bootloader_print_nome.bin
```

---

## 📤 Saída esperada

Na tela do QEMU aparece:
```
Carlos
```
