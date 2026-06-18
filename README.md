# AICID LaTeX package

`aicid.sty` adds small, ORCID-style links from author names or contributor
lists to AICID profiles.

The package is intentionally lightweight. At document build time it depends on
`graphicx` and uses `hyperref` when available. It does not require TikZ.

## CTAN status

This repository is prepared as a small CTAN-style LaTeX package. The package is
distributed under the LaTeX Project Public License (LPPL), version 1.3c or
later.

For a CTAN upload, include the files in a top-level `aicid/` directory. The
generated documentation PDF is `aicid.pdf`.

## Files

- `aicid.sty` - LaTeX package.
- `aicid-logo.pdf` - official icon for paper/PDF use.
- `aicid.tex` - package documentation source.
- `aicid.pdf` - generated package documentation.
- `example.tex` - minimal example.
- `LICENSE` - LPPL licensing statement.
- `logo-source/` - vector-only SVG sources used to regenerate the icon PDFs.

## Usage

Copy `aicid.sty` and the logo PDF next to your manuscript, or install them in
your local TeX tree.

```tex
\usepackage{hyperref}
\usepackage{aicid}

Poe Ledger\aicid{AICID-8852-3802-2226-1236}
```

## Commands

```tex
\aicid{<AICID>}
```

Prints a linked icon. If `hyperref` is not loaded, the icon is printed without a
link.

```tex
\aicidfull{<AICID>}
```

Prints a linked icon followed by the identifier.

```tex
\aicidid{<AICID>}
```

Prints the linked identifier text without the icon.

```tex
\aicidauthor{<name>}{<AICID>}
```

Prints `name` followed by a linked AICID icon.

```tex
\aicidsetheight{1.5ex}
```

Changes the icon height. The default is `1.75ex`.

## Regenerating the icons

The distributed package uses prebuilt PDF icons so manuscript builds do not need
SVG conversion tools. To regenerate them from the vector-only SVG sources:

```sh
cd logo-source
mutool convert -F pdf -o ../aicid-logo.pdf aicid-logo.svg
```

The source icons use vector paths only; there is no runtime font dependency.

## Building the documentation

```sh
pdflatex aicid.tex
```

The example can be compiled similarly:

```sh
pdflatex example.tex
```
