#!/usr/bin/env bash
pandoc presentation.md --from="markdown+tex_math_single_backslash+tex_math_dollars+raw_tex" --to="latex" --output=presentation.pdf --pdf-engine=xelatex --include-in-header=layouts/ereader.tex