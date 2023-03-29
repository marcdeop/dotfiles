###############################################################################
#                          Random password generator                          #
###############################################################################

genpasswd() {
  tr -dc A-Za-z0-9_%. < /dev/urandom | head -c "${1:-12}" | xargs
}

function password(){
  openssl rand -base64 "${1-16}"
}

function generatePhpTags() {
  ctags --recurse --tag-relative \
    --languages=-javascript,sql \
    --exclude=.git \
    --sort=yes --append \
    --PHP-kinds=+cf \
    --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' \
    -f tags
}

function youtube-dl-playlist() {
  youtube-dl -x --audio-format mp3 --audio-quality 192K "$1"
  for song in *.mp3 ; do mv "$song" "${song%-*}".mp3 ; done
}

function removebranches(){
  git fetch -p && \
    for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
    git branch -D "$branch"
  done
}

urlencode() {
    # urlencode <string>

    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:$i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

function mdv() {
  pandoc -t html -f markdown_mmd "${1}" | elinks -dump -dump-color-mode 4
}

function gitkarma() {
  cat <<EOF
    feat (new feature for the user, not a new feature for build script)
    fix (bug fix for the user, not a fix to a build script)
    docs (changes to the documentation)
    style (formatting, missing semi colons, etc; no production code change)
    refactor (refactoring production code, eg. renaming a variable)
    test (adding missing tests, refactoring tests; no production code change)
    chore (updating grunt tasks etc; no production code change)
EOF
}

# https://sbulav.github.io/kubernetes/using-fzf-with-kubectl/
function kg() {
  kubectl get "$@" -o name | \
              fzf --preview 'kubectl get {} -o yaml' \
                  --bind "ctrl-\:execute(kubectl get {+} -o yaml | nvim )" \
                  --bind "ctrl-r:reload(kubectl get $* -o name)" \
                  --header 'Press CTRL-R to reload' \
                  --bind "ctrl-]:execute(kubectl edit {+})";
}

