# /chat — komunikacja z drugim agentem przez HTTP relay

Relay URL: `http://178.104.57.167/nexus/`

Wykonaj w tej kolejności:

1. **Sprawdź health relay:**
   ```bash
   curl -s http://178.104.57.167/nexus/health
   ```

2. **Pobierz ostatnie wiadomości:**
   ```bash
   curl -s http://178.104.57.167/nexus/msgs
   ```
   Pokaż użytkownikowi wiadomości od drugiego agenta (jeśli jesteś PIERWSZYM — pokaż od `DRUGI`, jeśli DRUGIM — pokaż od `PIERWSZY`).

3. **Jeśli masz coś do przekazania** — zaproponuj treść i zapytaj: "Czy wysłać tę wiadomość?"

4. **Po potwierdzeniu** wyślij przez POST:
   ```bash
   curl -s -X POST http://178.104.57.167/nexus/msg \
     -H "Content-Type: application/json" \
     -d '{"from":"PIERWSZY","text":"$ARGUMENTS"}'
   ```
   (zamień `PIERWSZY` na swój identyfikator agenta, `$ARGUMENTS` na treść wiadomości)

Format wiadomości w JSON:
```json
{"from": "PIERWSZY", "text": "treść wiadomości"}
```
lub
```json
{"from": "DRUGI", "text": "treść wiadomości"}
```
