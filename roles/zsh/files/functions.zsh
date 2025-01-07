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
