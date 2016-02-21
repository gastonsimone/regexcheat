# Regular Expressions Cheatsheet

After reading the great book [Mastering Regular
Expressions](http://regex.info/book.html) by Jeffrey Friedl, I tried to find
a good cheatsheet about regular expressions, but I could not find one showing
all the things I wanted to remember, or have at hand, from this book. So
I wrote my own.

## Download

You can get the latest version of the document [here](https://raw.githubusercontent.com/gastonsimone/regexcheat/master/regex.pdf).

## More than a cheatsheet

You will see it is not just a cheatsheet, as it brings more useful information for quick reference.
The document is divided in the following sections:

1. **Basics** (a cheatsheet)
2. **Advanced** (another cheatsheet)
3. **Special Characters** (another, very specific, cheatsheet)
4. **Examples** (two pages of very useful examples for real-life problems)
5. **Usage in Programming Languages and Tools** (examples on different languages and tools)

If you want to really understand what is shown in this document (and much more!) you have to read Friedl's book.

## Build the document yourself

After cloning this repository, you will need the following tools to build the document:

* [make](https://en.wikipedia.org/wiki/Make_%28software%29) (You will need the [GNU version](https://www.gnu.org/software/make/make.html), which is the default in GNU/Linux and Mac OS X)
* [sed](https://en.wikipedia.org/wiki/Sed) (both GNU and BSD versions should work)
* [TeXLive](https://www.tug.org/texlive/)

Once you have all this, just run:

```
make clean
make
```
