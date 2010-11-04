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

    pdfname="my_book"
    
    filters=[]
    filters<<=MarkdownMacros.new
    
    include_list=[]
    Dir.glob("content/**/*.md").each do |file|
        text=""
        puts file
        tmp=File.new(file,"r").read
        # pre filters
        filters.each do |f| 
            tmp=f.prefilter( tmp )
        end
        text <<= tmp

        # compile to latex
        tmp=Kramdown::Document.new(text).to_latex

        # post filters
        filters.each{ |f| tmp=f.postfilter(tmp) }

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
