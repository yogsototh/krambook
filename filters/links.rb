class Links
    def run (content)
        content.gsub(/(<a [^>]*href="(.)[^>]*>)(.*?)(<\/a>)/) do
            if $2 == '#'
                $&
            else
                $1+$3+%{<sup><sub>*</sub></sup>}+$4
            end
        end
    end
end
