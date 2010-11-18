# Install

If you are reading these lines 
chances are great that your system contains all necessary packages.
But here are the dependencies:

- ruby,
- rake,
- %kramdown[^1]

Optionally you'll need:

- %latex (more precisely %xelatex) to generate PDF output, 
- MathJax to draw correctly math formulae inside HTML website,
- `pdf2svg` to generate the SVG oriented website.

[^1]: %kramdown is an amelioration of the original markdown format.

1. You'll need to install ruby and rake. 
They should be present on your system. 
But if you are using Ubuntu the following command line should be enough:

    [Ubuntu]> sudo apt-get install ruby rake

2. In order to install the %kramdown gem:

    > gem install kramdown

3. To install %xelatex, I suggest you to use [TexLive](http://www.tug.org/texlive/) full install to be certain not lacking anything. 
Of course you are free to use any other distribution that suit you better.

4. Download [MathJax](http://www.mathjax.org)

5. Finally Download the [source code](http://github.com/yogsototh/krambook) and copy the MathJax directory into `site/js/`. 

Verify if all work correctly by running:

    > rake
    > rake html

Congratulation you are ready.

# First steps

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

These transformations will occur on the markdown file before it is transformed in %latex.

You can also declare macro that will be processed after the file was transformed in %latex or in HTML.

<pre>
    &#x004c;LL tex LLL \TeX LLL TeX HTML
    &#x004c;LL tex_ LLL \TeX{} LLL TeX  HTML
</pre>

In markdown, you simply write \%macroname or \%code
and it will be transformed correctly in your pdf.

