# Fix a problem with kramdown
#
# - {::nomarkdown}x{:/nomarkdown}
#
# will render badly
# therefore we will transform all
# of these form adding a return

class FixPostMacros
    def run (content)
        content.gsub(/(\s*[-+*]) (\{::nomarkdown(.|\n)*?\{:\/nomarkdown\})/m) do |m| 
            %{#{$1} <span>#{$2}</span>}
        end
    end
end
