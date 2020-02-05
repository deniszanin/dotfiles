#!/usr/bin/env bash
####################
# Install dotFILES
#
#    https://github.com/deniszanin/dotfiles.git
#
DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_BKP="$HOME/.your_old_dotfiles"
VIMPLUGIN_ALL=0
VIMPLUGIN_PATHOGEN=1
VIMPLUGIN_NERDTREE=0
VIMPLUGIN_TAGBAR=0
VIMPLUGIN_NEOCOMPLETE=0
VIMPLUGIN_DEVICONS=0
VIMPLUGIN_NERDFONTS=0
VIMPLUGIN_AIRLINE=0
VIMPLUGIN_SNAZZY=1
SRM_DISABLE=0

# User, NOT ROOT.
if [[ $EUID -eq 0 ]]; then
	echo " * You must run as user, not root."
	echo " * Leaving..."
    exit 1
fi

# Checking if necessary programs are installed.
if ! [ -x "$(command -v git)" ]; then
    echo " * GIT not installed. Please, run 'sudo apt-get install git'."
    exit 1
fi

if ! [ -x "$(command -v vim)" ]; then
    echo " * VIM not installed. Please, run 'sudo apt-get install vim'."
    exit 1
fi

RETURN_APT=$(dpkg-query -l | grep exuberant-ctags | wc -l)
if [ $RETURN_APT -eq 0 ]; then
    echo " * EXUBERANT-CTAGS not installed. Please, run 'sudo apt-get install exuberant-ctags'."
    exit 1
fi

echo ""
echo "   dotFILES  INSTALL  "
echo " ---------------------"
echo " - Questions: To be or not to be..."

# SECURE DELETE option.
RETURN_APT=$(dpkg-query -l | grep secure-delete | wc -l)
if [ $RETURN_APT -eq 0 ]; then
    echo " * SECURE-DELETE not installed. This option will be disable on your .bash_aliases file."
    SRM_DISABLE=1
else
    echo ""
    echo " - 1. Would you like to enable SECURE-DELETE (secure delete files)? "
    echo " --   Note: if you have a SSD, do NOT enable this."
    while true; do
        read -p " ------- Enable SRM? [Y]es/[N]o: " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) SRM_DISABLE=1; break;;
            * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
        esac
    done
fi

# VIM PLUGIN options.
echo ""
echo " - 2. VIM: Download and install all VIM plugins?"
while true; do
    read -p " ------- ALL plugins? [Y]es/[N]o: " yn
    case $yn in
        [Yy]* ) VIMPLUGIN_ALL=1; break;;
        [Nn]* ) break;;
        * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
    esac
done

if [ $VIMPLUGIN_ALL -eq 0 ]; then
    # NERDTREE plugin install.
    echo " -*- 2.1. VIM: Download and install NERDTREE plugin?"
    while true; do
        read -p " ------- NERDTREE plugin? [Y]es/[N]o: " yn
        case $yn in
            [Yy]* ) VIMPLUGIN_NERDTREE=1; break;;
            [Nn]* ) break;;
            * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
        esac
    done
    
    # TAGBAR plugin install.
    echo " -*- 2.2. VIM: Download and install TAGBAR plugin?"
    while true; do
        read -p " ------- TAGBAR plugin? [Y]es/[N]o: " yn
        case $yn in
            [Yy]* ) VIMPLUGIN_TAGBAR=1; break;;
            [Nn]* ) break;;
            * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
        esac
    done

    # NEOCOMPLETE plugin install.
    echo " -*- 2.3. VIM: Download and install NEOCOMPLETE plugin?"
    while true; do
        read -p " ------- NEOCOMPLETE plugin? [Y]es/[N]o: " yn
        case $yn in
            [Yy]* ) VIMPLUGIN_NEOCOMPLETE=1; break;;
            [Nn]* ) break;;
            * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
        esac
    done
    
    # AIRLINE plugin install.
    echo " -*- 2.4. VIM: Download and install AIRLINE plugin?"
    while true; do
        read -p " ------- AIRLINE plugin? [Y]es/[N]o: " yn
        case $yn in
            [Yy]* ) VIMPLUGIN_AIRLINE=1; break;;
            [Nn]* ) break;;
            * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
        esac
    done
    
    # NERDFONTS plugin install.
    echo " -*- 2.6. VIM: Download and install NERDFONTS plugin (around 7GB)?"
    while true; do
        read -p " ------- NERDFONTS plugin? [Y]es/[N]o: " yn
        case $yn in
            [Yy]* ) VIMPLUGIN_NERDFONTS=1; break;;
            [Nn]* ) break;;
            * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
        esac
    done

    # DEVICONS plugin install.
    echo " -*- 2.5. VIM: Download and install DEVICONS plugin?"
    while true; do
        read -p " ------- DEVICONS plugin? [Y]es/[N]o: " yn
        case $yn in
            [Yy]* ) VIMPLUGIN_DEVICONS=1; break;;
            [Nn]* ) break;;
            * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
        esac
    done
