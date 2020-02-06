dotFILES
--------
# Intro

Basic configuration files that I use daily to increase privacy on my local environment (only works in Ubuntu or Debian distros).

# What is it?

This setup includes plugins and configuration files for VIM editor. Plugins are optional:
 - [Pathogen](https://www.github.com/tpope/vim-pathogen)
 - [NerdTree](https://www.github.com/scrooloose/nerdtree)
 - [Tagbar](https://www.github.com/majutsushi/tagbar)
 - [Neocomplete](https://www.github.com/Shougo/neocomplete.vim)
 - [Vim-airline](https://www.github.com/vim-airline/vim-airline)
 - [Nerdfonts](https://www.github.com/ryanoasis/nerd-fonts)
 - [Devicons](https://www.github.com/ryanoasis/vim-devicons)
 - [Snazzy Theme](https://www.github.com/SolomonSklash/vim-snazzy)

It is also included configuration files for:
 - cURL
 - GnuPG
 - W3M browser
 - WGet

# Install

To install, clone this repo:

```
git clone https://github.com/deniszanin/dotfiles.git $HOME/install-dotfiles
```

And then, execute the script to install:

```
chmod +x $HOME/install-dotfiles/install-files.sh
cd $HOME/install-dotfiles
./install-files.sh
```

# Notes

On **Debian** or **Ubuntu**, use `apt-get install secure-delete` to install `srm` command (aliased on *.bashrc*) which improves security removing filesi for non-SSD machines.

Note: it's probably better not to use *secure-delete* on SSDs.
