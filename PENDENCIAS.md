# Pendências de conteúdo — Hotsite PPP de Educação Infantil

Todo trecho marcado com `{{...}}` no `index.html` aparece destacado em amarelo na página.
Enquanto não for preenchido, o destaque serve de aviso visual de que o dado não está confirmado.

Para localizar todos: `grep -n "{{" index.html`

## Placeholders a preencher

| Placeholder | O que é esperado | Quem fornece |
|---|---|---|
| `{{ETAPA_ATUAL}}` | Nome da fase em que o projeto está, para o selo do topo | SME / gabinete |
| `{{UNIDADES_E_LOCALIZACAO}}` | Quantidade de unidades e regiões/bairros, quando definidos | SME / modelagem |
| `{{VINCULO_DOS_PROFISSIONAIS}}` | Frase sobre o vínculo dos profissionais que atuarão nas unidades | Jurídico / RH |
| `{{METAS_E_INDICADORES}}` | Metas do projeto (texto curto, sem número não confirmado) | SME / modelagem |
| `{{SERVICOS_NAO_PEDAGOGICOS}}` | Serviços não pedagógicos a cargo do parceiro privado, se houver | Modelagem / jurídico |
| `{{NOME_DO_EVENTO}}` | Nome da etapa participativa em divulgação | Gabinete |
| `{{DATA}}` / `{{HORARIO}}` / `{{LOCAL}}` / `{{PRAZO}}` | Dados do encontro e prazo de inscrição | Gabinete |
| `{{LINK_DO_FORMULARIO}}` | URL do formulário de inscrição | SME / GTI |
| `{{RESPOSTA_VINCULO_PROFISSIONAIS}}` | Resposta da FAQ sobre quem atuará nas unidades | Jurídico / RH |
| `{{CRONOGRAMA}}` | Previsão de etapas e obras, quando houver cronograma oficial | Modelagem |
| `{{LINK_TRANSPARENCIA_E_DOCUMENTOS}}` | Onde a população acompanha os documentos do projeto | SME / GTI |
| `{{CANAL_DE_CONTATO}}` | E-mail ou telefone institucional para dúvidas | Gabinete |
| `{{LINK_PORTAL_TRANSPARENCIA}}` | URL do Portal da Transparência do Município | GTI |

## Afirmações que precisam de validação jurídica

Estes trechos **não** são placeholders: estão escritos como texto corrido na página,
porque sem eles o site não se sustenta como peça de divulgação. Mas decorrem do desenho
usual de uma PPP de infraestrutura, não de documento do projeto. Valide antes de publicar
e ajuste ou remova o que não se confirmar.

1. Seção "O que não muda" — matrícula pública e gratuita feita pela SME; projeto pedagógico
   municipal; unidades integrando a rede municipal.
2. Seção "Quem faz o quê" — divisão entre infraestrutura (parceiro privado) e educação (Município).
3. FAQ 1 — "Isso é privatização das creches?"
4. FAQ 2 — "A família vai pagar alguma coisa?"
5. FAQ 6 — "Como a matrícula vai funcionar?"

## Imagens

Nenhuma imagem de terceiros foi usada. O site funciona sem imagens.
Se quiser incluir:

- `assets/img/og-card.jpg` — 1200×630px, para o preview do link no WhatsApp.
  Depois de adicionar, acrescentar no `<head>`: `<meta property="og:image" content="assets/img/og-card.jpg">`
- Brasão do Município e logotipo da SME, em `assets/img/`, para o cabeçalho e o rodapé.
  Usar os arquivos oficiais do manual de identidade visual da Prefeitura.

## Identidade visual

As cores estão em variáveis CSS no `:root`, no topo do `<style>` do `index.html`.
Para aplicar a paleta oficial da Prefeitura, basta trocar `--azul`, `--azul-escuro`,
`--verde` e `--ocre` — nada mais no arquivo usa cor literal.
