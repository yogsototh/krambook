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
        content.gsub(/^POSTMACRO\((\w(\w|\d|\\_)*)\) = LATEX: ((.|\n)*?) (HTML: (.|\n)*? )?ENDMACRO/m) do |m| 
            name=$1
            value=$3
            # puts %{  ADD LATEX MACRO: %#{name}\t=> #{value}}
            name.gsub!(/\\_/,'_')
            value=value.gsub(/\\textbackslash\{\}/,'\\').
                gsub(/\\textbar\{\}/,'|').
                gsub(/\\%/,'%').
                gsub(/\\_/,'_').
                gsub(/\\\{/,'{').
                gsub(/\\\}/,'}')
            # puts %{  ltx macro %#{name}\t=> #{value}}
            @macro[name.intern]=value
            ""
        end.gsub(/((\\textbackslash\{\})?)\\%(\w(\w|\d|\\_)*)/) do |m| 
            # puts "  ltx macro MATCH: #{$3}"
            if $3 != "" 
                if $1 == ""
                    macro_value_for($3.gsub(/\\_/,'_'))
                else
                    %{\\texttt{\\%#{$3}}}
                end
            else
                m
            end
        end
    end
end
