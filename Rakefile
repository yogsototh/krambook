#!/usr/bin/env ruby
# encoding: utf-8

require 'rake/clean'

CLEAN.include('**/*.{aux,log,out}')
CLEAN.include('tmp/**/*')
CLOBBER.include('**/*.pdf')
CLOBBER.include('content/**/*.tex')

task :default => [:compile]

task :compile do
    require 'rubygems'
    require 'kramdown'
    require 'filters/markdown_macros'
    require 'filters/mkd_post_latex_macros'

    class KrambookCompile
        require 'config.rb'

        attr_accessor :filelist

        # take a string from kramdown 
        # returns LaTeX after filter
        def compile_text(tmp)
            @prefilters.each do |f| 
                tmp=f.run( tmp )
            end

            # compile to latex
            tmp=Kramdown::Document.new(tmp, :latex_headers => %w(chapter section subsection paragraph subparagraph subsubparagraph)).to_latex

            # post filters
            @postfilters.each{ |f| tmp=f.run(tmp) }
            return tmp
        end

        def process_template
            template=File.new(@templateFile,"r")
            txt=template.read
            template.close

            txt.sub!( /%%#INCLUDES#%%/ ) do
                    @filelist.map do |source,dest| 
                        "\\include{#{dest.sub(/^tmp\//,'').sub(/.tex/,'')}}"
                    end.join("\n")
                end.
                sub!(%{\\author\{\}},'\author{'+@author+'}').
                sub!(%{\\title\{\}},'\title{'+@title+'}')
            fic=File.new("tmp/#{@pdfname}.tex","w")
            fic.write(txt)
            fic.close
        end

        def initialize

            eval File.new('config.rb','r').read

            @prefilters=[]
            @prefilters<<=MarkdownMacros.new

            @postfilters=[]
            @postfilters<<=MarkdownPostLatexMacros.new

            @filelist=Dir.glob("content/**/*.md").sort.map do |fic|
                    [ fic, fic.sub(/^content\//,"tmp/").sub(/.md$/,".tex") ]
                end
        end

        def run
            @filelist.each do |doublon|
                source=doublon[0]
                dest=doublon[1]
                puts source

                # read and compile in LaTeX the .md file
                text=compile_text( File.new(source,"r").read )

                # create directory if necessary
                if not FileTest::directory?(File.dirname(dest))
                    FileUtils.mkdir_p(File.dirname(dest)) 
                end

                # write the .tex file
                fic = File.new(dest,"w")
                fic.write(text)
                fic.close

            end

            # write the .tex file containing all includes
            process_template

            # launch the xelatex process
            system("cp -rf include tmp/")
            system("cd tmp; xelatex #{@pdfname}; cd ..")
            # on Ubuntu replace by
            # system("gnome-open #{@pdfname}.pdf")

            # make a symbolic link in order to
            # let the tempory files into tmp/
            if not FileTest::exists?("#{@pdfname}.pdf")
                system("ln -s tmp/#{@pdfname}.pdf #{@pdfname}.pdf")
            end

            # open the pdf
            system("open tmp/#{@pdfname}.pdf")
        end
    end
    KrambookCompile.new.run
end
