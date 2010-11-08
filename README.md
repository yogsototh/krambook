%%% markdown %%% `markdown` %%%
%%% kramdown %%% `kramdown` %%%
LLL latex LLL \LaTeX LLL
LLL latex_ LLL \LaTeX{} LLL
LLL tex LLL \TeX LLL
LLL tex_ LLL \TeX{} LLL

# Write Books like a Hacker

Quality and scalability of %latex_ _&amp;_ readable as %markdown.

Idea
: provide macros for %markdown then transform the text in %latex_ and generate a `pdf` file.

Why not using %latex_ directly?
: Simply because %latex_ is verbose and full of backslashes. 
To prove my point, simply compare a %latex_ and a %markdown file.

~~~

%--- LaTeX source file ----
\documenttype{article}
\usepackage[utf-8]{inputenc}
\usepackage{fontenc}
\usepackage{amsmath}

... % This is the ritual header

\begin{document}
This is a test file.
I begin by making a list of bullet:
\begin{itemize}
\item the first point is 
    \LaTeX is a bit verbose
\item the second point is 
    \Latex has \textem{more} \textbackslash{} than Markdown
\item I believe you understood now.
\end{itemize}
\end{document}
~~~
{:lang="TeX"}

~~~
This is a test file
I begin by making a list of bullet:

- the first point is LaTeX is a bit verbose
- the second point is LaTeX has _more_ \ than Markdown
- I believe you understood now
~~~
{:lang="HTML"}

The generated result will be almost the same:

LLL beginbox LLL \begin{minipage}{.80\linewidth}\hrule\medskip LLL
LLL endbox LLL \hrule\end{minipage}\medskip LLL

%beginbox

This is a test file
I begin by making a list of bullet:

- the first point is %latex_ is a bit verbose
- the second point is %latex_ has _more_ \ than Markdown
- I believe you understood now

%endbox

Why macros? 
: Because without them, %markdown simply does not scale. For example imagine you can't declare `\su` to be generated as $$\sum_{n=0}^{\infty} u_n$$ in a thesis where this expression is repeated 1000 times.

What makes %latex_ so excellent?
: 

- Advanced typography features,
- no bug: %tex_ has no more known bug since many years,
- scalable:
  - you can include many %latex files into one
  - you can create _macros_ that minimize mistake done by repeating pattern.
- equation done with latex are easy to create and render just impressively,
- versionnable: 
  - you use a text format that can be easily handled by most versionning system,
  - easy to work on the same document with many different people.

And many other reasons I can't write them all here.  Yes, %latex_ _rocks_.

# Installation

First, install %latex, ruby and the `kramdown`[^1] gem. 

[^1]: `kramdown` is an amelioration of the original markdown format.

- Download this source.
- Change the title of your document and the author name in the `template.tex` file.
- Create and write in `kramdown` format
- run `rake` (or `rake compile`) to create and show a `.pdf` file.

This proposition is already really good. You can version your book and separate each part of the book in different files organized in folders[^2].

[^2]: For now, files are ordered from their name. I then suggest you to name your files and folder with number prefixes.  For example like `00_intro.md`, `01_section/01_subsection.md`, etc... Of course it is easy to ameliorate this make a bit of `ruby` (search `sort` in the `Rakefile` file).

The inclusion is done _automagically_ using file name (you can change this make a bit of ruby inside the `Rakefile`).
But to have a really scalable solution, you need to have the ability to make macros in `kramdown`.

This is not a problem, I've done this. Here is how you can declare macros inside a `kramdown` file:

    %%% simple %%% A Simple Macro %%%
    %%% amacro %%% a  
                        macro  
                        on many lines %%%
    
    %%% code %%% ruby: "a"*3 %%%
    
    %%% complex %%% ruby: (1..5).map do |x|
    x*x
    end.join(" : ") %%%

These transformations will occur on the markdown file before it is transformed in LaTeX.

You can also declare macro that will be processed after the file was transformed in LaTeX.

    LLL latex LLL \LaTeX LLL
    LLL latex_ LLL \LaTeX{} LLL

In markdown, you simply write \%macroname or \%code
and it will be transformed correctly in your pdf.

# Install

You'll need to install ruby, rake (installed by default on most computer).

    [Ubuntu]> sudo apt-get install ruby rake

You'll also need a XeLaTeX installation (may I suggest [TexLive](www.tug.org/texlive/) full install?).

You'll also need the kramdown gem.

    gem install kramdown

And you should be ok to work.

# How do I write a book using it?

Write some file into content. Their format is the 
[kramdown](http://kramdown.rubyforge.org/) one (very close to Markdown)

Just run

    rake

Of course there is also a

    rake clean

and

    rake clobber

The inclusion of files is done naturally by `Dir[content/**/*.md]` . If you want a more versatile way of doing it, simply look at the Rakefile and do a bit of ruby to sort file as you wish.
