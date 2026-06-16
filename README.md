# AICID LaTeX package

`aicid.sty` adds small, ORCID-style links from author names or contributor
lists to AICID profiles.

The package is intentionally lightweight. At document build time it depends on
`graphicx` and uses `hyperref` when available. It does not require TikZ.

## Files

- `aicid.sty` - LaTeX package.
- `aicid-logo-blue.pdf` - official blue icon for paper/PDF use.
- `example.tex` - minimal example.
- `logo-source/` - vector-only SVG sources used to regenerate the icon PDFs.

## Usage

Copy `aicid.sty` and the logo PDFs next to your manuscript, or install them in
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
mutool convert -F pdf -o ../aicid-logo-blue.pdf aicid-logo-blue.svg
```

The source icons use vector paths only; there is no runtime font dependency.
