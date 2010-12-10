# Add macros to Markdown
#
# Here is a %test.
#
# you could add a macro
# within the markdown file by
#
# POSTMACRO(macro_name) = LATEX: latex code HTML: html code ENDMACRO
#

class MarkdownPostMacros
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
        content.gsub(/^POSTMACRO\((\w[a-zA-Z0-9_]*)\) = LATEX: ((.|\n)*?) HTML: ((.|\n)*?) ENDMACRO/m) do |m| 
            # puts %{  mkd macro %#{$1}\t [:latex] => #{$2} [:html] => #{$4}}
            @macro[$1.intern]='{::nomarkdown type="latex"}'+$2+'{:/nomarkdown}{::nomarkdown type="html"}'+$4+'{:/nomarkdown}'
            ""
        end.gsub(/((\\)?)%(\w[a-zA-Z0-9_]*)/) do |m| 
            # puts " mkd macro MATCH: 1. #{$1} 2. #{$2} 3. #{$3}"
            if $3 != "" 
                if $1 == ""
                    macro_value_for($3)
                else
                    '`%'+$3+'`'
                end
            else
                m
            end
        end
    end
end