fi

echo ""
echo " - 3. LAST WARNING: time to install!"
while true; do
    read -p " ------- Continue? [Y]es/[N]o: " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo ""; echo " -- OK. Aborting..."; exit; break;;
        * ) echo " * Wrong option. Answer [Y]es or [N]o.";;
    esac
done

echo ""
echo " -- Copying files..."

if ! [ -d "$DOTFILES_DIR" ]; then
    mkdir -p $DOTFILES_DIR
fi

if ! [ -d "$DOTFILES_BKP" ]; then
    mkdir -p $DOTFILES_BKP
fi

wait 

cp .bash_aliases $DOTFILES_DIR/bash_aliases
cp .bash_logout $DOTFILES_DIR/bash_logout
cp .bashrc $DOTFILES_DIR/bashrc
cp .curlrc $DOTFILES_DIR/curlrc
cp .lesskey $DOTFILES_DIR/lesskey
cp .profile $DOTFILES_DIR/profile
cp .vimrc $DOTFILES_DIR/vimrc
cp .vimrc_noplugin $DOTFILES_DIR/vimrc_noplugin
cp .w3mconfig $DOTFILES_DIR/w3mconfig
cp .wgetrc $DOTFILES_DIR/wgetrc
wait
cp -R vim $DOTFILES_DIR/vim
cp -f .vim_colortheme_ohgen006.vim $DOTFILES_DIR/vim/colors/ohgen006.vim
cp -R ssh $DOTFILES_DIR/ssh
cp -R gnupg $DOTFILES_DIR/gnupg

wait

echo " -- Backing files up and removing old files..."
if [ -f "$HOME/.bash_aliases" ]; then mv $HOME/.bash_aliases $DOTFILES_BKP/.bash_aliases; fi
if [ -f "$HOME/.bash_logout" ]; then mv $HOME/.bash_logout $DOTFILES_BKP/.bash_logout; fi
if [ -f "$HOME/.bashrc" ]; then mv $HOME/.bashrc $DOTFILES_BKP/.bashrc; fi
if [ -f "$HOME/.curlrc" ]; then mv $HOME/.curlrc $DOTFILES_BKP/.curlrc; fi
if [ -f "$HOME/.lesskey" ]; then mv $HOME/.lesskey $DOTFILES_BKP/.lesskey; fi
if [ -f "$HOME/.profile" ]; then mv $HOME/.profile $DOTFILES_BKP/.profile; fi
if [ -f "$HOME/.vimrc" ]; then mv $HOME/.vimrc $DOTFILES_BKP/.vimrc; fi
if [ -f "$HOME/.w3m/config" ]; then mv $HOME/.w3mconfig $DOTFILES_BKP/.w3mconfig; fi
if [ -f "$HOME/.wgetrc" ]; then mv $HOME/.wgetrc $DOTFILES_BKP/.wgetrc; fi
if [ -d "$HOME/.vim" ]; then cp -R $HOME/.vim $DOTFILES_BKP/.vim_bkp; fi
if [ -d "$HOME/.ssh" ]; then cp -R $HOME/.ssh $DOTFILES_BKP/.ssh_bkp; fi
if [ -d "$HOME/.gnupg" ]; then cp -R $HOME/.gnupg $DOTFILES_BKP/.gnupg_bkp; fi

wait

if [ -d "$HOME/.vim" ]; then rm -Rf $HOME/.vim; fi
if [ -d "$HOME/.ssh" ]; then rm -Rf $HOME/.ssh; fi
if [ -d "$HOME/.gnupg" ]; then rm -Rf $HOME/.gnupg; fi
if ! [ -d "$HOME/.w3m" ]; then mkdir -p $HOME/.w3m; fi
wait

echo " -- Linking files..."
ln -s $DOTFILES_DIR/bash_aliases $HOME/.bash_aliases
ln -s $DOTFILES_DIR/bash_logout $HOME/.bash_logout
ln -s $DOTFILES_DIR/bashrc $HOME/.bashrc
ln -s $DOTFILES_DIR/curlrc $HOME/.curlrc
ln -s $DOTFILES_DIR/gnupg $HOME/.gnupg
ln -s $DOTFILES_DIR/lesskey $HOME/.lesskey
ln -s $DOTFILES_DIR/profile $HOME/.profile
ln -s $DOTFILES_DIR/ssh $HOME/.ssh
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc
ln -s $DOTFILES_DIR/vim $HOME/.vim
ln -s $DOTFILES_DIR/w3mconfig $HOME/.w3m/config
ln -s $DOTFILES_DIR/wgetrc $HOME/.wgetrc

wait

if [ $VIMPLUGIN_ALL -eq 1 ]; then
    echo " -- Downloading and installing all VIM plugins:"
    VIMPLUGIN_NERDTREE=1
    VIMPLUGIN_TAGBAR=1
    VIMPLUGIN_NEOCOMPLETE=1
    VIMPLUGIN_AIRLINE=1
    VIMPLUGIN_NERDFONTS=1
    VIMPLUGIN_DEVICONS=1
    VIMPLUGIN_SNAZZY=1
