quarto-example
====================================

[![pages build & deploy](https://github.com/rreece/quarto-example/actions/workflows/pages.yml/badge.svg)](https://github.com/rreece/quarto-example/actions/workflows/pages.yml)


Easy way to compile markdown into scholarly documents, html or pdf

This project is meant to make writing easier and more productive.


What this is for
----------------------------------

So you want to write a document.
Maybe you'll share it on the web.
Maybe you want a polished pdf. 
Maybe it's a blog, research paper, book draft, or just a set of notes.
You don't want to think about typesetting details.
You just want to throw your ideas in some plain text files and call `make`.

This is a starter template for using [quarto](https://quarto.org/),
following the quarto
[Get Started](https://quarto.org/docs/get-started/hello/text-editor.html).
It seems to achieve a lot of what I was trying to do with my
similar projects,
[markdown-memo](https://github.com/rreece/markdown-memo) and
[markdown-easy](https://github.com/rreece/markdown-easy):
*make technical and scholarly writing easier and more productive*.

This package makes it very easy to compile text taken in
[Markdown](https://daringfireball.net/projects/markdown/)
to valid xhtml or to a pdf via LaTeX.
It can be used to make static websites quickly,
for example (this site):    
<https://rreece.github.io/quarto-example/>

This same document compiled to a pdf can be found here:    
<https://rreece.github.io/quarto-example/Quarto-Example.pdf>


Quick start
----------------------------------

### Installation

TODO

```
TODO
```


### Setting up a new document

TODO

```
TODO
```


### Compile to html

Just call

```
make
```


### Compile to pdf

Just call

```
make pdf
```


TODOs
----------------------------------

Documentation:

- [ ] Finish Quick start in this README

Build:

- [x] GitHub Actions for testing for build artifacts before deployment
- [x] Change GitHub Actions to use this Makefile
- [ ] Conditionally build different parts of the document 
- [ ] Automatically get Makefile variables from `_quarto.yml`
- [ ] Make bibliography optional
- [ ] Makefile target for starting a new document
- [ ] Make it easy to create a small single page doc

Rendering issues:

- [ ] [Issue](https://github.com/quarto-dev/quarto-cli/issues/2275) with labeling equation in `align` for pdf

Style:

- [x] Add `_quarto.yaml` settings for custom css
- [ ] Add `_quarto.yaml` settings for latex styling
- [ ] Polish book pdf output


Note these quarto issues
----------------------------------

-   https://github.com/quarto-dev/quarto-cli/issues/2275
-   https://github.com/quarto-dev/quarto-cli/discussions/10477
-   https://github.com/quarto-dev/quarto-cli/discussions/6107


See also
----------------------------------

Quarto links:

-   [quarto.org](https://quarto.org/) - [Guide](https://quarto.org/docs/guide/) - [Reference](https://quarto.org/docs/reference/)
-   [quarto example using math](https://github.com/quarto-dev/quarto-examples/tree/main/html-math)
-   [quarto using bibtex and CSL](https://github.com/quarto-dev/quarto-examples/tree/main/appendix-csl)
-   [quarto doc about github-pages](https://quarto.org/docs/publishing/github-pages.html)
-   [example `_quarto.yml`](https://github.com/quarto-dev/quarto-web/blob/main/_quarto.yml)

My projects:

-   [github.com/rreece/markdown-easy](https://github.com/rreece/markdown-easy)
-   [github.com/rreece/markdown-memo](https://github.com/rreece/markdown-memo)


Author
----------------------------------

Ryan Reece ([@rreece](https://github.com/rreece))         
Created: September 21, 2024

