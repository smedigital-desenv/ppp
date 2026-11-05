# Hotsite — PPP de Educação Infantil de Ribeirão Preto

Site estático de divulgação à comunidade. Versão provisória, para subpasta do
`smedigital.com.br`.

## Arquivos

```
ppp/
├── index.html      site completo (HTML, CSS e JS em arquivo único)
├── documentos/     PDFs oficiais publicados na seção Documentos (criar quando houver)
├── PENDENCIAS.md   placeholders e afirmações a validar
├── README.md       este arquivo
├── CLAUDE.md       regras do projeto para o Claude Code
└── .github/        publicação (workflow e montagem do site)
```

Arquivo único por opção: é uma página só, provisória, e evita qualquer problema de
caminho relativo ao servir de subpasta. Se o site crescer, separar em
`assets/css/style.css` e `assets/js/main.js`.

## Publicação (GitHub Pages)

| Branch | Vai para |
|---|---|
| `main` | `https://smedigital.com.br/ppp/` (produção) |
| `develop` | `https://smedigital.com.br/ppp/teste/` (homologação) |

O workflow `.github/workflows/deploy-pages.yml` roda a cada push nas duas branches
(ou manualmente, pela aba Actions) e republica as duas árvores.

A montagem é por **inclusão** (`.github/montar-site.sh`): só vai ao ar página e o que
a página carrega (HTML, CSS, JS, imagens, fontes, PDF). `README.md`, `PENDENCIAS.md`,
`CLAUDE.md` e os scripts não são publicados. A pasta `documentos/` já está em
`DIRS_RUNTIME`; imagem nova em `assets/img/` precisa que `assets` entre ali também,
no próprio `montar-site.sh` — a conferência (`conferir-referencias.py`) para o
deploy se a página pedir um arquivo que ficou de fora.

Fluxo: alterar na `develop`, conferir em `/ppp/teste/`, e só então levar para a `main`.

Todos os links internos são âncoras (`#secao`) e não há caminho absoluto no arquivo,
então o site funciona em qualquer subpasta sem ajuste.

### Para não indexar enquanto for provisório

Acrescentar no `<head>` do `index.html`:

```html
<meta name="robots" content="noindex, nofollow">
```

Remover quando o conteúdo for validado e o site for divulgado oficialmente.

## Como editar o conteúdo

- **Textos**: direto no `index.html`. A estrutura é semântica e cada seção tem um
  comentário ou um `id` que corresponde ao item do menu.
- **Dados pendentes**: procurar por `{{` e substituir. Ver `PENDENCIAS.md`.
- **Cores**: variáveis CSS no bloco `:root`, no topo do `<style>`.
- **Fases**: cada `<li class="etapa">` tem uma situação. Concluída: classe
  `etapa-feita` e selo `<span class="situacao situacao-feita">Concluída</span>`. Em
  andamento: `etapa-atual` e `situacao-atual`. A iniciar: só `etapa` e
  `<span class="situacao">A iniciar</span>`. Ao avançar, mover as classes e os selos e
  atualizar `{{ETAPA_ATUAL}}` no topo com o mesmo nome.
- **Documentos**: pôr o PDF em `documentos/` e, no grupo certo da seção Documentos,
  trocar o parágrafo `.vazio` por uma lista com um item por arquivo (o modelo está num
  comentário no próprio `index.html`) e atualizar o texto `.qtd` ("2 documentos").
  Só documento já publicado oficialmente.
- **Perguntas da FAQ**: cada bloco `.item` é independente. Ao duplicar um bloco,
  trocar os `id` (hoje vão até `b12` / `r12`) e os `aria-controls` /
  `aria-labelledby` correspondentes, senão a acessibilidade quebra.

## Características técnicas

- HTML, CSS e JavaScript puros. Sem framework, sem build step, sem dependência de CDN
  além das fontes do Google Fonts (Bitter e Source Sans 3), com fallback de sistema.
- Mobile-first. Testado a partir de 360px de largura, sem rolagem horizontal.
- Tema claro e escuro, seguindo a preferência do sistema do visitante.
- Barra de acessibilidade: tamanho do texto (A− / A+, de 100% a 137,5%) e alto
  contraste. A escolha fica guardada só no navegador da pessoa (`localStorage`),
  sem cookie.
- Acessibilidade: HTML semântico, hierarquia de headings, skip link, navegação por
  teclado, acordeão com `aria-expanded`, foco visível, contraste AA nos temas claro,
  escuro e alto contraste, respeito a `prefers-reduced-motion`.
- No celular o menu fica numa linha e rola para o lado dentro dele, para o cabeçalho
  fixo não ocupar meia tela.
- Meta tags Open Graph para o preview do link em WhatsApp (falta a imagem — ver
  `PENDENCIAS.md`).
- Nenhum formulário nem coleta de dados pessoais na página, e nenhum cookie — por
  isso não há aviso de cookies. A inscrição em eventos aponta para formulário externo.
