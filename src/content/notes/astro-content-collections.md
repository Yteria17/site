---
title: Astro Content Collections
date: 2026-04-24
tags: [astro, web]
---

Les Content Collections d'Astro permettent de typer et valider du contenu markdown.

## Principe

Chaque collection est definie dans `src/content.config.ts` avec un schema Zod.
Les fichiers `.md` dans `src/content/<collection>/` sont automatiquement valides.

## Avantages

- Typage TypeScript complet
- Validation au build (erreur si frontmatter manquant)
- Tri, filtrage facilite cote composant
