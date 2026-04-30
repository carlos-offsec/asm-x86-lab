# 04 — Call e Funções

## 📄 Arquivo: `04_call_funcao.asm`

Programa que demonstra o uso de `call` e `ret` para chamar funções em Assembly.

---

## 🎯 O que faz

1. Imprime **"Isso eh um teste"** usando `sys_write`.
2. Chama a função `_outrafuncao` com a instrução `call`.
3. Dentro da função, imprime **"Isso foi chamado depois de um call"**.
4. Retorna da função com `ret` e encerra o programa com `sys_exit`.

---

## 🧠 Conceitos

- **`call _outrafuncao`:** Empurra o endereço de retorno na pilha e salta para o label. Equivalente a uma chamada de função.
- **`ret`:** Desempilha o endereço de retorno e salta de volta para onde o `call` foi feito.
- **Stack Frame (prólogo/epílogo):**
  - `push ebp` → salva o base pointer antigo na pilha.
  - `mov ebp, esp` → define o novo base pointer.
  - `pop ebp` → restaura o base pointer antigo antes de retornar.
- **Convenção de chamada:** Mesmo sendo simples, o código segue o padrão de prólogo/epílogo de funções usado em programas C compilados.

---

## 🔧 Compilação

```bash
nasm -f elf32 04_call_funcao.asm -o 04_call_funcao.o
ld -m elf_i386 04_call_funcao.o -o 04_call_funcao
./04_call_funcao
```

---

## 📤 Saída esperada

```
Isso eh um teste
Isso foi chamado depois de um call
```
