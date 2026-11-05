#!/usr/bin/env bash
# =============================================================================
# Monta o que vai ao ar — por INCLUSÃO.
#
# ⚠️ A REGRA: só PÁGINA e o que a página carrega é publicado. O resto do
#    sistema — documentação, script de build, código de servidor, migração,
#    legado, ferramenta — não tem motivo para responder por URL, e aqui ele
#    simplesmente não entra.
#
# ⚠️ POR QUE INCLUSÃO, E NÃO EXCLUSÃO. Esta montagem já foi uma lista de
#    exclusão, e o que não estava nela ia ao ar. Resultado medido em
#    18/09/2026: 9 dos 14 repositórios da rede serviam o próprio CLAUDE.md
#    por URL. Numa lista de exclusão a pasta nova nasce PÚBLICA e ninguém
#    percebe; nesta ela nasce FORA — e, se for tela, o passo de conferência
#    avisa antes de publicar.
#
# 🚫 NÃO acrescente extensão nem pasta aqui "para destravar o deploy". Se a
#    conferência acusou, ou falta um arquivo que a página carrega (aí a pasta
#    dele entra em DIRS_RUNTIME), ou a página está pedindo algo que não
#    deveria ir ao ar (aí o defeito é a página).
# =============================================================================
set -euo pipefail

ORIGEM="${1:?uso: montar-site.sh <origem> <destino>}"
DESTINO="${2:?uso: montar-site.sh <origem> <destino>}"

# Pastas de RUNTIME deste repositório: as que guardam o que as páginas
# carregam. A raiz sempre entra. O que não estiver aqui fica de fora.
DIRS_RUNTIME=(documentos)

# O que conta como "página e o que a página carrega".
EXTENSOES=( -name '*.html' -o -name '*.css' -o -name '*.js' -o -name '*.mjs'
            -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.gif'
            -o -name '*.webp' -o -name '*.svg' -o -name '*.ico' -o -name '*.pdf'
            -o -name '*.woff' -o -name '*.woff2' -o -name '*.ttf'
            -o -name '*.webmanifest' -o -name 'robots.txt' -o -name 'sitemap.xml' )

# ⚠️ O destino vira ABSOLUTO antes do `cd` abaixo. Com caminho relativo,
# `_site` passava a ser resolvido dentro da origem (`_src/main/_site`) e o
# site era montado no lugar errado — o passo seguinte não achava nada.
mkdir -p "$DESTINO"
DESTINO="$(cd "$DESTINO" && pwd)"

LISTA="$(mktemp)"
cd "$ORIGEM"

# 1) a raiz
find . -maxdepth 1 -type f \( "${EXTENSOES[@]}" \) -print >> "$LISTA"

# 2) as pastas de runtime
for d in ${DIRS_RUNTIME[@]+"${DIRS_RUNTIME[@]}"}; do
  [ -d "$d" ] && find "./$d" -type f \( "${EXTENSOES[@]}" \) -print >> "$LISTA"
done

# 3) o que o Pages precisa e não tem extensão de página
for f in CNAME .nojekyll .htaccess; do
  [ -f "$f" ] && echo "./$f" >> "$LISTA"
done

# 4) arquivo de DADO só entra se estiver em .guarda-permitidos — a lista que
#    alguém conferiu à mão, linha por linha. É o único caminho para um
#    .xls/.csv ir ao ar, e é de propósito que ele passe por uma pessoa.
if [ -f .guarda-permitidos ]; then
  grep -vE '^[[:space:]]*(#|$)' .guarda-permitidos | sed 's|^|./|' >> "$LISTA" || true
fi

sed -i 's|^\./||' "$LISTA"
sort -u -o "$LISTA" "$LISTA"
: > "$LISTA.ok"
while IFS= read -r arq; do [ -e "$arq" ] && printf '%s\n' "$arq" >> "$LISTA.ok"; done < "$LISTA"

tar -c -T "$LISTA.ok" | tar -x -C "$DESTINO"
echo "publicados $(wc -l < "$LISTA.ok") arquivos de $(pwd) para $DESTINO"
