# 07 — Bootloader: Grade de Cores

## 📄 Arquivo: `07_bootloader_grade_cores.asm`

Bootloader que desenha uma grade 16×16 de quadrados coloridos no modo gráfico VGA.

---

## 🎯 O que faz

1. Inicializa o modo gráfico VGA **13h** (320×200, 256 cores).
2. Acessa diretamente a memória de vídeo em `0xA000`.
3. Desenha uma grade de **16 colunas × 16 linhas** de quadrados coloridos.
4. Cada quadrado tem **20×12 pixels**, preenchendo a área de 320×192.
5. A cor muda a cada quadrado, criando um mosaico colorido.

---

## 🧠 Conceitos

- **Organização da grade:**
  - `CL` → contador de pixels dentro do quadrado (largura: 20px)
  - `CH` → contador de linhas de pixel dentro do quadrado (altura: 12px)
  - `DL` → contador de quadrados por linha (16 quadrados)
  - `DH` → contador de linhas de quadrados (16 linhas)
- **Escrita de 2 bytes por vez:** `mov [es:di], ax` escreve 2 pixels simultâneos (AH e AL), e `inc di` duas vezes avança 2 posições.
- **Mudança de cor:** `add ax, 0x0101` incrementa AH e AL juntos, mudando a cor do próximo quadrado.
- **Controle de fluxo com labels:**
  - `principal` → desenha pixels
  - `mudacor` → avança para o próximo quadrado na linha
  - `fechalinha` → volta ao início da próxima linha de pixels do quadrado
  - `incQuadradoY` → avança para a próxima fileira de quadrados
- **Pilha para salvar cor base:** `push ax` / `pop ax` salva e restaura a cor da primeira coluna ao repetir linhas do mesmo quadrado.

---

## 🔧 Compilação

```bash
nasm -f bin 07_bootloader_grade_cores.asm -o 07_bootloader_grade_cores.bin
qemu-system-x86_64 07_bootloader_grade_cores.bin
```

---

## 📤 Saída esperada

Uma grade colorida de 16×16 quadrados ocupando quase toda a tela, com cada quadrado em uma cor diferente da paleta VGA.
