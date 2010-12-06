MACRO(markdown) = `markdown` ENDMACRO
MACRO(kramdown) = [`kramdown`](http://kramdown.rubyforge.org) ENDMACRO
MACRO(krambook) = [`krambook`](http://krambook.espozito.com) ENDMACRO

MACRO(beginbox) = {::nomarkdown type="latex"}\medskip\fbox{\colorbox{boxcolor}{\begin{minipage}{.80\linewidth}% {:/nomarkdown} {::nomarkdown type="html"}<div class="encadre"> {:/nomarkdown} ENDMACRO

PYOSTMACRO(beginbox) = LATEX: \medskip\fbox{\colorbox{boxcolor}{\begin{minipage}{.80\linewidth}% HTML: <div class="encadre"> ENDMACRO

POSTMACRO(endbox) = LATEX: \end{minipage}}}\medskip HTML: </div> ENDMACRO


POSTMACRO(tex) = LATEX: \ytex HTML: <span style="text-transform: uppercase">T<sub style="vertical-align: -0.5ex; margin-left: -0.1667em; margin-right: -0.125em; font-size: 1em">e</sub>X</span> ENDMACRO

POSTMACRO(latex) = LATEX: \ylatex HTML: <span style="text-transform: uppercase">L<sup style="vertical-align: 0.15em; margin-left: -0.36em; margin-right: -0.15em; font-size: .85em">a</sup>T<sub style="vertical-align: -0.5ex; margin-left: -0.1667em; margin-right: -0.125em; font-size: 1em">e</sub>X</span> ENDMACRO

POSTMACRO(xelatex) = LATEX: \yxelatex HTML: <span style="text-transform: uppercase">X<sub style="vertical-align: -0.5ex; margin-left: -0.1667em; margin-right: -0.125em; font-size: 1em">&#x018E;</sub>L<sup style="vertical-align: 0.15em; margin-left: -0.36em; margin-right: -0.15em; font-size: .85em">a</sup>T<sub style="vertical-align: -0.5ex; margin-left: -0.1667em; margin-right: -0.125em; font-size: 1em">e</sub>X</span> ENDMACRO

