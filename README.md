# Projeto de Pesquisa — PPGMUS UNESPAR

**Mediação algorítmica na música eletroacústica: aplicações da inteligência artificial generativa como ferramenta, coautora e sistema de geração sonora**

Projeto de pesquisa submetido ao Programa de Pós-Graduação em Música da UNESPAR.

- **Autor:** Filipe Borato De Castro
- **Local:** Curitiba
- **Ano:** 2026

## Estrutura do repositório

```
.
├── main.tex                 # ponto de entrada (\documentclass abntex2)
├── config.tex               # pacotes, fontes, margens, dados da capa
├── conteudo.tex             # corpo do texto
├── assets/                  # figuras e imagens
├── referencias/
│   ├── bib/                 # base bibliográfica (BibTeX)
│   │   ├── referencias.bib  # fonte única usada pelo main.tex
│   │   ├── master.bib       # agregador (placeholder)
│   │   ├── externas/
│   │   └── fontes-secundarias/
│   ├── pdf/                 # PDFs das fontes citadas (não versionados)
│   ├── fichamentos/         # resumos e fichamentos (.md)
│   └── notas/               # notas de trabalho (.md)
├── .latexmkrc               # configuração do latexmk (XeLaTeX)
└── .gitignore
```

## Requisitos

- **TeX Live 2025 ou superior** (com `abntex2`, `fontspec`, `microtype`, `latexmk`)
- **XeLaTeX** como motor de compilação (o projeto usa `fontspec` com `Times New Roman`)
- Fonte **Times New Roman** instalada no sistema

## Compilação

Na raiz do projeto:

```bash
latexmk -xelatex main.tex
```

O `.latexmkrc` já fixa XeLaTeX como motor e executa automaticamente `xelatex → bibtex → xelatex → xelatex` conforme necessário para resolver citações ABNT.

Para limpar arquivos auxiliares:

```bash
latexmk -c      # remove auxiliares, mantém main.pdf
latexmk -C      # remove tudo, inclusive main.pdf
```

## Compilação com Docker no WSL

Pré-requisitos:

- WSL 2 com Docker funcionando (`docker --version`)
- Docker Desktop aberto no Windows, com integração WSL habilitada para `Ubuntu-24.04`
- Projeto acessível pelo WSL, por exemplo em `/mnt/c/Users/filipe/Desktop/Mestrado Em Musica/Dissertação/Projeto_PPGMUS_UNESPAR-latex`
- Fontes do Windows montáveis em `/mnt/c/Windows/Fonts` para o XeLaTeX encontrar `Times New Roman`

No WSL, entre na pasta do projeto e compile:

```bash
cd "/mnt/c/Users/filipe/Desktop/Mestrado Em Musica/Dissertação/Projeto_PPGMUS_UNESPAR-latex"
make pdf
```

Comandos disponíveis:

```bash
make pdf      # compila com Docker Compose
make force    # força recompilação completa
make clean    # limpa auxiliares, mantém main.pdf
make down     # remove containers/redes órfãs do Compose
```

No PowerShell, defina explicitamente o caminho das fontes antes de usar o Compose:

```powershell
docker compose up --build --abort-on-container-exit --exit-code-from latex
```

O Compose lê automaticamente o arquivo `.env` local. Para Windows/PowerShell, use:

```env
WINDOWS_FONTS_DIR=C:\Windows\Fonts
```

Para WSL, o valor padrão já funciona:

```env
WINDOWS_FONTS_DIR=/mnt/c/Windows/Fonts
```

Há um modelo versionado em `.env.example`; o `.env` real fica fora do git.

Sem `make`, o comando equivalente no WSL é:

```bash
docker compose up --build --abort-on-container-exit --exit-code-from latex
```

### VS Code

A extensão [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) detecta o `.latexmkrc` e o cabeçalho `% !TEX program = xelatex` do `main.tex`. Basta `Ctrl+Alt+B` para compilar.

## Normas

- Classe documental: `abntex2`
- Estilo bibliográfico: `abntex2-alf` (autor-data, ABNT NBR 6023)
- Margens: 2,5 cm (conforme orientação PPGMUS)
- Espaçamento: 1,5 entre linhas; recuo de parágrafo 1,5 cm
