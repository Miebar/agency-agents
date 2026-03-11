# NEXUS — Pełna mapa możliwości

> Notatka z sesji 2026-03-11

---

## Możliwości NEXUS poza pojedynczymi komendami agentów

### 1. Tryby aktywacji (3 skale)

| Tryb | Agenci | Czas | Kiedy używać |
|---|---|---|---|
| **NEXUS-Full** | 30-40+ | 12-24 tyg. | Pełny cykl produktu od discovery do operacji |
| **NEXUS-Sprint** | 15-25 | 2-6 tyg. | Feature, MVP, inicjatywy |
| **NEXUS-Micro** | 3-10 | 1-5 dni | Bug, kampania, pojedyncza faza |

---

### 2. Pipeline 7-fazowy (NEXUS-Full)

```
Faza 0: DISCOVER    → 6 agentów analizuje okazję rynkową
Faza 1: STRATEGIZE  → architektura, spec, podejście
Faza 2: SCAFFOLD    → fundamenty tech + design
Faza 3: BUILD       → Dev ↔ QA loop z quality gates
Faza 4: HARDEN      → testy, ryzyko, hardening
Faza 5: LAUNCH      → go-to-market, akwizycja
Faza 6: OPERATE     → operacje ciągłe, ewolucja
```

**Każda faza ma quality gate** — bez zaliczenia bramy faza się nie zamyka.

---

### 3. Wzorce orkiestracji (poza wywołaniem 1 agenta)

#### Pattern: Równoległa praca wielu agentów
Do 8 agentów pracuje jednocześnie nad różnymi aspektami jednego celu, np. Discovery:
- Trend Researcher (rynek)
- Backend Architect (architektura)
- Brand Guardian (pozycjonowanie)
- Growth Hacker (GTM)
- UX Researcher (persony)
- XR Interface Architect (UI)
- Project Shepherd (harmonogram)
- Support Responder (blueprint supportu)

#### Pattern: Dev ↔ QA Loop
```
Developer implementuje → QA waliduje →
  PASS: następny task
  FAIL: retry z feedbackiem (max 3x)
  3x FAIL: eskalacja
```

#### Pattern: Sequential Hand-Off
Wynik jednej fazy → kontekst kolejnej (bez "cold start")

---

### 4. Runbooki w `/strategy/runbooks/`

Gotowe scenariusze z przypisanymi agentami i harmonogramem:
- **Startup MVP** (4-6 tyg.) — 18-22 agentów
- **Marketing Campaign** (2-4 tyg.) — 10-15 agentów
- **Enterprise Feature** (6-12 tyg.) — compliance, canary deploy
- **Incident Response** (minuty-godziny) — klasyfikacja P0-P3

---

### 5. Agents Orchestrator — autonomiczny manager

Specjalny agent który **samodzielnie zarządza całym pipelinem**:
- Spawnie agentów według fazy i potrzeby
- Pilnuje quality gates
- Retry logic (maks. 3 próby → eskalacja)
- Przekazuje pełny kontekst przy każdym handoffie
- Raportuje status

---

### 6. Integracje narzędziowe (przez `convert.sh`)

Agenci działają w 7 narzędziach — konwersja automatyczna:
- Claude Code (natywnie)
- Cursor (`.mdc`)
- Aider (`CONVENTIONS.md`)
- Windsurf (`.windsurfrules`)
- Gemini CLI
- OpenCode
- Antigravity

---

### 7. CI/CD i automatyzacja

- **`lint-agents.sh`** — walidacja struktury agentów w GitHub Actions (blokuje merge jeśli agent nie przejdzie)
- **`install.sh`** — interaktywny installer z auto-detekcją narzędzi
- **`convert.sh`** — batch konwersja agentów do wszystkich formatów

---

### 8. Dostępne komendy NEXUS (slash commands)

| Komenda | Opis |
|---|---|
| `/nexus:full` | Pełny pipeline produktowy (7 faz) |
| `/nexus:sprint` | Sprint mode (feature/MVP) |
| `/nexus:mvp` | Startup MVP z tygodniowym harmonogramem |
| `/nexus:enterprise` | Enterprise feature z compliance |
| `/nexus:incident` | Natychmiastowa odpowiedź na incydent produkcyjny |
| `/nexus:micro-bugfix` | Szybka naprawa buga (3 agenci) |
| `/nexus:micro-campaign` | Kampania marketingowa |
| `/nexus:micro-performance` | Diagnoza i optymalizacja wydajności |
| `/nexus:micro-research` | Research rynkowy + executive brief |
| `/nexus:micro-ux` | UX research + design + implementacja |
| `/nexus:micro-compliance` | Audyt compliance (GDPR/CCPA/etc) |

---

### 9. Podział agentów (68 łącznie w 9 dywizjach)

| Dywizja | Liczba |
|---|---|
| Engineering | 11 |
| Design | 8 |
| Marketing | 11 |
| Product | 4 |
| Project Management | 5 |
| Testing/QA | 8 |
| Support/Operations | 6 |
| Spatial Computing | 6 |
| Specialized | 9 |

---

### Kluczowa zasada

> NEXUS to nie biblioteka promptów — to **doktryna operacyjna** zamieniająca AI w skoordynowaną, jakościową siłę developerską z automatycznymi quality gates, pętlami Dev↔QA i autonomicznym zarządzaniem pipelinem.
