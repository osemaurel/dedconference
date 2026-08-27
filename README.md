# Masterclass — page de capture

Page de capture statique pour la masterclass gratuite du **samedi 5 septembre 2026, 20h00 GMT+1**
animée par Déodat CAPO-CHICHI. Objectif unique : le clic sur le bouton CTA.

## Contenu

| Fichier | Rôle |
|---|---|
| `index.html` | La page de capture (tout est dedans : HTML, styles, JS) |
| `mentions-legales.html` | Page vide à remplir — obligatoire pour la pub Meta / Google |
| `confidentialite.html` | Page vide à remplir — obligatoire pour la pub Meta / Google |
| `public/images/` | Les 55 images téléchargées depuis le CDN (plus aucun appel CloudFront) |
| `scripts/download-images.sh` | Re-télécharge les images depuis `temoignages-urls.txt` si besoin |
| `temoignages-urls.txt` | Les URLs d'origine, conservées pour référence |

## Stack

HTML statique + Tailwind CSS (CDN) + JavaScript vanilla. Aucun build, aucune dépendance à installer.

## Déploiement

Déposer le dossier tel quel sur Vercel, Netlify, GitHub Pages ou n'importe quel hébergeur statique.
Aucune configuration : `index.html` est à la racine.

Test en local :

```bash
python3 -m http.server 8000
# puis ouvrir http://localhost:8000
```

## À REMPLIR AVANT MISE EN LIGNE

1. ~~Lien WhatsApp~~ — **fait.** Les 4 boutons pointent vers
   `https://whatsapp.com/channel/0029VaZIERGHVvTWwpAVS31e` (chaîne « Free-lanceur 2.0 »).
2. **`[URL_ABSOLUE_DE_L_IMAGE_DE_PARTAGE]`** — 2 occurrences (`og:image`, `twitter:image`).
   Déposer l'image 1200x630 px dans `public/images/og-share.jpg`, puis mettre l'**URL absolue**
   (`https://tondomaine.com/public/images/og-share.jpg`). WhatsApp ignore les chemins relatifs.
3. ~~Meta Pixel~~ — **fait.** Pixel `2467456657098160` actif : `PageView` au chargement,
   et un événement `Lead` à chaque clic sur un bouton, avec l'emplacement du bouton
   (`hero`, `apprendre`, `temoignages`, `final`) en `content_category`.
4. **Google Analytics** — emplacement commenté dans le `<head>` de `index.html`.
5. **`mentions-legales.html`** et **`confidentialite.html`** — tous les `[À COMPLÉTER]`.

## Tracking des boutons

Chaque CTA porte un attribut `data-cta` : `hero`, `apprendre`, `temoignages`, `final`.

## Pourquoi `vercel.json` est indispensable

Le dépôt contient un dossier `public/`. Sans configuration, Vercel le prend
automatiquement pour le résultat d'une construction et publie **son contenu**
comme racine du site : `index.html` disparaît et toutes les pages renvoient 404.

`"outputDirectory": "."` force Vercel à servir la racine du dépôt.
**Ne pas supprimer ce fichier.**
