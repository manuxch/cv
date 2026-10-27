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
make          # compila las tres versiones
make cv       # sólo la completa  -> build/MC-cv.pdf
make breve    # sólo la breve     -> build/MC-cv-breve.pdf
make eng      # sólo la inglesa   -> build/MC-cv-short-eng.pdf
make clean    # borra build/ y los auxiliares
```

Los PDF quedan en `build/` (ignorado por git), con los nombres de los `.tex`. `make` llama a `latexmk`, que corre `lualatex` y `biber` las veces necesarias, así que alcanza con un solo comando. La salida es la misma que la publicada en Pages, salvo los nombres (`cv.pdf`, `cv-breve.pdf`, `cv-short-en.pdf`).

Si el PDF queda con referencias sin resolver (`??`) tras un cambio raro, `make clean && make` fuerza una compilación desde cero.

## Dónde editar (una sola fuente por dato)

- **Artículos:** `articulos.tex` (una línea `\art{año}{clave}` por artículo). Las tres versiones lo leen; la breve y la inglesa filtran por `\cvminyear` (años desde el cual listar).
- **Línea temporal (años en el margen):** todo ítem con fecha va dentro de `\begin{timeline} … \end{timeline}` (o `ntimeline`, con numeración inversa, para listas de publicaciones). Cada ítem empieza con `\years{etiqueta}`; ítems consecutivos con la misma etiqueta se agrupan (año y punto grande sólo en el primero). Un `\textbf{…}` o subtítulo entre ítems requiere cerrar y abrir otro `timeline`. Dentro de un `timeline` no usar `\footnote` (se pierde).
- **Referencias:** `publicaciones.bib`, `congresos.bib`.
- **Estilo y bloques compartidos** (idioma, pies de página, libro, colofón): `preamble.tex`. El idioma se elige con `\def\cvlang{english}` antes de `\input{preamble}`.
- Las secciones traducidas (`datosPersonales.tex` / `personalData.tex`, etc.) son textos distintos por idioma y se editan por separado.

## Publicar una actualización

```bash
git commit -am "Actualización" && git push      # actualiza Pages
git tag v2026.10 && git push --tags             # además crea un Release con los 3 PDF
```
