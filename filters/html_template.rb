require 'date'
class HTMLTemplate
    attr_accessor :template
    attr_accessor :title
    attr_accessor :subtitle
    attr_accessor :author
    attr_accessor :nextURL
    attr_accessor :prevURL
    attr_accessor :homeURL
    attr_accessor :html_headers
    def run (content)
        res=File.read(@template)
        res.gsub(/<!-- Content -->/) do
            content
        end.gsub(/<!-- Title -->/) do
            @title
        end.gsub(/<!-- Date -->/) do
            Date.today.to_s
        end.gsub(/<!-- Subtitle -->/) do
            @subtitle
        end.gsub(/<!-- Author -->/) do
            @author
        end.gsub(%{/NEXT_URL/}) do
            @nextURL
        end.gsub(%{<!-- NEXT_LINK -->}) do
            if @nextURL == '#'
                %{<a class="disable" href="#{@nextURL}">next&nbsp;<span class="nicer">»</span></a>}
            else
                %{<a href="#{@nextURL}">next&nbsp;<span class="nicer">»</span></a>}
            end
        end.gsub(%{/PREV_URL/}) do
            @prevURL
        end.gsub(%{<!-- PREV_LINK -->}) do
            if @prevURL == '#'
                %{<a class="disable" href="#{@prevURL}">prev&nbsp;<span class="nicer">»</span></a>}
            else
                %{<a href="#{@prevURL}"><span class="nicer">«</span>&nbsp;prev</a>}
            end
        end.gsub(%{/HOME_URL/}) do
            @homeURL
        end.gsub(%{<!-- HTML HEADERS -->}) do
            @html_headers
        end
    end
end
