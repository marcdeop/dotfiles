#!/usr/bin/env bash
# Get an array of PIDs
function fzf_get_pids() {
  local pid_column
  if [[ $(uname) = Linux ]]; then
    pid_column=2
  elif [[ $(uname) = Darwin ]]; then
    pid_column=3;
  else
    echo 'Error: unknown platform'
    return
  fi

  local pids
  mapfile -t pids < <(
    ps -f -u "$USER" \
      | sed 1d \
      | fzf --multi --reverse \
      | tr -s '[:blank:]' \
      | cut -d' ' -f"$pid_column"
  )
  if [[ -v pids[@] ]]; then
    for pid in "${pids[@]}"; do
      echo "$pid"
    done
  fi
}

# kill selected processes
function fzf_kill() {
  local pids
  mapfile -t pids < <( fzf_get_pids )
  if [[ -v pids[@] ]]; then
      kill "${pids[@]}"
  fi
}

# kill -9 selected processes
function fzf_kill9() {
  local pids
  mapfile -t pids < <( fzf_get_pids )
  if [[ -v pids[@] ]]; then
      kill -9 "${pids[@]}"
  fi
}

# Add selected files to be commited
function fzf_git_add() {
  local selections
  mapfile -t selections < <(
    git status --porcelain | \
      fzf --ansi \
          --reverse \
          --preview 'if (git ls-files --error-unmatch {2} &>/dev/null); then
                         git diff --color=always {2}
                     else
                         bat --color=always --line-range :500 {2}
                     fi'
  )
  if [[ -v selections[@] ]]; then
    local files
    mapfile -t files < <(
      for selection in "${selections[@]}"; do
        echo "$selection" | cut -c 4-
      done
    )
    git add --verbose "${files[@]}"
  fi
}

# Show a fancy git log browser
function fzf_git_log() {
  local selections
  mapfile -t selections < <(
    git log --color=always \
      --graph \
      --format="%C(yellow)%h%C(red)%d%C(reset) \
        - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)" \
        "@" |
        fzf --ansi \
            --no-sort \
            --reverse \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @'"
    )
  if [[ -v selections[@] ]]; then
    local commits
    mapfile -t commits < <(
      for selection in "${selections[@]}"; do
        echo "$selection" | sed 's/^[* |]*//' | cut -d' ' -f1
      done
    )
    git show "${commits[@]}"
  fi
}

# Show a fancy git log browser based on a search
function fzf_git_log_pickaxe() {
  if [[ $# == 0 ]]; then
    echo 'Error: search term was not provided.'
    return
  fi
  local selections
  mapfile -t selections < <(
    git log --oneline --color=always -S "$@" |
      fzf --ansi \
          --no-sort \
          --reverse \
          --preview "git show --color=always {1}"
  )
  if [[ -v selections[@] ]]; then
    local commits
    mapfile -t commits < <(
      for selection in "${selections[@]}"; do
        echo "$selection" | cut -d' ' -f1
      done
    )
    git show "${commits[@]}"
  fi
}

# Show a fancy git reflog browser
function fzf_git_reflog() {
  local selections
  mapfile -t selections < <(
    git reflog --color=always "$@" |
      fzf --no-multi --ansi --no-sort --reverse \
          --preview "git show --color=always {1}"
    )
  if [[ -v selections[@] ]]; then
    local reflogs
    mapfile -t reflogs < <(
      for selection in "${selections[@]}"; do
        echo "$selection" | cut -d' ' -f1
      done
    )
    git show "${reflogs[@]}"
  fi
}
