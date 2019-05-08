## General informations
Robovim is simple Vim plugin which allow easier add [Robodoc](https://rfsber.home.xs4all.nl/Robo/)
formatted documentation to source code. At this moment only Ada and Vim are
supported but it is easy to add support for more file types.

## Installation

### Manual installation
Install the distributed files into Vim runtime directory which is usually
~/.vim/, or $HOME/vimfiles on Windows.

## Usage

Place cursor on element to which you want to add documentation and enter Vim
command `Roboheader [headertype]` where *headertype* is one of types of headers
supported by your setting of Robodoc. It will add skeleton documentation header
above cursor line filled with basic informations.

You can close documentationt by entering Vim command `Robofooter`. It will add
Robodoc closing mark below your cursor line.

Most of parameters (like package name, element name) plugin can auto-detect. If
you are not satisfied with this, you can use Vim command `Robopackage
[packagename]` to set new name for package in selected buffer. Using this
command without *packagename* will cause reset it to auto-detect again.

More information on how to use, configure or extend this plugin you can find in
plugin help file with command `help robovim`.
