# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
	 ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    start_agent;
	}
else
    start_agent;
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

export PS1="\[\e[31m\]\u\[\e[m\]@\[\e[34;40m\]\h\[\e[m\][\[\e[33m\]\W\[\e[m\]]-\[\e[32m\]\A\[\e[m\]-\`parse_git_branch\`\\$ "


export GOPATH="$HOME/gocode"
export NOVETTA="$GOPATH/src/github.com/Novetta"
export VIDEX="$NOVETTA/VideoEnterprise"
export ITK="$NOVETTA/ITK"
export CEREBRO="$NOVETTA/KLE"
export ARES="$NOVETTA/pwcop"
export ICON_DIR="$NOVETTA/common/milsym/icons"
export PATH="/home/ashanker/.npm-global/bin:$GOPATH/bin:/usr/local/go/bin/go:/usr/bin:$PATH:/opt/ffmpeg/bin:$NOVETTA/VideoEnterprise/bin"
export VIDEO_ENTERPRISE="$NOVETTA/VideoEnterprise"
export PKG_CONFIG_PATH="$VIDEO_ENTERPRISE/shared/lib/pkgconfig:/usr/lib64/pkgconfig:$PKG_CONFIG_PATH"
export VIDEX_DIR="$HOME/videx"
export CONF_DIR="$VIDEX_DIR/conf"
export CASSANDRA_NODES="localhost"
export VIDEX_DATA_DIR="$VIDEX_DIR/data"
export PGSSLMODE="disable"

#User specific aliases and functions

#export PATH="/home/vagrant/bin/Sencha/Cmd/6.2.0.103/..:$PATH"
source ~/.alias
source ~/git-completion.bash

export PATH="/home/ashanker/bin/Sencha/Cmd:$PATH"
