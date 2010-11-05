# Add macros to Markdown
#
# Here is a %test.
#
# you could add a macro like this
#
# filter.macro={
#   :latex => %{\LaTeX}
# }
#
# or within the markdown file by
#
# %%% macro_name %%% macro_value %%%
#

class MarkdownPostLatexMacros
    attr_accessor :macro
    def initialize()
        super
        @macro={}
    end

    def macro_value_for(ident)
        return '%' if ident.nil? or ident==""
        ident=ident.intern
        return %{%#{ident}} if @macro[ident].nil?

        if @macro[ident] =~ /ruby: ((.|n)*)/m
            return eval $1
        else
            return @macro[ident]
        end
    end

    def run (content)
        content.gsub(/^LLL (\w*) LLL ((.|\n)*?) LLL/m) do |m| 
            name=$1
            value=$2
            puts %{  ltx macro %#{name}\t=> #{value}}
            value=value.gsub(/\\textbackslash\{\}/,'\\').
                gsub(/\\%/,'%').
                gsub(/\\\{/,'{').
                gsub(/\\\}/,'}')
            puts %{  ltx macro %#{name}\t=> #{value}}
            @macro[name.intern]=value
            ""
        end.gsub(/((\\textbackslash\{\})?)\\%(\w*)/) do |m| 
            puts "  ltx macro MATCH: 1. #{$1} 2. #{$2} 3. #{$3}"
            if $3 != "" 
                if $1 == ""
                    macro_value_for($3)
                else
                    %{\\texttt{\\%#{$3}}}
                end
            else
                m
            end
        end
    end
end
