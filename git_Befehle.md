# Git-Befehle für das Projekt

## Übersicht der wichtigsten Git-Befehle

### 1. Branches anzeigen und wechseln

#### Aktuellen Branch anzeigen
```bash
git branch
```
Zeigt alle lokalen Branches und markiert den aktuellen Branch mit einem Stern (*).

#### Zu einem anderen Branch wechseln
```bash
git checkout develop
```
Wechselt zum `develop`-Branch. Verwende den Namen des Branches, zu dem du wechseln möchtest.

---

### 2. Updates von Remote abrufen

#### Neueste Änderungen vom Server holen
```bash
git pull
```
Zieht die neuesten Veränderungen vom Remote-Repository in deinen aktuellen Branch herunter.

---

### 3. Neue Features - Workflow mit Feature-Branches

#### Neuen Feature-Branch erstellen
```bash
git checkout -b feature/xyz
```
Erstellt einen neuen Branch mit dem Namen `feature/xyz` und wechselt sofort hinein.

**Beispiele:**
- `git checkout -b feature/login`
- `git checkout -b feature/api`
- `git checkout -b feature/database-migration`

---

### 4. Änderungen speichern und hochladen

#### Alle Änderungen zum Commit vorbereiten
```bash
git add .
```
Fügt alle veränderten Dateien zum Staging-Area hinzu.

#### Änderungen mit einer Nachricht speichern
```bash
git commit -m "Add login endpoint"
```
Erstellt einen Commit mit einer aussagekräftigen Nachricht. Die Nachricht sollte beschreiben, was geändert wurde.

#### Commits zum Remote-Repository hochladen
```bash
git push -u origin feature/xyz
```
Pushed die Commits auf den Remote-Server. Mit `-u` wird der lokale Branch dem Remote-Branch zugeordnet.

---

## Der Standard-Workflow

Folge diesen Schritten, um an neuen Features zu arbeiten:

### Schritt 1: Codespace öffnen
Starte deine Entwicklungsumgebung.

### Schritt 2: Zum Development-Branch wechseln (main oder deiner)
```bash
git checkout develop
```

### Schritt 3: Neueste Änderungen abrufen
```bash
git pull
```

### Schritt 4: Feature-Branch erstellen
```bash
git checkout -b feature/xyz
```
Ersetze `xyz` mit einer aussagekräftigen Bezeichnung (z.B. `login`, `api`, `notifications`).

### Schritt 5: Arbeiten an dem Feature
Bearbeite die Dateien und entwickle dein Feature.

### Schritt 6: Änderungen committen
```bash
git add .
git commit -m "Aussagekräftige Commit-Nachricht"
```

### Schritt 7: Feature-Branch pushen
```bash
git push -u origin feature/xyz
```

### Schritt 8: Pull Request erstellen
Gehe auf GitHub und erstelle einen Pull Request, um deine Änderungen in den `develop`-Branch zu mergen.

### Schritt 9: Lösche deinen feature branch

achte darauf das Github Repo für alle sauber zu halten, sonst verliert man die Übersicht
---

## Tipps für gute Commits

- Verwende aussagekräftige Commit-Nachrichten (z.B. "Add login endpoint" statt "fix")
- Committe kleine, logische Einheiten statt großer Änderungen auf einmal
- Führe `git pull` durch, bevor du pushst, um Konflikte zu minimieren
