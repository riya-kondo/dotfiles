" シンタックスハイライトをオン
syntax on
"行番号表示"
set number
"自動インデント"
set smartindent
"タブを半角スペースで挿入"
set expandtab
"行頭でのタブをスペース2つ分にする"
set shiftwidth=2
"行頭以外のtabでスペース2つ"
set tabstop=2
"連続した空白に対して戻る数"
set softtabstop=2
"jjでコマンドラインモードに移行"
inoremap jj <Esc>
"バックスペースキーの有効化"
set backspace=indent,eol,start
"カーソルの回り込みをオンにする"
set whichwrap=b,s,h,l,<,>,[,],~
"エンコーディング"
set encoding=utf-8
"書き込み時のエンコーディング"
set fileencoding=utf-8
"読み込み時のエンコーディング(左から)"
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
"スワップファイルを作成しない設定と変更時自動読込設定"
set noswapfile
set autoread
"検索語をハイライト"
set hlsearch
"ESC2回押すとハイライト解除"
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"強調表示"
set cursorline
set cursorcolumn
"xで文字切り取り時にレジスタを更新しない"
"(内容を保持するレジスタを指定している)"
noremap PP "0p
noremap x "_x

"vimで生成した時にテンプレートで作成する"
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt

"カラースキームの指定(~/.vim/colors/)"
set t_Co=256
colorscheme molokai

"ステータスラインの表示"
set laststatus=2
"ファイルナンバー表示"
set statusline=[%n]
"ファイル名表示"
set statusline+=%<%F
"変更チェック表示"
set statusline+=%m
"読み込み専用かの表示"
set statusline+=%r
"ファイルタイプの表示"
set statusline+=%y
"以下は右寄せに表示"
set statusline+=%=
"ファイルフォーマット表示"
set statusline+=[%{&fileformat}]
"文字コード表示"
set statusline+=[%{has('multi_byte')&&\&fenc!=''?&fenc:&encoding}]
"全体行中の行数表示"
set statusline+=[ROW=%l/%L]
set statusline+=[COLUMN=%c]
