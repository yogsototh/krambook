class MathJax
    def run (content)
        content.gsub(%r{<div class="math">((.|\n)*?)</div>}) do
            '$$'+$1+'$$'
        end
    end
end
