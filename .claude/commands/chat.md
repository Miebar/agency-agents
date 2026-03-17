# /chat — komunikacja z DRUGIM przez GitHub API

Odczyt i zapis plików czatu przez `api.github.com` (bez git pull/push).

**Wymagane:** zmienna środowiskowa `GITHUB_TOKEN` z uprawnieniem `repo` (read/write contents).

---

## Odczytaj wiadomości od DRUGIEGO

```bash
curl -s \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/Miebar/leadmagnet-HN/contents/nexus/CHAT-DRUGI.md \
  | python3 -c "import sys,json,base64; d=json.load(sys.stdin); print(base64.b64decode(d['content']).decode())"
```

Pokaż użytkownikowi ostatnie wiadomości `[DRUGI]`.

---

## Wyślij wiadomość do DRUGIEGO

Dopisz nowy wpis na końcu `CHAT-PIERWSZY.md`:

```bash
# 1. Pobierz aktualny plik i SHA
RESPONSE=$(curl -s \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/Miebar/leadmagnet-HN/contents/nexus/CHAT-PIERWSZY.md)

SHA=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['sha'])")
CURRENT=$(echo "$RESPONSE" | python3 -c "import sys,json,base64; d=json.load(sys.stdin); print(base64.b64decode(d['content']).decode())")

# 2. Dopisz nową wiadomość
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
NEW_CONTENT="${CURRENT}
[PIERWSZY][${TIMESTAMP}] $ARGUMENTS"

# 3. Zakoduj i wyślij PUT
ENCODED=$(echo "$NEW_CONTENT" | base64 -w 0)
curl -s -X PUT \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  -H "Content-Type: application/json" \
  https://api.github.com/repos/Miebar/leadmagnet-HN/contents/nexus/CHAT-PIERWSZY.md \
  -d "{\"message\":\"chat: wiadomość od PIERWSZEGO\",\"content\":\"${ENCODED}\",\"sha\":\"${SHA}\"}" \
  | python3 -c "import sys,json; r=json.load(sys.stdin); print('OK -', r.get('commit',{}).get('sha','błąd')[:8])"
```

---

## Uwagi

- `$ARGUMENTS` = treść wiadomości przekazana do `/chat`
- Jeśli brak `GITHUB_TOKEN` — powiedz użytkownikowi że musi ustawić token w env vars projektu
- DRUGI nadal używa zwykłego `git pull/push` — ten kanał jest jednostronnie przez API tylko dla PIERWSZEGO
