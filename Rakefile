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

        # compile to latex
        tmp=Kramdown::Document.new(text,:latex_headers => %w(chapter section subsection paragraph subparagraph subsubparagraph)).to_latex

        # post filters
        postfilters.each{ |f| tmp=f.run(tmp) }

        # write 
        # create tex associated to md
        ficname="tmp/"+file.sub(/.md$/,'.tex').sub(%r{^content/},'')
        include_list <<= ficname.sub(/.tex$/,'')
        Dir.mkdir("tmp") if not FileTest::directory?("tmp")
        tmpficdir=File.dirname(ficname)
        FileUtils.mkdir_p(tmpficdir) if not FileTest::directory?(tmpficdir)
        fic = File.new(ficname,"w")
        fic.write( tmp )
        fic.close
    end
   
    template=File.new('template.tex',"r")
    txt=template.read
    template.close

    txt.sub!( /%# COMPILED CONTENT #%/ ) do
        include_list.sort.map { |f| "\\include{#{f}}\n" }.join("\n")
    end
    fic=File.new("#{pdfname}.tex","w")
    fic.write(txt)
    fic.close

    system("xelatex #{pdfname}")
    # on Ubuntu replace by
    # system("gnome-open #{pdfname}.pdf")
    system("open #{pdfname}.pdf")
end
