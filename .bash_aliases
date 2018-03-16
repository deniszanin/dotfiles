#"""""""""""""""""""""""""""""""""""""" 
#" BASH_ALIASES file:
#"
#" Denis Zanin
#" https://github.com/deniszanin/dotfiles
#" 
#""""""""""""""""""""""""""""""""""""""
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -FGlAhpa'
alias lk='ls -al'

alias df='df -h'
alias rm='srm -v' # Requires secure-delete
alias oldrm='/bin/rm -fv'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'

alias sha1='openssl sha1'
alias diff='colordiff'
alias which='type -all'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias clshist='cat /dev/null > ~/.bash_history && history -c && history -w;rm ~/.viminfo;rm ~/.bash_history;rm -R ~/.mytrashremove;clear'

alias ping='ping -c5 -s.5'

alias numFiles='echo $(ls -1 | wc -l)'      # count of non-hidden files in current dir

############
# FUNCTIONS
#
# mans: search manpage in argument '1' for term given in argument '2' (case insensitive)
#       displays paginated result with colored search terms and two lines surrounding each hit.
#       z.B.: mans mplayer codec
#
mans() {
    man $1 | grep -iC2 --color=always $2 | less
}
