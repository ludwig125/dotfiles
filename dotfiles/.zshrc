# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
#%# "
PROMPT="%{${fg[green]}%}[%~]%{${reset_color}%} $"


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# https://gihyo.jp/dev/serial/01/zsh-book/0005 
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# lsコマンドの補完候補にも色付き表示
# LS_COLORSを変えて、ディレクトリの背景色を見やすくする
LS_COLORS=$LS_COLORS:'ow=30;42:' ; export LS_COLORS
zstyle ':completion:*:default' list-colors ${LS_COLORS}
# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

########################################

# gitの表示いらないので消した
## vcs_info
#autoload -Uz vcs_info
#autoload -Uz add-zsh-hook
#
#zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
#zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
#
#function _update_vcs_info_msg() {
#    LANG=en_US.UTF-8 vcs_info
#    RPROMPT="${vcs_info_msg_0_}"
#}
#add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
#setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

## 同時に起動したzshの間でヒストリを共有する
#setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# []などの特殊文字を使用するときにno matches foundを出さないようにする
setopt nonomatch

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'
alias ls='ls --color=tty'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# git
alias g='git'

# kubectl
alias k='kubectl'

# python
alias python=/usr/bin/python3.6

# 下のaliasでpbcopyを使う
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
# vim:set ft=zsh:
#eval "$(pyenv virtualenv-init -)"
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PATH=~/scala-2.12.5/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#SSH
eval `ssh-agent` > /dev/null
ssh-add /home/ludwig125/.ssh/id_rsa >& /dev/null

# go のPATHを指定
export GOROOT=/usr/local/go
#export GOPATH=/home/$USER/go
export GOPATH=/mnt/c/wsl/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# go test alias
# https://dave.cheney.net/practical-go/presentations/gophercon-singapore-2019.html#_design_apis_that_are_hard_to_misuse
cover () {
  local t=$(mktemp -t cover)
  go test $COVERFLAGS -coverprofile=$t $@ \
    && go tool cover -func=$t \
    && unlink $t
}

# Docker for Windows
#export DOCKER_HOST='tcp://0.0.0.0:2375'
#export DOCKER_HOST=unix:///run/guest-services/docker.sock


# 出力結果からgrepを除外してIDなどを付与する
pss () {
    ps aux | grep -E "PID|$1" | grep -v grep
}

# open でWindowsがわのファイルを開く
# https://qiita.com/aohmusi/items/a46e3267ab506cedd1ad
if [[ $(uname -r) =~ Microsoft$ ]]; then
  function open(){
    if [ $# -eq 1 ]; then
      readlink -f $1 |xargs wslpath -m| xargs cmd.exe /c start
    else
      echo "ERROR: argument is missing."
      echo "Please specify file/path to execute by Windows"
      echo "open [file/path]"
    fi
  }
fi
alias -s {ppt,pptx,xls,xlsx,doc,docx}=open



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ludwig125/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ludwig125/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ludwig125/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ludwig125/google-cloud-sdk/completion.zsh.inc'; fi
