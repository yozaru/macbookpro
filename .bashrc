#ls
alias ls="ls -G"
alias la="ls -Ga"
alias ll="ls -Gl"

#vim
alias v="vim"

#cd
alias ..="cd .."

#history
alias h="history"

#git
alias g="git"

#sudo
alias s="sudo"

#rm -rf
alias rf="rm -rf"

#mkdir
alias mk="mkdir"

#hamlhenkan
alias ei="haml -q -f html5"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH=$PATH:/sbin:/usr/sbin # パス
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export HISTSIZE=100000 # これだけコマンド履歴を残す
export LANG='ja_JP.UTF-8' # 以下 3 つ文字コード
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
