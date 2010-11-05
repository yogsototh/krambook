# Write books like a hacker

Imagine Markdown with the power and quality of LaTeX.

This is what this simple project try to achieve.
You can declare macros directly in markdown:

    %%% macroname %%% a \LaTeX macro value %%%
    
    %%% anotherone %%% a \linebreak
                        macro \linebreak
                        on many lines %%%
    
    %%% code %%% ruby: "a"*3 %%%
    
    %%% complex %%% ruby: (1..5).map do |x|
    x*x
    end.join(" : ") %%%

In markdown, you simply write %macroname,
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
