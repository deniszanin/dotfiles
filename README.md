dotFILES
--------
# Intro

Basic configuration files that I use daily to increase privacy on my local environment (only works in Ubuntu or Debian distros).

# What is it?

This setup includes plugins and configuration files for VIM editor. Plugins are optional:
 - Pathogen
 - NerdTree
 - Tagbar
 - Neocomplete
 - Vim-airline 
 - Nerdfonts 
 - Devicons 

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
./install-files.sh
```

# Notes

On **debian**, use `apt-get install secure-delete` to install `srm` command (aliased on *.bashrc*) which improves security removing filesi for non-SSD machines.

Note: it's probably better not to use *secure-delete* on SSDs.
