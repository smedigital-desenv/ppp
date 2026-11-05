# Hotsite — PPP de Educação Infantil de Ribeirão Preto

> Lido automaticamente por toda sessão do Claude Code neste repositório.
> Ao mudar a estrutura, a publicação ou uma regra abaixo, atualize este arquivo
> no mesmo commit.

⚠️ **"PPP" aqui é Parceria Público-Privada**, não Projeto Político-Pedagógico
(o PPP das unidades escolares, que mora no MAPA). São assuntos diferentes.

## Contexto

Hotsite institucional de divulgação da Parceria Público-Privada (PPP) de
Educação Infantil de Ribeirão Preto, da Secretaria Municipal de Educação (SME),
em cooperação técnica com a Caixa Econômica Federal.

Arquivos: `index.html` (site completo em arquivo único), `PENDENCIAS.md`
(placeholders e afirmações a validar) e `README.md` (estrutura, edição e
publicação). Leia os três antes de qualquer alteração.

**Destino previsto:** subpasta provisória do site da SME. O endereço e a forma
de publicação ainda estão em aberto — ver `README.md`.

## Natureza do site

- Estático: HTML, CSS e JavaScript puros. Sem framework, sem build step.
- Apenas divulgação. Sem backend, sem área restrita, sem formulário que colete
  dados pessoais. A inscrição em eventos aponta para formulário externo.
- Público: pais e responsáveis de crianças de 0 a 5 anos, professores e
  gestores da rede municipal, com escolaridade variada. A maioria abre pelo
  celular, por link de WhatsApp.

## Regra crítica de conteúdo

**Não invente nenhum dado.** Nada de números de vagas, valores, prazos, datas
de obra, cronogramas, nomes de bairros, metas ou quantidade de unidades que não
esteja em documento fornecido pela SME na sessão.

Onde um dado for necessário para a diagramação, use um placeholder no formato
`{{DADO_A_CONFIRMAR}}`, aplique a classe `.pend` para ele aparecer destacado na
página, e registre a pendência no `PENDENCIAS.md`.

O `PENDENCIAS.md` também lista, numa seção própria, afirmações que estão no
site como texto corrido mas ainda precisam de validação jurídica. Mantenha essa
seção atualizada: confirmada, a afirmação sai da lista; desmentida, o texto do
site é corrigido.

## Padrões a preservar

- **Cores**: em variáveis CSS no `:root`, com bloco equivalente para tema
  escuro em `@media (prefers-color-scheme: dark)` e em
  `:root[data-theme="dark"]`. Nenhuma cor literal em regra de componente.
  ⚠️ A primeira versão ainda tem literais (os brancos e azuis claros do
  cabeçalho, do hero e do rodapé, e o hover do botão) — dívida conhecida.
- **Tipografia**: Bitter (títulos) e Source Sans 3 (texto), via Google Fonts,
  com fallback de sistema. Corpo de texto em 17px.
- **Mobile-first**: sem rolagem horizontal a partir de 360px. Gutter lateral de
  16px com `max(16px, env(safe-area-inset-left, 0px))`.
- **Acessibilidade WCAG 2.1 AA**: HTML semântico, hierarquia correta de
  headings, skip link, navegação completa por teclado, `aria-expanded` e
  `aria-controls` no acordeão, foco visível, contraste mínimo 4.5:1, respeito a
  `prefers-reduced-motion`. Confira o contraste nos DOIS temas: uma variável
  que é escura no claro (`--azul`) vira clara no escuro, e texto branco sobre
  ela deixa de passar.
- **Linguagem**: simples, frases curtas, voz ativa, tom institucional. Sem
  linguagem de marketing e sem superlativos — é comunicação de governo
  municipal.
- **Sem caminho absoluto** em nenhum link ou recurso, para o site funcionar em
  subpasta.
- Em português, usar a contração "da/do" antes de sujeito de infinitivo
  (ex.: "impossibilidade da unidade escolar providenciar").

## O que nunca entra no repositório

O site é público. Tudo que for commitado aqui pode virar URL baixável, e o
histórico do Git é permanente. Nunca versione:

- planilha, script ou export de dados (`.sql`, `.csv`, `.xlsx`, `.xls`,
  `.dump` — o `.gitignore` os bloqueia);
- dado pessoal (nome, e-mail, CPF, telefone, endereço de pessoa);
- credencial ou token;
- documento interno da modelagem ainda não publicado oficialmente — o
  conteúdo vai para a página só depois de validado.

## Ao final de cada alteração

1. Liste cada afirmação factual nova que entrou no site e aponte de onde ela
   veio. Afirmação sem origem em documento fornecido vira placeholder.
2. Atualize `PENDENCIAS.md` e `README.md` se a alteração mudar algo neles.
3. Confirme que o site continua sem rolagem horizontal a 360px, sem erro no
   console e com contraste AA nos temas claro e escuro.
