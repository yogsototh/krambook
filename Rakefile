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

    pdfname="my_book"
    
    prefilters=[]
    prefilters<<=MarkdownMacros.new
    
    postfilters=[]
    postfilters<<=MarkdownPostLatexMacros.new

    include_list=[]
    Dir.glob("content/**/*.md").each do |file|
        text=""
        puts file
        tmp=File.new(file,"r").read
        # pre filters
        prefilters.each do |f| 
            tmp=f.run( tmp )
        end
        text <<= tmp

        # puts '==== BEGIN BEFORE LATEX ===='
        # puts text
        # puts '==== END BEFORE LATEX ===='

        # compile to latex
        tmp=Kramdown::Document.new(text,:latex_headers => %w(chapter section subsection paragraph subparagraph subsubparagraph)).to_latex

        # puts '==== BEGIN AFTER LATEX ===='
        # puts tmp
        # puts '==== END AFTER LATEX ===='

        # post filters
        postfilters.each{ |f| tmp=f.run(tmp) }

        # write 
        # create tex associated to md
        ficname="tmp/"+file.sub(/.md$/,'.tex')
        include_list <<= ficname.sub(/.tex$/,'')
        if not FileTest::directory?("tmp")
            Dir.mkdir("tmp")
        end
        Dir.mkdir(File.dirname(ficname))if not FileTest::directory?(File.dirname(ficname))
        fic = File.new(ficname,"w")
        fic.write( tmp )
        fic.close
    end
   
    template=File.new('template.tex',"r")
    txt=template.read
    template.close

    txt.sub!( /%# COMPILED CONTENT #%/ ) do
        include_list.map { |f| "\\include{#{f}}\n" }.join("\n")
    end
    fic=File.new("#{pdfname}.tex","w")
    fic.write(txt)
    fic.close

    system("xelatex #{pdfname}")
    # on Ubuntu replace by
    # system("gnome-open #{pdfname}.pdf")
    system("open #{pdfname}.pdf")
end
