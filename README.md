## General informations
Robovim is a simple Vim plugin which allow easier add [Robodoc](https://rfsber.home.xs4all.nl/Robo/)
formatted documentation to a source code. At this moment supported programming
languages are: Ada, Vim, Python, Tcl and C. All programming languages with
C-like comments should generally works too. Additionally, it is easy to add
support for more programming languages.

## Installation

This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

| Plugin Manager | Install with... |
| ------------- | ------------- |
| [Pathogen](https://github.com/tpope/vim-pathogen) | `git clone https://github.com/thindil/robovim ~/.vim/bundle/robovim`<br/>Remember to run `:Helptags` to generate help tags |
| [NeoBundle](https://github.com/Shougo/neobundle.vim) | `NeoBundle 'thindil/robovim'` |
| [Vundle](https://github.com/VundleVim/Vundle.vim) | `Plugin 'thindil/robovim'` |
| [Plug](https://github.com/junegunn/vim-plug) | `Plug 'thindil/robovim'` |
| [Dein](https://github.com/Shougo/dein.vim) | `call dein#add('thindil/robovim')` |
| [minpac](https://github.com/k-takata/minpac/) | `call minpac#add('thindil/robovim')` |
| pack feature (native Vim 8 package feature)| `git clone https://github.com/thindil/robovim ~/.vim/pack/dist/start/robovim`<br/>Remember to run `:helptags` to generate help tags |
| manual | copy all of the files into your `~/.vim` directory |

## Usage

Place cursor on the element to which you want to add a documentation and enter
Vim command `Roboheader [headertype]` where *headertype* is one of types of headers
supported by your setting of Robodoc. It will add a skeleton documentation header
above cursor line filled with basic informations.

You can close the documentation by entering Vim command `Robofooter`. It will add
Robodoc closing mark below your cursor line.

Most of parameters (like package name, element name) the plugin can
auto-detect. If you are not satisfied with auto-detection, you can use Vim
command `Robopackage [packagename]` to set a new name for a package in
selected buffer. Using this command without *packagename* will cause reset it
to auto-detect again.

More information on how to use, configure or extend this plugin you can find in
the plugin help file with Vim command `help robovim`.
