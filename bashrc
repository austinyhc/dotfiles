# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Toolchain to build nanohub firmware
export PATH="$HOME/.vim/dev/gcc-arm-none-eabi-5_4-2016q2/bin:$PATH"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias lg='ls|grep'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto --exclude=*tags'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias path='echo -e ${PATH//:/\\n}'
alias reload='source ~/.vim/bashrc'
alias vimv='vim ~/.vim/vimrc'
alias vimb='vim ~/.vim/bashrc'
alias apt-get="sudo apt-get"
alias fastboot="sudo fastboot"
alias adb="sudo adb"
alias u='echo "xserver-xorg-video-intel hold" | sudo dpkg --set-selections && \
              echo "xserver-common hold" | sudo dpkg --set-selections && \
              sudo apt-get update && sudo apt-get dist-upgrade && git -C ~/.vim pull'
alias find="du -a . |grep "
alias mmd="fortune | cowsay && echo ' '"

## reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

## d410c related
alias dbkenv='export ARCH=arm64 && export CROSS_COMPILE=~/workspace/410c_codebase/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-'
alias dbkmake='make KDIR=../../.. CFLAGS_MODULE=-fno-pic'
alias dbenv='source build/envsetup.sh && lunch msm8916_64-userdebug'
alias dbre=' fastboot flash aboot ./emmc_appsboot.mbn && \
             fastboot flash boot ./boot.img           && \
             fastboot flash system ./system.img       && \
             fastboot flash userdata ./userdata.img   && \
             fastboot flash persist ./persist.img     && \
             fastboot flash recovery ./recovery.img'
alias dbhal='adb push /home/achen/workspace/410c_codebase/out/target/product/msm8916_64/system/lib64/sensors.native.so system/lib64/hw/sensors.msm8916.so && \
             adb push /home/achen/workspace/410c_codebase/out/target/product/msm8916_64/system/lib64/sensors.native.so system/lib64/sensors.native.so && \
             adb shell stop && \
             adb shell start'
alias apqenv='source build/envsetup.sh && lunch msm8996-userdebug'
alias sscenv='export HEXAGON_TOOLS_PREFIX=/home/achen/Qualcomm/HEXAGON_Tools/5.1.05/ && \
              export SLPI_PREFIX=/home/achen/workspace/slpi_codebase'

alias k='adb shell SNTMfgUtil'
alias preupdate='adb shell "nanotool -x read &"; sleep 1; \
    adb shell "echo 00F401 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control"; sleep 1; \
    adb shell "echo 00F400 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control"; sleep 1; \
    adb shell nanoapp_cmd reset; sleep 1; \
    adb shell "echo 009300 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control"; sleep 1; \
    adb shell "echo 0093C0 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control"; sleep 1; \
    adb shell cat /sys/android_edge/register_chipid_lsb; sleep 1;'

alias nanolog='repeat 100000 "adb shell ''echo 1 > /sys/class/htc_sensorhub/sensor_hub/dump_log'' " '
alias killjobs='pids=( $(jobs -p) ); [ -n "$pids" ] && kill -- "${pids[@]/#/-}"'

## typo alias
alias mkdri='mkdir'
alias grpe="grep"
alias abd='adb'
alias vmi='vim'
alias c='clear'
alias sl='ls'
alias claer='clear'

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

alias haha='ctags_cscope_func'
ctags_cscope_func() {
    ctags -R --langmap=c++:.ino
    cscope -Rbq

}

## set up for python virtualenv/virtualenvwrapper
# where to store our virtual envs
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# where projects will reside
export PROJECT_HOME=$HOME/workspace/project_codebase/python_base

# where is the virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh

# quick alias
alias lsv='lsvirtualenv'
alias mkv='mkvirtualenv'
alias rmv='rmvirtualenv'
alias vin='workon'
alias vout='deactivate'

# Include local bash_extended
if [ -f ~/.bash_extended ]; then
    . ~/.bash_extended
fi

function repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

# added by Anaconda2 4.4.0 installer
export PATH="/home/parallels/anaconda2/bin:$PATH"


alias sntfwv='adb shell cat sys/android_edge/product_config'

alias sntreset='sleep .5 && adb shell "echo 1 > /sys/android_edge/reset" && sleep .5 && \
                adb shell "echo 009300 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control" && sleep .5 && \
                adb shell "echo 0093C0 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control" && sleep .5 && \
                adb shell "echo 009380 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control" && sleep .5 && \
                adb shell "echo 020000 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control" && sleep .5 && \
                adb shell "echo 020001 > /sys/class/htc_sensorhub/sensor_hub/edge_monitor_control" && sleep .5 && \
                adb shell nanoapp_cmd reset && sleep 1'

alias sntfwu='adb push *.update vendor/firmware/snt8100fsr.update && sleep 1 && \
              adb shell "echo vendor/firmware/snt8100fsr.update > /sys/android_edge/fwupdate" &&
              repeat 810 ''adb shell "cat /sys/android_edge/fwupdate"'''
alias rmlock='adb shell rm -rf /data/vendor/sensor/nanohub_lock'
alias sntkeydis='adb shell "echo 7 > /sys/keyboard/disable_interrupt" && sleep .2 && \
                 adb shell "echo 0x07 0x08fd > /sys/android_edge/set_reg" && sleep .2 && \
                 adb shell "echo 0x10 0xffe1 > /sys/android_edge/set_reg" && sleep .2 && \
                 adb shell "echo 0x18 0xffe1 > /sys/android_edge/set_reg" && sleep .2 && \
                 adb shell "echo 0x20 0xffe1 > /sys/android_edge/set_reg"'

alias sntkeyen=' adb shell "echo 0x07 0x08e1 > /sys/android_edge/set_reg" && sleep .2 && \
                 adb shell "echo 0x10 0x08e1 > /sys/android_edge/set_reg" && sleep .2 && \
                 adb shell "echo 0x18 0x08e1 > /sys/android_edge/set_reg" && sleep .2 && \
                 adb shell "echo 0x20 0x08ff > /sys/android_edge/set_reg" && sleep .2 && \
                 adb shell "echo 0 > /sys/keyboard/disable_interrupt"'
