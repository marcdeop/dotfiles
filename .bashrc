#!/usr/bin/env bash
###############################################################################
#                          Source global definitions                          #
###############################################################################
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

###############################################################################
#                                     FZF                                     #
###############################################################################
if [ -f /usr/share/fzf/shell/key-bindings.bash ];then
  source /usr/share/fzf/shell/key-bindings.bash
fi

if [ -f /etc/bash_completion.d/fzf ];then
  source /etc/bash_completion.d/fzf
fi

# Match all files including hidden
export FZF_DEFAULT_COMMAND='rg --files \
                           --no-ignore \
                           --hidden --follow \
                           --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--border-label-pos=1 \
                         --border=bold \
                         --height 50% \
                         -1 \
                         --multi \
                         --bind ctrl-j:down,ctrl-k:up \
                         --preview='[[ \$(file --mime {}) =~ binary ]] \
                         && echo {} is a binary file \
                           || (bat --style=numbers --color=always {} \
                           || cat {}) 2> /dev/null | head -300'"
export FZF_CTRL_R_OPTS="--preview \
                        'echo {}' --preview-window down:3:hidden:wrap \
                        --bind '?:toggle-preview' \
                        --no-sort \
                        --layout=reverse \
                        --border-label='History '"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --border-label='Files '"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' \
                       --border-label='Directories '"

if [ -f .fzfFunctions.sh ]; then
  source .fzfFunctions.sh
fi

###############################################################################
#                                   VI mode                                   #
###############################################################################
set -o vi

###############################################################################
#                            Disable flow control                             #
###############################################################################
stty -ixon

###############################################################################
#                                   Aliases                                   #
###############################################################################
if [ -f .aliases.sh ]; then
  source .aliases.sh
fi

###############################################################################
#                              Generic functions                              #
###############################################################################
if [ -f .genericFunctions.sh ]; then
  source .genericFunctions.sh
fi

###############################################################################
#                         Colored man pages wih less                          #
###############################################################################

# if we are in a TTY and if we support more than 8 colors
if [[ -t 1 && "$(tput colors)" -gt 8 ]]; then
  man() {
    env \
      LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
      LESS_TERMCAP_md="$(printf "\e[1;31m")" \
      LESS_TERMCAP_me="$(printf "\e[0m")" \
      LESS_TERMCAP_se="$(printf "\e[0m")" \
      LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
      LESS_TERMCAP_ue="$(printf "\e[0m")" \
      LESS_TERMCAP_us="$(printf "\e[1;32m")" \
      GROFF_NO_SGR=1 \
      MANPAGER='less -s -M +Gg' \
        man "$@"
  }
fi

###############################################################################
#                            Custom Env Variables                             #
###############################################################################
# Likely not working. See:
# https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/4829
export GTK_USE_PORTAL=1
export EMAIL="terminal@marcdeop.com"
export RPM_PACKAGER="Marc Deop i Argemí <marcdeop@fedoraproject.org>"

# Needed by https://github.com/elFarto/nvidia-vaapi-driver
export LIBVA_DRIVER_NAME="nvidia"
export EGL_PLATFORM="wayland"
export MOZ_DISABLE_RDD_SANDBOX="1"
export MOZ_X11_EGL="1"
# https://github.com/elFarto/nvidia-vaapi-driver/issues/126
export NVD_BACKEND="direct"

###############################################################################
#                                  Powerline                                  #
###############################################################################

# if we entered from vim (via :sh) export a variable to show in POWERLINE
if [[ -n "$VIMRUNTIME" ]]; then
  export POWERLINE_VIM_SHELL_INDICATOR=":sh"
fi

if systemctl is-active --user -q powerline.service ; then
  export POWERLINE_BASH_CONTINUATION=1
  export POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bash/powerline.sh
fi

###############################################################################
#                                 Kubernetes                                  #
###############################################################################
# shellcheck disable=SC1090
source <(kubectl completion bash)
