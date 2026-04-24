#!/usr/bin/env bash
# Usage:
#   ./scripts/new.sh daily
#   ./scripts/new.sh note "titre de la note"
#   ./scripts/new.sh project "nom du projet"
#   ./scripts/new.sh paper "titre du papier"
#   ./scripts/new.sh idea "une idee"

set -e

TYPE=$1
TITLE=$2
DATE=$(date +%Y-%m-%d)

case "$TYPE" in
  daily)
    FILE="src/content/daily/${DATE}.md"
    if [ -f "$FILE" ]; then
      echo "Deja existant: $FILE"
      exit 0
    fi
    cat > "$FILE" <<EOF
---
date: ${DATE}
---

EOF
    echo "Cree: $FILE"
    ;;

  note)
    if [ -z "$TITLE" ]; then echo "Usage: $0 note <titre>"; exit 1; fi
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
    FILE="src/content/notes/${SLUG}.md"
    cat > "$FILE" <<EOF
---
title: ${TITLE}
date: ${DATE}
tags: []
---

EOF
    echo "Cree: $FILE"
    ;;

  project)
    if [ -z "$TITLE" ]; then echo "Usage: $0 project <titre>"; exit 1; fi
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
    FILE="src/content/projects/${SLUG}.md"
    cat > "$FILE" <<EOF
---
title: ${TITLE}
description: ""
date: ${DATE}
status: active
tags: []
---

EOF
    echo "Cree: $FILE"
    ;;

  paper)
    if [ -z "$TITLE" ]; then echo "Usage: $0 paper <titre>"; exit 1; fi
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
    FILE="src/content/papers/${SLUG}.md"
    cat > "$FILE" <<EOF
---
title: ${TITLE}
authors: []
date: ${DATE}
tags: []
---

EOF
    echo "Cree: $FILE"
    ;;

  idea)
    if [ -z "$TITLE" ]; then echo "Usage: $0 idea <titre>"; exit 1; fi
    SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
    FILE="src/content/ideas/${SLUG}.md"
    cat > "$FILE" <<EOF
---
title: ${TITLE}
date: ${DATE}
status: raw
---

EOF
    echo "Cree: $FILE"
    ;;

  *)
    echo "Types disponibles: daily, note, project, paper, idea"
    exit 1
    ;;
esac
