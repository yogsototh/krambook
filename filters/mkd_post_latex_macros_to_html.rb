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

require "cgi"

class MarkdownPostLatexMacrosToHTML
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
        content.gsub(/(^<p>\s*)?POSTMACRO\((\w(\w|\d|\\_)*)\) = LATEX: ((.|\n)*?) (HTML: ((.|\n)*?) )?ENDMACRO((\s|\n)*<\/p>)?/m) do |m| 
            name=$2
            value=CGI::unescapeHTML($7).gsub("&rdquo;",'"')
            # puts "SAVE HTML MACRO: #{name} => #{value}"
            @macro[name.intern]=value
            ""
        end.gsub(/<p>(\s|\n)*(\\?)%(\w[a-zA-Z0-9_]*)(\s|\n)*<\/p>/m) do |m| 
            # puts "  ltx macro MATCH: #{$3}"
            protected=$2
            name=$3
            if name != "" 
                if protected == ""
                    macro_value_for(name)
                else
                    %{<code>%#{name}</code>}
                end
            else
                m
            end
        end.gsub(/(\\?)%(\w[a-zA-Z0-9_]*)/) do |m| 
            # puts "  ltx macro MATCH: #{$3}"
            protected=$1
            name=$2
            if name != "" 
                if protected == ""
                    macro_value_for(name)
                else
                    %{<code>%#{name}</code>}
                end
            else
                m
            end
        end
    end
end
