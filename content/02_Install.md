# Install

## Prerequisite

If you are reading these lines 
chances are great that your system contains all necessary packages.
But here are the dependencies:

- ruby,
- rake,
- %kramdown[^1]

Optionally you'll need:

- %latex (more precisely %xelatex) to generate PDF output, 
- `pdf2svg` to generate the SVG oriented website.

[^1]: %kramdown is an amelioration of the original markdown format.

## The steps

1. You'll need to install ruby and rake. 
They should be present on your system. 
But if you are using Ubuntu the following command line should be enough:
    <pre>[Ubuntu]> sudo apt-get install ruby rake</pre>

2. In order to install the %kramdown gem:
   <pre>> gem install kramdown</pre>

3. To install %xelatex, I suggest you to use [TexLive](http://www.tug.org/texlive/) full install to be certain not lacking anything. 
Of course you are free to use the install you prefer.

Verify if all work correctly by running:

    > rake
    > rake html

Congratulation you are ready.

