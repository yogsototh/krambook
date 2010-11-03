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

class MarkdownMacros
    attr_accessor :macro
    def initialize()
        super
        @macro={}
    end

    def macro_value_for(macro_name)
        if macro_name.nil? or macro_name=="" or @macro[macro_name.intern].nil?
            return %{%#{macro_name}} 
        end
        return @macro[macro_name.intern]
    end

    def prefilter( content )
        content.gsub(/%%% (\w*) %%% ((.|\n)*?) %%%/m) do |m| 
            puts %{  macro %#{$1}\t=> #{$2}}
            @macro[$1.intern]=$2
            ""
        end
    end

    def postfilter(content)
        content.gsub(/\\%(\w*)/) do |m| 
            if m != "\\%"
                macro_value_for($1)
            else
                m
            end
        end
    end
end