else
    echo " -- Downloading and installing selected VIM plugins:"
fi

if ! [ -d $DOTFILES_DIR/.vim/autoload ]; then
    mkdir -p $DOTFILES_DIR/.vim/autoload
fi

if ! [ -d $DOTFILES_DIR/.vim/bundle ]; then
    mkdir -p $DOTFILES_DIR/.vim/bundle
fi

wait

if [ $VIMPLUGIN_PATHOGEN -eq 1 ]; then
    echo " --- downloading and installing PATHOGEN plugin..."
    curl --disable --location --silent --output $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    wait
fi

if [ $VIMPLUGIN_NERDTREE -eq 1 ]; then
    echo " --- downloading and installing NERDTREE plugin..."
    git clone --quiet https://github.com/preservim/nerdtree.git $HOME/.vim/bundle/nerdtree
    wait
fi

if [ $VIMPLUGIN_TAGBAR -eq 1 ]; then
    echo " --- downloading and installing TAGBAR plugin..."
    git clone --quiet https://github.com/majutsushi/tagbar.git $HOME/.vim/bundle/tagbar
    wait
fi

if [ $VIMPLUGIN_NEOCOMPLETE -eq 1 ]; then
    echo " --- downloading and installing NEOCOMPLETE plugin..."
    git clone --quiet https://github.com/Shougo/neocomplete.vim.git $HOME/.vim/bundle/neocomplete
    wait
fi

if [ $VIMPLUGIN_AIRLINE -eq 1 ]; then
    echo " --- downloading and installing AIRLINE plugin..."
    git clone --quiet https://github.com/vim-airline/vim-airline $HOME/.vim/bundle/vim-airline
    wait
fi

if [ $VIMPLUGIN_NERDFONTS -eq 1 ]; then
    echo " --- downloading and installing NERDFONTS plugin..."
    echo " ---- it takes a looooonnnnnng time... please, be patient! Trust me!"
    echo " ---- now, showing 'git clone' output..."
    echo ""
    git clone https://github.com/ryanoasis/nerd-fonts.git $DOTFILES_DIR/.temp-nerdfonts
    wait
    echo ""
    echo " ---- downloaded!"
    echo " ---- executing NERDFONTS installer..."
    echo ""
    chmod +x $DOTFILES_DIR/.temp-nerdfonts/install.sh
    $DOTFILES_DIR/.temp-nerdfonts/./install.sh --quiet
    wait
    echo ""
    echo " ---- removing temp files..."
    rm -Rf $DOTFILES_DIR/.temp_nerdfonts
    wait
    echo " ---- and done! :)"
fi

if [ $VIMPLUGIN_DEVICONS -eq 1 ]; then
    echo " --- downloading and installing DEVICONS plugin..."
    git clone --quiet https://github.com/ryanoasis/vim-devicons $HOME/.vim/bundle/vim-devicons
    wait
fi

if [ $VIMPLUGIN_SNAZZY -eq 1 ]; then
    echo " --- downloading and installing SNAZZY THEME plugin..."
    git clone --quiet https://github.com/SolomonSklash/vim-snazzy.git $HOME/.vim/bundle/vim-snazzy
    wait
fi

echo " -- Setting up files..."

# Handling .bash_aliases file.
if [ $SRM_DISABLE -eq 1 ]; then
    sed -i "15 s/^#//" $DOTFILES_DIR/bash_aliases
else
    sed -i "14 s/^#//" $DOTFILES_DIR/bash_aliases
    sed -i "16 s/^#//" $DOTFILES_DIR/bash_aliases
fi

wait

# Handling .vimrc file.
if [ $VIMPLUGIN_NERDTREE -eq 0 ]; then sed -i "225 s/^/\"/" $DOTFILES_DIR/vimrc; sed -i "297,311 s/^/\"/" $DOTFILES_DIR/vimrc; fi
if [ $VIMPLUGIN_TAGBAR -eq 0 ]; then sed -i "230 s/^/\"/" $DOTFILES_DIR/vimrc; sed -i "351,353 s/^/\"/" $DOTFILES_DIR/vimrc; fi
if [ $VIMPLUGIN_NEOCOMPLETE -eq 0 ]; then sed -i "338,348 s/^/\"/" $DOTFILES_DIR/vimrc; fi
if [ $VIMPLUGIN_AIRLINE -eq 0 ]; then sed -i "314,334 s/^/\"/" $DOTFILES_DIR/vimrc; fi
if [ $VIMPLUGIN_SNAZZY -eq 1 ]; then sed -i "141 s/^/\"/" $DOTFILES_DIR/vimrc; sed -i "140 s/^\"//" $DOTFILES_DIR/vimrc; fi

wait

echo " -- Finishing..."
echo " -- DONE!"
echo ""
echo "Now, restart your terminal or logout the session."
