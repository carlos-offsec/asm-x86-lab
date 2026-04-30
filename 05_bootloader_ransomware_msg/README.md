# 05 — Bootloader: Mensagem Ransomware (Educacional)

## 📄 Arquivo: `05_bootloader_ransomware_msg.asm`

Bootloader que exibe múltiplas strings na tela posicionadas em coordenadas específicas, simulando uma mensagem de ransomware.

> ⚠️ **Este código é meramente educacional.** Foi criado para fins de estudo de Assembly e interrupções BIOS.

---

## 🎯 O que faz

Exibe 4 strings na tela usando `int 0x10` (AH=0x13 — Write String):

1. **"Meu nome eh carlos"** — linha 10, coluna 10
2. **"Te Hackeei"** — linha 11, coluna 13
3. **"Voce precisa enviar 100 bitcoins..."** — linha 12, coluna 10
4. **"caso nao envie em 24 horas..."** — linha 13, coluna 11

---

## 🧠 Conceitos

- **`int 0x10` (AH=0x13):** Interrupção BIOS para escrever strings completas na tela.
  - `AL` → modo de escrita (0=só chars, 1=chars + move cursor, 2/3=chars+atributos)
  - `BH` → página de vídeo
  - `BL` → atributo de cor (se modo 0 ou 1)
  - `CX` → comprimento da string
  - `DH` → coordenada de linha (Y)
  - `DL` → coordenada de coluna (X)
  - `ES:BP` → ponteiro para a string
- **`add bp, 0x7c00`:** Ajuste de endereço necessário porque a BIOS carrega o bootloader em `0x7C00`, mas sem `[org 0x7c00]` as referências de dados são relativas a `0x0000`.
- **Atributos de cor:** `0x03` = ciano, `0x02` = verde.

---

## 🔧 Compilação

```bash
nasm -f bin 05_bootloader_ransomware_msg.asm -o 05_bootloader_ransomware_msg.bin
qemu-system-x86_64 05_bootloader_ransomware_msg.bin
```

---

## 📤 Saída esperada

Na tela do QEMU aparecem 4 linhas de texto posicionadas no centro da tela, simulando uma mensagem de ransomware.
