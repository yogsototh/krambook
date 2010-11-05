# Introduction
LLL latex LLL \LaTeX LLL
LLL tldr LLL {\em Too long don't read\;: } LLL
%%% multiline %%% a  
multiline  
macro %%%
%%% ruby %%% ruby: "a"*3 %%%
%%% complex %%% ruby: (1..5).map do |x| 
x*x 
end.join(" : ") %%%

%tldr A simple demonstration of how macros are working.

With %multiline

The output should be in %latex &nbsp; and 
was compile from markdown-like format.

- Simple list ;
- Example ;
- Another one item.

~~~~~
Hello there

this is some code block
~~~~~

%latex
: Some %latex definition

A simple math mode $$x_i$$ and a protected one \$$x_i\$$.
A long formula now:

$$ \sum_{i=0}^n\sqrt{x_i + y_i} $$

Even with some ruby code inside:

Here is the result of the \%ruby macro:

%ruby

and a more complex one:

%complex
