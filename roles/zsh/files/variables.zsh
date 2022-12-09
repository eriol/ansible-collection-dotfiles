if [ $TERM = "xterm" ]; then
    export TERM=xterm-256color
fi

export LC_ALL=en_US.UTF-8

export GPGKEY=0D6CCEDD

export EDITOR=nvim

# Debian :)
DEBEMAIL=eriol@debian.org
DEBFULLNAME="Daniele Tricoli"
export DEBEMAIL DEBFULLNAME
export GBP_CONF_FILES=~/.gbp.conf:debian/gbp.conf:~/gbp.late.conf

# Go
export GOPATH="$HOME/.go"

# Enable virtualenvwrapper
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

export ANDROID_HOME=/opt/android-sdk-linux
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

export LESS="-F -X $LESS"

export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
