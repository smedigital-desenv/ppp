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
| `{{CANAL_DE_CONTATO}}` | E-mail ou telefone institucional para dúvidas (seção Contato) | Gabinete |
| `{{LINK_PORTAL_TRANSPARENCIA}}` | URL do Portal da Transparência do Município | GTI |
| `{{QTD_UNIDADES}}` | Número de unidades previstas (quadro "Em números") | SME / modelagem |
| `{{QTD_VAGAS}}` | Número de novas vagas (quadro "Em números") | SME / modelagem |
| `{{PRAZO_DO_CONTRATO}}` | Prazo do contrato, em anos (quadro "Em números") | Modelagem / jurídico |
| `{{DESTINO_DOS_BENS_AO_FIM_DO_CONTRATO}}` | O que acontece com os prédios ao fim do contrato (quadro "PPP não é privatização" e FAQ 11) | Jurídico |
| `{{PROGRAMA_E_INSTITUICOES_DE_APOIO}}` | Programa federal e instituições que apoiam a estruturação, se houver — ex.: o projeto integra o FEP-CAIXA? (seção "Quem estrutura o projeto" e FAQ 12) | SME / Caixa |
| `{{RESPOSTA_QUALIDADE_E_FISCALIZACAO}}` | Como a qualidade dos serviços será medida e fiscalizada (FAQ 10) | Modelagem |
| `{{RELATORIO_DA_ESCUTA}}` | Link do relatório da escuta, ou frase dizendo quando sai | SME |
| `{{LINK_OUVIDORIA}}` | Canal da Ouvidoria do Município (seção Contato) | GTI |
| `{{LINK_ACESSO_A_INFORMACAO}}` | Canal de Acesso à Informação / e-SIC (seção Contato) | GTI |

## Situação das fases

A linha do tempo marca "Modelagem e estudos" como **concluída** e "Escuta e consulta
pública" como **em andamento** — a marcação que veio na primeira versão. Confirmar, e
usar a mesma fase no `{{ETAPA_ATUAL}}` do topo, senão as duas partes da página
discordam. Confirmar também se as 7 fases descritas são as do projeto ou se ele segue
as 4 macroetapas do programa de estruturação da Caixa (planejamento e estudos;
viabilidade e estruturação do contrato; validação externa; licitação e contratação),
como no site de referência de Porto Velho.

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
6. Quadro "PPP não é privatização" — contrato com prazo definido, não a venda das escolas;
   unidades na rede municipal; fiscalização pelo Município.
7. Base legal no mesmo quadro: Lei Federal nº 11.079/2004. É a lei geral das PPPs; confirmar
   se o jurídico quer citar também a modalidade (concessão administrativa) ou outras normas.
8. Quadro "Em números" — "100% vagas públicas e gratuitas" (mesma afirmação do item 1).
9. FAQ 12 e seção "Quem estrutura o projeto" — estruturação pela SME com cooperação técnica
   da Caixa (vem do briefing; confirmar a forma oficial de citar a Caixa).

## Imagens

Nenhuma imagem de terceiros foi usada. O site funciona sem imagens.
Se quiser incluir:

- `assets/img/og-card.jpg` — 1200×630px, para o preview do link no WhatsApp.
  Depois de adicionar, acrescentar no `<head>`: `<meta property="og:image" content="assets/img/og-card.jpg">`
- Brasão do Município e logotipo da SME, em `assets/img/`, para o cabeçalho e o rodapé.
  Usar os arquivos oficiais do manual de identidade visual da Prefeitura.

## Identidade visual

As cores estão em variáveis CSS no `:root`, no topo do `<style>` do `index.html`, com
um bloco para o tema escuro e outro para o alto contraste. Nenhuma regra de componente
usa cor literal. Para aplicar a paleta oficial da Prefeitura, trocar `--azul`,
`--azul-escuro`, `--verde` e `--ocre` e as variantes de texto (`--azul-texto`,
`--verde-texto`, `--ocre-texto`), e conferir o contraste nos três modos.
