#!/usr/bin/env python3
"""Confere que nenhuma página ficou sem o que ela carrega.

A montagem publica por INCLUSÃO (montar-site.sh). O risco dessa escolha é o
oposto do da lista de exclusão: em vez de publicar demais em silêncio, ela pode
publicar de MENOS — e a página abre quebrada. Este passo fecha esse risco.

  - referência que falta no site MAS existe no repositório -> ERRO, o deploy
    para. Foi a lista de inclusão que deixou de fora algo que a página carrega.
  - referência que falta nos dois -> aviso. O link já estava quebrado antes; não
    foi o deploy que o quebrou, e não é motivo para segurar a publicação.
"""
import os
import re
import sys
import urllib.parse

site, origem = sys.argv[1], sys.argv[2]
REF = re.compile(
    r"(?:src|href)\s*=\s*[\"']([^\"']+)[\"']"
    r"|url\(\s*[\"']?([^\"')]+)[\"']?\s*\)"
)
IGNORAR = ('http://', 'https://', '//', '#', 'data:', 'mailto:', 'tel:',
           'javascript:', '{', '$')
# /central/ é servido pelo repositório do hub, na raiz do domínio — referência
# legítima que nenhum outro repositório tem como publicar.
CROSS = ('/central/',)
erros, avisos = [], []

for raiz, _, arquivos in os.walk(site):
    for nome in arquivos:
        if not nome.endswith(('.html', '.css')):
            continue
        caminho = os.path.join(raiz, nome)
        try:
            texto = open(caminho, encoding='utf-8', errors='ignore').read()
        except OSError:
            continue
        for a, b in REF.findall(texto):
            ref = (a or b).strip()
            if not ref or ref.startswith(IGNORAR) or ref.startswith(CROSS):
                continue
            alvo = urllib.parse.unquote(ref.split('#')[0].split('?')[0])
            # Referência real tem extensão ou caminho. Sem esse filtro, pedaço
            # de expressão em CSS/JS (`url(0`, `url(o`) virava aviso — e aviso
            # que sempre aparece é aviso que as pessoas aprendem a ignorar.
            if len(alvo) < 3 or ('.' not in alvo and '/' not in alvo):
                continue
            if alvo.startswith('/'):
                destino = os.path.join(site, alvo.lstrip('/'))
                no_repo = os.path.join(origem, alvo.lstrip('/'))
            else:
                destino = os.path.join(raiz, alvo)
                no_repo = os.path.join(origem, os.path.relpath(destino, site))
            if os.path.exists(destino):
                continue
            rel = os.path.relpath(caminho, site)
            (erros if os.path.exists(no_repo) else avisos).append((rel, ref))

for rel, ref in avisos:
    print('::warning::%s aponta para "%s", que não existe nem no repositório — '
          'link já quebrado antes do deploy' % (rel, ref))
for rel, ref in erros:
    print('::error::%s carrega "%s", que EXISTE no repositório e NÃO foi publicado. '
          'Falta a pasta dele em DIRS_RUNTIME, no montar-site.sh' % (rel, ref))
if erros:
    print('\n%d referência(s) ficaram de fora da lista de inclusão — deploy abortado.'
          % len(erros))
    sys.exit(1)
print('conferência ok — %d aviso(s), nenhum erro' % len(avisos))
