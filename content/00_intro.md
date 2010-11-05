# Introduction

%%% multiline %%% a  
multiline  
macro %%%
%%% ruby %%% ruby: "a"*3 %%%
%%% complex %%% ruby: (1..5).map do |x| 
x*x 
end.join(" : ") %%%
LLL latex LLL \LaTeX LLL
LLL tldr LLL {\em Too long don't read: } LLL

It is a simple demonstration of how macros are working.
They were declared inside the markdown like this:

     %%% multiline %%% a  
     multiline  
     macro %%%
     %%% ruby %%% ruby: "a"*3 %%%
     %%% complex %%% ruby: (1..5).map do |x| 
     x*x 
     end.join(" : ") %%%
     LLL latex LLL \LaTeX LLL
     LLL tldr LLL {\em Too long don't read: } LLL


Now if I write:

> \%tldr A simple demonstration of how macros are working.

It renders as:

> %tldr A simple demonstration of how macros are working.

The \%multine macro render as:

> %multiline

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

A simple math mode $$x_i$$ and a protected one \$$x_i\$$.
A long formula now:

$$ \sum_{i=0}^n\sqrt{x_i + y_i} $$

Even with some ruby code inside:

Here is the result of the \%ruby macro:

%ruby

and a more complex one:

%complex
