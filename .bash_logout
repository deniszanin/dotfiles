#"""""""""""""""""""""""""""""""""""""" 
#" BASH_LOGOUT file:
#"
#" Denis Zanin
#" https://github.com/deniszanin/dotfiles
#" 
#""""""""""""""""""""""""""""""""""""""
# ~/.bash_logout: executed by bash(1) when login shell exists.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    clshist
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
