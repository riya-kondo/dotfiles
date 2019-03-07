# proxy設定
source ${HOME}/.proxy_setup

# 文字コードをUTF-8に設定
export LANG=ja_JP.UTF-8

# PROMPT変数の中の変数参照をプロンプト表示時に展開する。
setopt prompt_subst

# ディレクトリ名だけの入力で移動
setopt auto_cd
# pushdの自動実行
setopt auto_pushd
# pushdの重複を無視
setopt pushd_ignore_dups
# 正しいコマンドの提示
setopt correct
# ctrl+Dでログアウトしない
setopt ignore_eof

# 補完をオンにする。
# autoload: シェル関数の自動読み込み
# -U: compinit展開時にユーザ定義のaliasを展開しない
# -z: zsh形式で関数を読み込む
# -C: セキュリティチェックのスキップ
autoload -Uz compinit && compinit -C

# 色の読み込み
autoload -Uz colors && colors

# 補完候補のグループ化
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

# 補完メニューの表示方法
zstyle ':completion:*:default' menu select=2

# 補完メニューの色付け
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 曖昧補完
# m: 小文字と大文字の補完
# r: -_.の前にワイルドカードがあるとして補完
# +m: 追加で大文字を小文字に変えてみて補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z} r:|[-_.]=**'

# 補完候補
# _complete: 補完する
# _match: globを展開しないで補完一覧から補完
# _history: historyのコマンドも補完候補
# _approximate: 似ている候補も補完候補にする
# _prefix: カーソル意向を無視してカーソル位置まで補完
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history

# 補完候補のキャッシュ
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${HOME}/zsh/compcache"

# カーソル位置で補完
setopt complete_in_word
# 補完後に末尾へ移動
setopt always_to_end
# 補完候補があるとき一覧表示
setopt auto_list
setopt auto_menu
# パスの補完
setopt auto_param_slash
setopt mark_dirs
# 引数の=以下も補完
setopt magic_equal_subst
# スクロールを避ける
setopt always_last_prompt

# ヒストリー
export HISTFILE="${HOME}/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
# 重複は保存しない
setopt hist_ignore_dups
setopt hist_ignore_all_dups
# 空白を削除して保存
setopt hist_reduce_blanks
# historyコマンド自体を保存しない
setopt hist_no_store
# シェルごとに履歴共有
setopt share_history
# 時刻も記録
setopt extended_history
# 複数のzsh起動時など、historyに上書きではなく追加する
setopt append_history

# fzfによるヒストリーの検索
# function select-history() {
#   BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
#   CURSOR=$#BUFFER
# }
# zle -N select-history
# bindkey '^r' select-history

# historyからの検索
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# historyからの補完
autoload -Uz history-search-end
# zle -N: arg2関数をarg1ウィジェットとして登録 
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# キーのバインド
bindkey '^p' history-beginning-search-backward-end
bindkey '^b' history-beginning-search-forward-end


# git設定
# フック関数を登録する関数のロード
autoload -Uz add-zsh-hook
# バージョン管理システム用関数のロード
autoload -Uz vcs_info
# コミットされていないファイルがあるかどうかの監視
zstyle ':vcs_info:git:*' check-for-changes true
# addだけされているファイルがあるときformatsの%cに文字列を格納
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# addされていない変更ファイルがあるときformatsの%uに文字列を格納
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# ${vcs_info_msg_0_}で表示する内容を指定(%bはブランチ名)
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
# rebase途中やconflictの発生時などにformatsの代わりに格納される文字列(%aはアクション名)
zstyle ':vcs_info:*' actionformats "[%b|%a]%c%u"
# precmdによってプロンプト表示前にvcs_infoが情報を取得する
_vcs_precmd () { vcs_info }
# _vcs_precmdをフック関数として登録
add-zsh-hook precmd _vcs_precmd
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%D %*) "
PROMPT=$PROMPT'${vcs_info_msg_0_}'
PROMPT=$PROMPT' %~
%# '

# エイリアス
alias zshconfig="vi ~/.zshrc"
alias vi='vim'
alias so="source"

# OS毎の設定
case ${OSTYPE} in
  darwin*)
    bindkey '^[[A' history-beginning-search-backward-end
    bindkey '^[[B' history-beginning-search-backward-end
    alias ls="ls -G"
    alias la="ls -lAh"
    # cdの後にlsの実行
    chpwd() { la -G}
  ;;
  linux*)
    bindkey '^[OA' history-beginning-search-backward-end
    bindkey '^[OB' history-beginning-search-forward-end
    alias ls="ls --color=auto"
    alias la="ls -la --color=auto"
    chpwd() { ls -lth --color=auto }
  ;;
esac
