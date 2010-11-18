# Tutorial

## Firsts steps

I suppose you have a correct install of %latex.

If you had not yet verified try to launch the following:

    > rake

It should create a `krambook.pdf` file.

Now it is time to create your own book:

- Edit the `config.rb` file (set title, author name and the pdf filename)
- Create and write files in the `content` folder.  
  You should write them using the [kramdown](http://kramdown.rubyforge.org/) format. 
  Very close to the %mardown format.

  Remark: 
  : by default file are sorted by name.  I suggest you to name your files and folder with number prefixes.  For example like `00_intro.md`, `01_section/01_subsection.md`, etc...  You can make a bit of `ruby` (search `@filelist` in the `Rakefile` file) to change this behaviour.

- run `rake` (or `rake compile`) to create and show a `.pdf` file.
- run `rake html` and launch `unicorn` (`gem install unicorn`) then look at the website at `http://localhost:8080/`,
- run `rake clean` to remove temporary files,
- run `rake clobber` to remove all generated files


With just that you can already write a book.
You can make as many as file as you want. 
Every file of the form: `content/**/*.md` will be used to create the book.

## Macros

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

These transformations will occur on the markdown file before it is transformed in %latex.

You can also declare macro that will be processed after the file was transformed in %latex or in HTML.

<pre>
    &#x004c;LL tex LLL \TeX LLL TeX HTML
    &#x004c;LL tex_ LLL \TeX{} LLL TeX  HTML
</pre>

In markdown, you simply write \%macroname or \%code
and it will be transformed correctly in your pdf.

## Some other macros examples

MACRO(tldr) = Too long don't read ENDMACRO
MACRO(multiline) = a  
multiline  
macro ENDMACRO
MACRO(ruby) = ruby: "a"*3 ENDMACRO
MACRO(complex) = ruby: (1..5).map do |x| 
x*x 
end.join(" : ") ENDMACRO

POSTMACRO(latex) = LATEX: \LaTeX HTML: LaTeX ENDMACRO
POSTMACRO(tldr) = LATEX: {\em Too long don't read: } HTML: <em>Too long don't read: </em> ENDMACRO

It is a simple demonstration of how macros are working.
They were declared inside the markdown like this:

~~~
     %%% multiline %%% a  
                        multiline  
                        macro %%%
     %%% ruby %%% ruby: "a"*3 %%%
     %%% complex %%% ruby: (1..5).map do |x| 
                    x*x 
                    end.join(" : ") %%%
     LLL latex LLL \LaTeX LLL LaTeX HTML
     LLL tldr LLL {\em Too long don't read: } LLL <em>Too long don't read: </em> HTML
~~~

Now if I write:

> \%tldr A simple demonstration of how macros are working.

It renders as:

%beginbox

> %tldr A simple demonstration of how macros are working.

%endbox

The \%multine macro render as:

%beginbox

> %multiline

%endbox

The output should be in %latex &nbsp; and 
was compiled from a markdown-like format.

- Simple list ;
- Example ;
- Another one item.

~~~~~
Hello there

this is some code block
~~~~~

%latex
: Some %latex &nbsp; definition

A simple math mode $$x_i$$ and a protected one \$$x_i\$$
A long formula now:

$$ \sum_{i=0}^n\sqrt{x_i + y_i} $$

Even with some ruby code inside:

Here is the result of the \%ruby macro:

%beginbox

%ruby

%endbox

and a more complex one (\%complex):

%beginbox

%complex

%endbox
