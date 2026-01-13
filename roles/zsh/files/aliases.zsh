alias bat=batcat
alias df='df -h'
alias free='free -m'
alias h='history'
alias l='ls'
alias mutt='neomutt'
alias piken='noglob piken'
alias wget='wget -c'
alias ip='ip --color=auto'
alias download-playlist='yt-dlp -t mp3 -o "%(playlist_index)s - %(title)s.%(ext)s"'
alias download-song='yt-dlp -t mp3'
alias bt-internal-off="echo '1-5:1.0' | sudo tee /sys/bus/usb/drivers/btusb/unbind"
alias bt-internal-on="echo '1-5:1.0' | sudo tee /sys/bus/usb/drivers/btusb/bind"

# gcc
alias gcc99='gcc -O -Wall -Wextra -pedantic -ansi -std=c99'
alias gcc89='gcc -O -Wall -Wextra -pedantic -ansi -std=c89'
alias gccg99='gcc -O -Wall -Wextra -pedantic -ansi -std=gnu99'
alias g++11='g++ -std=c++11'

# Debian

alias lintian='lintian -EIL +pedantic --show-overrides --color auto --tag-display-limit 0'

# Distrobox

alias noetic='distrobox enter noetic'
alias humble='distrobox enter humble'
alias matlab='distrobox enter matlab'
