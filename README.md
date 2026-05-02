# 🖥️ Assembly x86 — Laboratório de Estudos

Repositório de exercícios em Assembly x86 e afins. 
Os exercícios estão organizados em pastas, em ordem progressiva de complexidade.

---

## 📂 Estrutura

| #  | Pasta | Tipo | Descrição |
|----|-------|------|-----------|
| 01 | [`01_hello_world/`](01_hello_world/) | Linux ELF | Imprime uma string na tela usando syscalls do Linux |
| 02 | [`02_bootloader_print_nome/`](02_bootloader_print_nome/) | Bootloader (MBR) | Imprime o nome "Carlos" via interrupção BIOS `int 0x10` |
| 03 | [`03_comparacao_condicional/`](03_comparacao_condicional/) | Linux ELF | Demonstra comparação e saltos condicionais (`cmp`, `je`, `jmp`) |
| 04 | [`04_call_funcao/`](04_call_funcao/) | Linux ELF | Demonstra chamada de função com `call`/`ret` e stack frame |
| 05 | [`05_bootloader_ransomware_msg/`](05_bootloader_ransomware_msg/) | Bootloader (MBR) | Exibe múltiplas strings na tela simulando mensagem de ransomware |
| 06 | [`06_bootloader_gradiente_linha/`](06_bootloader_gradiente_linha/) | Bootloader (MBR) | Desenha uma linha de gradiente de cores no modo VGA 320x200 |
| 07 | [`07_bootloader_grade_cores/`](07_bootloader_grade_cores/) | Bootloader (MBR) | Desenha uma grade 16×16 de quadrados coloridos no modo VGA |
| 08 | [`08_bootloader_desenho_caos/`](08_bootloader_desenho_caos/) | Bootloader (MBR) | Desenha bordas e as letras "CA0S" pixel a pixel no modo VGA |
<<<<<<< HEAD
| 09 | [`09_hand_written_pdf/`](09_hand_written_pdf/) | PDF (Manual) | PDF estruturado manualmente caractere por caractere |
=======
| 09 | [`09_PDF-artesanal/`](09_PDF-artesanal/) | PDF (Manual) | PDF estruturado manualmente caractere por caractere |
>>>>>>> 7076682 (README.md)


> 📖 Cada pasta contém seu próprio `README.md` com explicação detalhada do código, conceitos e instruções de compilação.

---

## 🔧 Como Compilar e Executar

### Programas Linux (ELF) — exercícios 01, 03, 04

```bash
# Assemblar
nasm -f elf32 <arquivo>.asm -o <arquivo>.o

# Linkar
ld -m elf_i386 <arquivo>.o -o <arquivo>

# Executar
./<arquivo>
```

### Bootloaders (MBR) — exercícios 02, 05, 06, 07, 08

```bash
# Assemblar para binário puro (flat binary)
nasm -f bin <arquivo>.asm -o <arquivo>.bin

# Executar com QEMU
qemu-system-x86_64 <arquivo>.bin
```

---

## 📚 Conceitos Abordados

- **Syscalls Linux** (`int 0x80`) — `sys_write`, `sys_exit`
- **Interrupções BIOS** (`int 0x10`) — modo texto e modo gráfico VGA
- **Saltos condicionais** — `je`, `jmp`, `jl`, `jg`, `jne`
- **Stack frame e chamada de função** — `call`, `ret`, `push ebp`, `mov ebp, esp`
- **Modo gráfico VGA 13h** — 320×200 com 256 cores
- **Escrita direta na memória de vídeo** — segmento `0xA000`
- **Estrutura MBR** — `times 510 - ($ - $$) db 0x00` + assinatura `0xAA55`
- **Estrutura de arquivos PDF** — Objetos, Catalog, Pages, Stream, xref table


---

## ⚠️ Aviso

Os bootloaders devem ser executados **apenas em máquinas virtuais** (QEMU, VirtualBox, etc.).  
O exercício 05 é **meramente educacional** — simula uma mensagem de ransomware para fins de estudo.
