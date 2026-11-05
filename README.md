# Hotsite — PPP de Educação Infantil de Ribeirão Preto

Site estático de divulgação à comunidade. Versão provisória, para subpasta do
`smedigital.com.br`.

## Arquivos

```
hotsite-ppp/
├── index.html      site completo (HTML, CSS e JS em arquivo único)
├── PENDENCIAS.md   placeholders e afirmações a validar
└── README.md       este arquivo
```

Arquivo único por opção: é uma página só, provisória, e evita qualquer problema de
caminho relativo ao servir de subpasta. Se o site crescer, separar em
`assets/css/style.css` e `assets/js/main.js`.

## Publicação em subpasta

Destino previsto: `https://smedigital.com.br/ppp-educacao-infantil/`

1. Criar a pasta `ppp-educacao-infantil/` na raiz do repositório do site.
2. Copiar o `index.html` para dentro dela.
3. Commit e push — o Cloudflare Pages publica automaticamente.

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
- **Etapa atual na linha do tempo**: a classe `etapa-atual` no `<li>` correspondente
  marca o círculo em azul e exibe o selo "Etapa atual". Mover a classe conforme o
  projeto avança, e atualizar `{{ETAPA_ATUAL}}` no selo do topo.
- **Perguntas da FAQ**: cada bloco `.item` é independente. Ao duplicar um bloco,
  trocar os `id` (`b9` / `r9`) e os `aria-controls` / `aria-labelledby`
  correspondentes, senão a acessibilidade quebra.

## Características técnicas

- HTML, CSS e JavaScript puros. Sem framework, sem build step, sem dependência de CDN
  além das fontes do Google Fonts (Bitter e Source Sans 3), com fallback de sistema.
- Mobile-first. Testado a partir de 360px de largura, sem rolagem horizontal.
- Tema claro e escuro, seguindo a preferência do sistema do visitante.
- Acessibilidade: HTML semântico, hierarquia de headings, skip link, navegação por
  teclado, acordeão com `aria-expanded`, foco visível, respeito a
  `prefers-reduced-motion`.
- Meta tags Open Graph para o preview do link em WhatsApp (falta a imagem — ver
  `PENDENCIAS.md`).
- Nenhum formulário nem coleta de dados pessoais na página. A inscrição em eventos
  aponta para formulário externo.
