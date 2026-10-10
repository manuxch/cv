# Curriculum Vitae

Fuentes LaTeX de mi CV (compilado con LuaLaTeX + biber). Los PDF **no** se versionan: los genera GitHub Actions en cada push a `master` y se publican en GitHub Pages.

| Versión | Fuente | PDF publicado |
|---|---|---|
| Completa (es) | `MC-cv.tex` | https://manuxch.github.io/cv/cv.pdf |
| Breve (es) | `MC-cv-breve.tex` | https://manuxch.github.io/cv/cv-breve.pdf |
| Short (en) | `MC-cv-short-eng.tex` | https://manuxch.github.io/cv/cv-short-en.pdf |

Índice: https://manuxch.github.io/cv/ · Versiones fechadas: pestaña *Releases* (se crean al etiquetar `vYYYY.MM`).

## Compilar localmente

Requiere `lualatex`, `biber`, `latexmk` y las fuentes Linux Libertine O, Gentium Basic, TeX Gyre Pagella y DejaVu Sans Mono.

```bash
make          # las tres versiones, salida en build/
make cv       # sólo la completa (breve, eng)
make clean
```

## Dónde editar (una sola fuente por dato)

- **Artículos:** `articulos.tex` (una línea `\art{año}{clave}` por artículo). Las tres versiones lo leen; la breve y la inglesa filtran por `\cvminyear` (años desde el cual listar).
- **Referencias:** `publicaciones.bib`, `congresos.bib`.
- **Estilo y bloques compartidos** (idioma, pies de página, libro, colofón): `preamble.tex`. El idioma se elige con `\def\cvlang{english}` antes de `\input{preamble}`.
- Las secciones traducidas (`datosPersonales.tex` / `personalData.tex`, etc.) son textos distintos por idioma y se editan por separado.

## Publicar una actualización

```bash
git commit -am "Actualización" && git push      # actualiza Pages
git tag v2026.10 && git push --tags             # además crea un Release con los 3 PDF
```
