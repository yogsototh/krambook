# What is this project?

This project intends to provide you a cool way to write a book.
You write your book using your editor of choice using a [markdown]() syntax. 
The book can then be generated as PDF using [XeLaTeX]() or to an [HTML website]().

# Why this project?


## Markdown is easier to read than LaTeX

The best typesetting system I know is [LaTeX](http://latex-project.org).
Unfortunately LaTeX was created a long time ago and its syntax is full of backslashes. Here is an example of a standard minimal LaTeX document:

    
    \documenttype{article}
    \usepackage[utf-8]{inputenc}
    \usepackage{fontenc}
    \usepackage{amsmath}
    
    ... % This is the ritual header
    
    \begin{document} % ---- end of the preamble
    \section{First section}
    I begin by making a list of bullet points:
    \begin{itemize}
    \item the first point is 
        \LaTeX is a bit verbose
    \item the second point is 
        \Latex has \textem{more} \textbackslash{} than Markdown
    \item I believe you understood now.
    \end{itemize}
    \end{document}

Now a markdown file to render with the same meaning:

    First section
    =============

    I begin by making a list of bullet points:
    
    - the first point is LaTeX is a bit verbose
    - the second point is LaTeX has _more_ \ than Markdown
    - I believe you understood now

The HTML end result using the markdown will be:


> First section
> =============
> 
> I begin by making a list of bullet points:
> 
> - the first point is LaTeX is a bit verbose
> - the second point is LaTeX has _more_ \ than Markdown
> - I believe you understood now

Then I believe I don't have to convince more you that the markdown syntax is more natural than the LaTeX one.

## Markdown does not scale

LaTeX has many incredible properties that makes it scalable even for very long document.
On the other hand Markdown wasn't created for this purpose.
Markdown was done to provide a standard syntax to transform some text file into HTML.
Markdown lack many features that many other project have added to it.
One of this project is [Kramdown]().
There is many other project that expanded the abilities of Markdown.

But I believe not any of these project is scalable because the power of these language is _stricly_ inferior to the power of the TeX language.
In fact TeX is Turing complete -- considering we have the ability to make many compilations until reaching a fixed point.

How can LaTeX be Turing complete?
Simply with the power of provided by _macros_. 
In LaTeX you can declare macros like this:

    \newcommand{\un}{\sum_{n=0}^\infty u_n}

And each time you type:

    Here is a formula $\un = \pi$

It will be equivalent to:

    Here is a formula $\sum_{n=0}^\infty u_n = \pi$

Imagine a thesis where this formula is present a hundred times and you begin to understand why macros are a necessity for long documents.
But in LaTeX you could also declare macros with parameters and that use other declared macros:

    \newcommand{\ratlang}[2]{\mathcal{S}_{#1}^{\mathrm{rat}}(#2)}
    \newcommand{\sr}[2]{\ratlang{\mathbb{R}}(\Sigma)}
    ...
    Let us denote $\sr$ the class of rationnal stochastic language over $\mathbb{R}$ with alphabet $\Sigma$. 

Now you see the power of LaTeX.

There is also another thing that make LaTeX scalable. You can include other source files. This make it easy to separate work and also to work with many other people.

Another good point with LaTeX and markdown is that you write only in text file and you can then version these file using `git` for example.

The point of this project is to add the ability to write macros in Markdown (kramdown to be more precise).
For now, the power of this superset of kramdown syntax is _not_ Turing complete.
You can declare macros, but without any parameters and you cannot use already declared macros inside other macros declaration.

# FAQ

### What is the idea of the project?

provide macros for Markdown then transform the text in Latex and generate a `pdf` file.

### Why not using LaTeX directly?

Simply because LaTeX is verbose and full of backslashes. 
To prove my point, simply compare a LaTeX and a Markdown file.

LaTeX:

    
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

Markdown:

    I begin by making a list of bullet points:
    
    - the first point is LaTeX is a bit verbose
    - the second point is LaTeX has _more_ \ than Markdown
    - I believe you understood now

Both file will be generated as:

> I begin by making a list of bullet points:
> 
> - the first point is LaTeX is a bit verbose
> - the second point is LaTeX has _more_ \ than Markdown
> - I believe you understood now

### Why macros are so necessary for long documents?

Because without them, Markdown simply does not scale. For example imagine you can't declare `\su` to be generated as $$\sum_{n=0}^{\infty} u_n$$ in a thesis where this expression is repeated 1000 times.

# Install

If you are reading these lines, chances are great that your system contains all necessary packages.
But to resume you have to install:

- LaTeX (more precisely XeLaTeX), 
- ruby,
- rake and
- %kramdown[^1]. 

[^1]: %kramdown is an amelioration of the original markdown format.

To install XeLaTeX, I suggest you to use [TexLive](http://www.tug.org/texlive/) full install? 
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
- Create and write files in the `content` folder.  You should write them using the [kramdown](http://kramdown.rubyforge.org/) format. Very close to the Mardown format.
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

__Remark:__
for now Krambook accept only macros _without_ any parameter. Here are some examples:

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

In markdown, you simply write %macroname or %code
and it will be transformed correctly in your pdf.

# HTML render

To render math properly install MathJax into the `site/js` directory
