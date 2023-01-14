# How to contribute

The goal is to build an open-source book about JavaScript functions for new users in the JavaScript ecosystem.
This book collects 50 useful, unknown, underrated JavaScript functions or stuff discovered, used, and learned during JavaScript's daily use.
Using frameworks daily (like React, Vue, and Svelte), sometimes the perception of the power of the language and the basic functionalities provided by the JavaScript core could be lost. I see that usually, I used to look at the framework documentation or look for a package in Packagist for the system, array, and string functions instead of using some core functionalities provided by the language.
The goal is to cover 100 functions (now we have 50 sections), so the goal is to create 50 new sections, and each section covers 1 specific function.

The functions are grouped into topics:

- System
- Array
- Variables and types
- String
- File
- Extra bonus chapter where I'm collecting some nice cheatsheet

Each function is explained with the description, and examples in markdown files in the `content` directory.

## The file name convention
In the `content` directory, we have all the Markdown files.
The filename has the structure:

- the first 2 digits are for the topic, 01 for the system functions, and 02 for the arrays function...
- the second group of 2 digits is progressive numbers for the topic
- chars to identify the topic (system, os, array).
- the "slugified" name of the function/section

For example, for the file **01-02_os_version.md** :
- `01`: (the first group of digits) is for system (operating system) functions
- `02`: is the progress number
- `os`: the topic (os is for the operating system)
- `version`: the function explained
- `md`: the extension


## Submit ideas or feature requests

* Take a look if your request is already there https://github.com/roberto-butti/50-drops-of-javascript/issues
* If it is not present, you can create a new one https://github.com/roberto-butti/50-drops-of-javascript/issues/new

## Submit your changes

If you want to submit a pull request, please send a [GitHub Pull Request to 50 drops of JavaScript](https://github.com/roberto-butti/50-drops-of-javascript/pull/new/main) with a clear list of what you've done (read more about [pull requests](https://help.github.com/articles/about-pull-requests)).


Please use "main" branch for pull request.