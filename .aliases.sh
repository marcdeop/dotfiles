#!/usr/bin/env bash
###############################################################################
#                                Shell Aliases                                #
###############################################################################
alias ll='ls -lsaG'

###############################################################################
#                                 Git Aliases                                 #
###############################################################################
alias gd='git diff '
alias gdl='git diff HEAD~1 HEAD'
alias gpull='git pull'
alias gpush='git push'
alias glo='git log --graph --pretty=oneline'
alias gl='git log'
alias gmd='git merge develop'
alias gmm='git merge master'
alias gm='git merge '
alias gs='git status'

###############################################################################
#                               Custom commands                               #
###############################################################################

alias skype='Exec=env PULSE_LATENCY_MSEC=30 skype %U'
alias vim='nvim'
alias su='su -l'
