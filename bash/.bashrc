#!/bin/bash
# .bashrc

# If this isn't an interactive prompt don't do anything
#[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

export PS1="\[\e[35m\]\u\[\e[m\]@\[\e[0;36m\]\h\[\e[m\][\[\e[1m\]\W\[\e[m\]]-\[\e[38;5;99m\]\A\[\e[m\]-\`parse_git_branch\`\\$ "

#export PS1="\u@\h\W-\A-\`parse_git_branch\`\\$ "

export GOPATH="$HOME/gocode"
export GOBIN="$GOPATH/bin"
export NOVETTA="$GOPATH/src/github.com/Novetta"
export VIDEX="$NOVETTA/VideoEnterprise"
export ITK="$NOVETTA/ITK"
export CEREBRO="$NOVETTA/KLE"
export ARES="$NOVETTA/pwcop"
export ICON_DIR="$NOVETTA/common/milsym/icons"
export PATH="/home/centos/.npm-global/bin:$GOPATH/bin:/usr/local/go/bin/go:/usr/bin:$PATH"
export VIDEO_ENTERPRISE="$NOVETTA/VideoEnterprise"
export PKG_CONFIG_PATH="$VIDEO_ENTERPRISE/shared/lib/pkgconfig:/usr/lib64/pkgconfig:$PKG_CONFIG_PATH"
export VIDEX_DIR="$HOME/videx"
export CONF_DIR="$VIDEX_DIR/conf"
export CASSANDRA_NODES="localhost"
export VIDEX_DATA_DIR="$VIDEX_DIR/data"
export COMMON="$NOVETTA/common"
export KERBPROXY="$NOVETTA/kerbproxy"

#User specific aliases and functions

export PATH="/home/centos/bin/Sencha/Cmd/6.2.1.29/..:$PATH"
source ~/.alias
source ~/git-completion.bash

#export PATH="/opt/ffmpeg/bin/:$PATH"

source /opt/kerbproxy/conf/kerbproxy.env
