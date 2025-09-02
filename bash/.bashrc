#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

PATH="~/.config/emacs/bin:$PATH"
PATH="/home/andoitzcp/.local/share/gem/ruby/3.4.0/bin:$PATH"
  
 
export PATH

# Created by `pipx` on 2025-03-21 18:02:47
export PATH="$PATH:/home/andoitzcp/.local/bin"
export FLOATINGTERMINAL="st -T 'stfloat' -g 85x25+550+300" 
export CAPTUREWINDOW="st -T 'stfloat' -g 85x5+550+300" 


eval "$(register-python-argcomplete pipx)"
source /home/andoitzcp/perl5/perlbrew/etc/bashrc
