# 01 — Hello World

## 📄 Arquivo: `01_hello_world.asm`

Programa clássico "Hello World" em Assembly x86 para Linux.

---

## 🎯 O que faz

Imprime a string **"Ola galera de cowboy"** no terminal e encerra o programa com código de saída `0`.

---

## 🧠 Conceitos

- **`sys_write` (syscall 4):** Escreve dados em um file descriptor.
  - `EAX = 4` → número da syscall
  - `EBX = 1` → stdout (saída padrão)
  - `ECX` → ponteiro para a string
  - `EDX` → tamanho da string
- **`sys_exit` (syscall 1):** Encerra o programa.
  - `EAX = 1` → número da syscall
  - `EBX = 0` → código de saída (sucesso)
- **`int 0x80`:** Interrupção de software para invocar syscalls do kernel Linux.
- **Seção `.data`:** Onde a string e seu tamanho são definidos.
- **`equ $ - msg`:** Calcula o tamanho da string em tempo de montagem.

---

## 🔧 Compilação

```bash
nasm -f elf32 01_hello_world.asm -o 01_hello_world.o
ld -m elf_i386 01_hello_world.o -o 01_hello_world
./01_hello_world
```

---

## 📤 Saída esperada

```
Ola galera de cowboy
```
