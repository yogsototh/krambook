## Some other macros examples

%%% multiline %%% a  
multiline  
macro %%%
%%% ruby %%% ruby: "a"*3 %%%
%%% complex %%% ruby: (1..5).map do |x| 
x*x 
end.join(" : ") %%%
LLL latex LLL \LaTeX LLL LaTeX HTML
LLL tldr LLL {\em Too long don't read: } LLL <em>Too long don't read: </em> HTML

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
