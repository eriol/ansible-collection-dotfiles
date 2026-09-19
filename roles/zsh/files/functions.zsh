gi ()
{
    nohup alacritty -t vim -e vim "$@" >/dev/null 2>&1 &!
}

i ()
{
    nohup alacritty  -t nvim -e nvim "$@"  >/dev/null 2>&1 &!

    current_layout=$(qdbus6 org.kde.keyboard /Layouts getLayout)
    english_layout=1
    if [ $current_layout -ne $english_layout ]; then
        echo key super+space | dotool
    fi
}

cdgopath ()
{
    cd $GOPATH
}
# Connect to ssh without recording host-key
sshtmp ()
{
    ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" "$@"
}

#  Do an SCP without recording, or prompting for host keys.
scptmp ()
{
    scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" "$@"
}

# Recursively delete python related unwanted files
nukepy ()
{
   find . -regextype posix-egrep -regex '.*\.pyc|.*\.pyo|.*~' -delete;
}

# Recursively delete latex related unwanted files
nuketex ()
{
   find . -regextype posix-egrep -regex '.*\.aux|.*\.log|.*\.idx|.*\.toc|.*\.thm|.*\.bbl|.*\.blg|.*\.out|.*\.lol|.*\.lot|.*\.lof|.*~' -delete;
}

# Check running process
pp ()
{
    ps aux | awk '!/awk/ && $0~var' var=${1:-".*"} ;
}

# For pypath
pypath ()
{
    output=$(pypath.py $*);
    if [ $1 = 'show' ]; then
        echo $output;
    else
        eval $output;
    fi
}

# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/#deleting-branches
function delete-branches() {
  git branch |
      grep --invert-match '\*' |
      cut -c 3- |
      fzf --multi --preview="git log {} --" |
      xargs --no-run-if-empty git branch --delete --force
}

# Add current directory into PATH.
addpath() {
  local dir=${1:-$PWD}
  dir=${dir:A} # make absolute, resolve symlinks
  if [[ ! -d $dir ]]; then
    print -u2 "addpath: no such directory: $dir"
    return 1
  fi
  path=("$dir" $path)
}

# Remove current directory from PATH.
rmpath() {
  local dir=${${1:-$PWD}:A}
  path=("${(@)path:#$dir}")
}

# List directores in PATH.
lspath() {
  local i=1 dir
  for dir in $path; do
    if [[ -d $dir ]]; then
      printf '%2d  %s\n' $i $dir
    else
      printf '%2d  %s  (missing)\n' $i $dir
    fi
    ((i++))
  done
}
# An alternative can be:
# lspath() {
#   print -l $path
# }

# Automatically enter into distrobox when DIRENV_DISTROBOX is set.
# An example .envrc is:
#     [ "${TERM_PROGRAM-}" = "ghostty" ] || return 0
#     [ -n "${DISTROBOX_ENTER_PATH-}" ] && return 0
#     export DIRENV_DISTROBOX=go2-noetic
_autodistrobox_from_direnv() {
    [[ -n "${DIRENV_DISTROBOX-}" ]] || return 0
    [[ -z "${DISTROBOX_ENTER_PATH-}" ]] || return 0

    command -v distrobox >/dev/null 2>&1 || return 0

    local box="$DIRENV_DISTROBOX"

    unset DIRENV_DISTROBOX

    distrobox enter "$box"
}

precmd_functions+=(_autodistrobox_from_direnv)
