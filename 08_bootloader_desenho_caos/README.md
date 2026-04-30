# 08 — Bootloader: Desenho "CA0S"

## 📄 Arquivo: `08_bootloader_desenho_caos.asm`

Bootloader que desenha bordas coloridas e as letras **"CA0S"** pixel a pixel no modo gráfico VGA.

---

## 🎯 O que faz

1. Inicializa o modo gráfico VGA **13h** (320×200, 256 cores).
2. Desenha as **4 bordas** da tela (cima, direita, baixo, esquerda) com cores incrementais.
3. Desenha as letras **C**, **A**, **0** e **S** usando `int 0x10` (AH=0x0C — Write Pixel):
   - **C** (cor `0x2C`): Retângulo aberto à direita nas coordenadas (91,43)→(148,147)
   - **A** (cor `0x0A`): Triângulo com barra horizontal nas coordenadas (116,60)→(145,126)
   - **0** (cor `0x0B`): Retângulo fechado nas coordenadas (155,43)→(211,147)
   - **S** (cor `0x0C`): Forma de "S" com 6 segmentos nas coordenadas (168,56)→(192,126)

---

## 🧠 Conceitos

- **`int 0x10` (AH=0x0C):** Interrupção BIOS para escrever um pixel na tela.
  - `AL` → cor do pixel
  - `BH` → página de vídeo
  - `CX` → coordenada X (coluna)
  - `DX` → coordenada Y (linha)
- **Desenho pixel a pixel:** Cada segmento de cada letra é desenhado incrementando/decrementando CX ou DX em loops.
- **Bordas da tela:** Quatro loops separados desenham as bordas superior, direita, inferior e esquerda com cores que mudam a cada pixel.
- **Coordenadas VGA:** No modo 13h, X vai de 0 a 319 e Y vai de 0 a 199.
- **Labels sequenciais:** `c1`-`c3`, `a1`-`a4`, `zero1`-`zero4`, `s1`-`s6` organizam cada segmento de cada letra.

---

## 🔧 Compilação

```bash
nasm -f bin 08_bootloader_desenho_caos.asm -o 08_bootloader_desenho_caos.bin
qemu-system-x86_64 08_bootloader_desenho_caos.bin
```

---

## 📤 Saída esperada

Tela preta com bordas coloridas e as letras **"CA0S"** desenhadas em cores diferentes (vermelho, verde, ciano, magenta) no centro da tela.
