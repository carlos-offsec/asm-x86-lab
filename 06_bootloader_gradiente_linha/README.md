# 06 — Bootloader: Gradiente de Linha

## 📄 Arquivo: `06_bootloader_gradiente_linha.asm`

Bootloader que desenha uma linha horizontal de gradiente de cores no modo gráfico VGA.

---

## 🎯 O que faz

1. Inicializa o modo gráfico VGA **13h** (320×200, 256 cores).
2. Acessa diretamente a memória de vídeo no segmento `0xA000`.
3. Desenha **320 pixels** em sequência, incrementando a cor a cada pixel, criando um efeito de gradiente.

---

## 🧠 Conceitos

- **Modo VGA 13h:** Modo gráfico com resolução 320×200 e paleta de 256 cores. Cada pixel ocupa 1 byte na memória.
- **Memória de vídeo (`0xA000`):** O framebuffer VGA está mapeado no segmento `0xA000`. Escrever diretamente nele altera os pixels na tela.
- **`mov [es:di], al`:** Escreve o valor de `AL` (cor do pixel) no endereço `ES:DI` (memória de vídeo).
- **Gradiente:** Incrementar `AL` a cada pixel gera uma transição suave entre as 256 cores da paleta VGA.
- **`0x140 = 320`:** Número de pixels em uma linha horizontal no modo 13h.
- **Registradores de segmento:** `ES` é configurado para apontar para `0xA000` (início da memória de vídeo).

---

## 🔧 Compilação

```bash
nasm -f bin 06_bootloader_gradiente_linha.asm -o 06_bootloader_gradiente_linha.bin
qemu-system-x86_64 06_bootloader_gradiente_linha.bin
```

---

## 📤 Saída esperada

Uma linha horizontal colorida no topo da tela com um gradiente percorrendo as 256 cores da paleta VGA padrão.
