%%% markdown %%% `markdown` %%%
%%% kramdown %%% [`kramdown`](http://kramdown.rubyforge.org) %%%
LLL xelatex LLL \XeLaTeX LLL
LLL xelatex_ LLL \XeLaTeX{} LLL
LLL latex LLL \LaTeX LLL
LLL latex_ LLL \LaTeX{} LLL
LLL tex LLL \TeX LLL
LLL tex_ LLL \TeX{} LLL

# Write Books like a Hacker

Quality and scalability of %xelatex_ _&amp;_ readable as %markdown.

Idea
: provide macros for %markdown then transform the text in %latex_ and generate a `pdf` file.

Why not using %latex_ directly?
: Simply because %latex_ is verbose and full of backslashes. 
To prove my point, simply compare a %latex_ and a %markdown file.

%latex:

~~~

\documenttype{article}
\usepackage[utf-8]{inputenc}
\usepackage{fontenc}
\usepackage{amsmath}

... % This is the ritual header

\begin{document} % ---- end of the preamble
I begin by making a list of bullet points:
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

%markdown:

~~~
This is a test file
I begin by making a list of bullet points:

- the first point is LaTeX is a bit verbose
- the second point is LaTeX has _more_ \ than Markdown
- I believe you understood now
~~~
{:lang="HTML"}

Both file will be generated as:

LLL beginbox LLL \medskip\fbox{\colorbox{boxcolor}{\begin{minipage}{.80\linewidth}% LLL
LLL endbox LLL \end{minipage}}}\medskip LLL

%beginbox

This is a test file
I begin by making a list of bullet points:

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

And many others.  Yes, %latex_ _rocks_.

# Install

If you are reading these lines chances are great that your system contains all necessary packages.
But to resume you have to install:

- %latex (more precisely Xe%latex), 
- ruby,
- rake and
- %kramdown[^1]. 

[^1]: %kramdown is an amelioration of the original markdown format.

To install Xe%latex, I suggest you to use [TexLive](http://www.tug.org/texlive/) full install? 
But of course you are free to use any other distribution.

You'll need to install ruby and rake. 
They should be present on your system, but just in case:

    [Ubuntu]> sudo apt-get install ruby rake
    [Mac OS X]> sudo port install ruby rake

In order to install the %kramdown gem:

    gem install kramdown

Finally Download this source code and your installation should be over.

# How do I write a book using it?

- Edit the `config.rb` file (set title, author name and pdf filename)
- Create and write files in the `content` folder.  You should write them using the [kramdown](http://kramdown.rubyforge.org/) format. Very close to the %mardown format.
- run `rake` (or `rake compile`) to create and show a `.pdf` file.

Remark: 
: by default file are sorted by name.  I suggest you to name your files and folder with number prefixes.  For example like `00_intro.md`, `01_section/01_subsection.md`, etc...  You can make a bit of `ruby` (search `@filelist` in the `Rakefile` file) to change this behaviour.

Of course there is also a

    rake clean

and

    rake clobber

# Macros

Now you can write the content of your book mostly in %kramdown format.
But with some simple additions: _macros_.

Remark:
: For now Krambook accept only macros _without_ any parameter. Here are some examples:

~~~
    %%% simple %%% A Simple Macro %%%
    %%% amacro %%% a  
                        macro  
                        on many lines %%%
    %%% code %%% ruby: "a"*3 %%%
    %%% complex %%% ruby: (1..5).map do |x|
                    x*x
                    end.join(" : ") %%%
~~~

These transformations will occur on the markdown file before it is transformed in LaTeX.

You can also declare macro that will be processed after the file was transformed in LaTeX.

    LLL latex LLL \LaTeX LLL
    LLL latex_ LLL \LaTeX{} LLL

In markdown, you simply write \%macroname or \%code
and it will be transformed correctly in your pdf.

