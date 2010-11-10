# Use this file to configure some general variables

@title='\Huge{\textbf{Krambook}}\\\\\\' + "\n" +
       '\small\textit{Write Books like an }'+
       '\texttt{UB3R 1337}\textit{ (Hacker)}'

@author="Yann Esposito"

# file name
@pdfname="krambook"

# LaTeX headers (before \begin{document})
@latex_headers=''

# Comment the following line if you haven't 
# Hoefler Text font installed on your system
@latex_headers<<='\setmainfont{Hoefler Text}'

# Use colors
@latex_headers<<='\usepackage{color}
                \definecolor{italiccolor}{rgb}{0.4,0.4,0.4}
                \definecolor{boxcolor}{rgb}{0.96,0.96,0.96}'

# Make italic and emphasis text gray
 @latex_headers<<='\renewcommand{\textit}[1]{\textcolor{italiccolor}{\it #1}}
                \renewcommand{\emph}[1]{\textcolor{italiccolor}{\em #1}}'

# change the template file in case latex_headers is not enough 
# Remember to not remove lines begining by %%#
# look at include/template.tex for example
@template_file="include/template.tex"

