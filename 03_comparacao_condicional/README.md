# 03 — Comparação Condicional

## 📄 Arquivo: `03_comparacao_condicional.asm`

Programa que demonstra o uso de comparações e saltos condicionais em Assembly x86.

---

## 🎯 O que faz

1. Carrega `EAX = 1` e `EBX = 5`.
2. Compara os dois valores com `cmp`.
3. Se forem iguais (`je`), imprime **"eh igual"**.
4. Se forem diferentes (`jmp`), imprime **"nao eh igual"**.
5. Encerra o programa com `sys_exit`.

Como `1 ≠ 5`, a saída será **"nao eh igual"**.

---

## 🧠 Conceitos

- **`cmp eax, ebx`:** Compara dois valores subtraindo `EBX` de `EAX` e setando as flags (ZF, SF, CF, etc.) sem armazenar o resultado.
- **`je label1`:** Jump if Equal — salta se a flag ZF (Zero Flag) estiver setada (valores iguais).
- **`jmp label2`:** Jump incondicional — salta sempre para o label especificado.
- **Labels como controle de fluxo:** Simulam a lógica de `if/else` de linguagens de alto nível.
- **`sys_write` e `sys_exit`:** Syscalls do Linux para imprimir e encerrar.

---

## 🔧 Compilação

```bash
nasm -f elf32 03_comparacao_condicional.asm -o 03_comparacao_condicional.o
ld -m elf_i386 03_comparacao_condicional.o -o 03_comparacao_condicional
./03_comparacao_condicional
```

---

## 📤 Saída esperada

```
nao eh igual
```

> 💡 Para ver a outra mensagem, altere `mov ebx, 5` para `mov ebx, 1`.
