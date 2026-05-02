# 📄 PDF Escrito a mão: Hello World

Este projeto é uma exploração prática da estrutura interna do formato de arquivo **PDF (Portable Document Format)**. Em vez de utilizar um software de editoração ou biblioteca de programação, este arquivo foi escrito manualmente caractere por caractere em um editor de texto simples.

## 🛠️ O que este arquivo demonstra?

A criação manual de um PDF demonstra o entendimento de como os arquivos são estruturados em "objetos" e como os leitores de PDF (parsers) interpretam esses dados. Este é um exercício fundamental em **Cybersecurity** e **Análise de Formatos de Arquivos**, pois permite entender como payloads podem ser escondidos ou como vulnerabilidades de parser podem ser exploradas.

## 🔍 Estrutura do Arquivo

O arquivo `HelloWorld.pdf.txt` segue a especificação 1.4 do PDF e contém os seguintes componentes:

1.  **Header (`%PDF-1.4`)**: Identifica a versão do formato.
2.  **Body (Objetos 1 a 4)**:
    *   **Obj 1 (Catalog)**: A raiz do documento.
    *   **Obj 2 (Pages)**: O nó pai que gerencia a lista de páginas.
    *   **Obj 3 (Page)**: Define as propriedades de uma página individual (tamanho `MediaBox`, recursos e fontes).
    *   **Obj 4 (Stream)**: Contém os comandos reais de desenho e texto (`BT` para Begin Text, `ET` para End Text).
3.  **Cross-Reference Table (`xref`)**: Uma tabela de índices que informa ao leitor a posição exata (em bytes) de cada objeto dentro do arquivo, permitindo o acesso aleatório.
4.  **Trailer**: Aponta para o objeto raiz (`Root`) e define o tamanho da tabela.
5.  **startxref**: O endereço de memória onde a tabela `xref` começa.

## 🚀 Como testar?

Para visualizar o resultado como um documento real:

1.  Remova a extensão `.txt` do arquivo, deixando apenas `HelloWorld.pdf`.
2.  Abra o arquivo em qualquer navegador (Chrome, Firefox, Edge) ou leitor de PDF (Adobe, SumatraPDF).

