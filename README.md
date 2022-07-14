# vim-dotfiles
- My vim configuration is working but deprecated
- I have moved to using Neovim, which I also have dotfiles for, under the `neovim` directory.

### Configuration, plugins, dot files that I use to setup my vim 

## Prerequisites
- This is for *nix OS, Linux, MacOS, etc.
- vim version 8.1+
It must have the +conceal option compiled, this is needed for one of the
plugins I'm using (keep reading) 

## Installation
- I use vim plugins, so the first step is to install a plug-in manager, there are several.
- I've chosen to use [vim-plug](https://github.com/junegunn/vim-plug). Read
documentation there please for some general information about this wonderful plug-in manager.
- create directory `~/.vim`
- copy `~/.vim/mappings.vim` into the same location in your local file system.
- copy `~/.vimrc` into the same location in your file system.
- launch vim, then issue command `:PlugIntall` to install all plug-ins. 
