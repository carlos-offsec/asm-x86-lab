# 📑 PDF Bootloader Poliglota

Este projeto é uma implementação avançada de um arquivo **poliglota**: um único arquivo que é simultaneamente um **documento PDF válido** e um **Bootloader x86 inicializável**.

O objetivo é demonstrar técnicas de manipulação de formatos de arquivo e programação de baixo nível (Assembly x86), permitindo que uma imagem seja renderizada na tela durante o processo de boot a partir de dados comprimidos.

## 🚀 Funcionalidades

- **Bootloader Gráfico**: Inicializa o sistema em **Modo 13h** (VGA 320x200, 256 cores).
- **Descompressão RLE**: Implementa um algoritmo customizado de *Run-Length Encoding* para desenhar gráficos complexos consumindo pouco espaço.
- **Dual-Stage Loading**: O código é dividido em dois estágios para superar o limite de 512 bytes do MBR.
- **Compatibilidade FAT12**: Possui um cabeçalho BPB (*Bios Parameter Block*) que permite que o arquivo seja reconhecido como um disquete formatado.
- **PDF Polyglot**: Contém metadados de PDF (`%PDF-1.4`) integrados de forma que não interfiram na execução do código de máquina.

## 🛠️ Tecnologias e Ferramentas

- **Linguagem**: Assembly x86 (16-bit Real Mode).
- **Assembler**: [FASM](https://flatassembler.net/) (Flat Assembler).
- **Emulação**: [QEMU](https://www.qemu.org/).
- **Gráficos**: Interrupções de BIOS (`INT 10h`).
- **I/O de Disco**: Interrupções de BIOS (`INT 13h`).

## 📂 Estrutura do Projeto

- `pdf-bootloader.asm`: Código fonte principal. Contém a lógica de boot, o carregador do segundo estágio e o decodificador RLE.
- `pdf-bootloader.bin`: O binário compilado.
- `HelloWorld.pdf`: O resultado final poliglota (binário renomeado ou processado).

## ⚙️ Como Compilar e Executar

### 1. Compilação
Utilize o FASM para gerar o binário bruto:
```bash
fasm pdf-bootloader.asm pdf-bootloader.bin
```

### 2. Execução (Emulação)
Para testar o processo de boot, use o QEMU apontando para o arquivo binário:
```bash
qemu-system-i386 -drive format=raw,file=pdf-bootloader.bin
```

### 3. Visualização PDF
Basta renomear o arquivo para `.pdf` ou abri-lo diretamente com seu leitor favorito (Evince, Adobe Reader, Chrome, etc):
```bash
evince pdf-bootloader.bin
```

## 🧠 Detalhes Técnicos

### Run-Length Encoding (RLE)
Para otimizar o espaço, a imagem não é armazenada pixel a pixel. O código lê um byte que indica a **quantidade** de pixels a serem desenhados e alterna a cor entre **Preto (0x00)** e **Branco (0x0F)** a cada nova sequência. O caractere `0xFF` é utilizado como terminador da imagem.

### O "Truque" Poliglota
Arquivos PDF são flexíveis quanto ao conteúdo que precede o cabeçalho `%PDF-`, desde que ele apareça nos primeiros 1024 bytes. 
O bootloader aproveita isso colocando o cabeçalho PDF logo após o salto inicial (`jmp short main`) e os campos obrigatórios do FAT12, garantindo que:
1. A **BIOS** execute o código no offset 0.
2. O **Leitor de PDF** encontre a assinatura `%PDF-` e processe o restante do arquivo como um documento.

---
