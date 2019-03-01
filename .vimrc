" シンタックスハイライトをオン
syntax on
"行番号表示"
set number
"自動インデント"
set autoindent
"tabでスペース2つ"
set tabstop=2
"タブを半角スペースで挿入"
set expandtab
"自動生成するタブをスペース2つ分にする"
set shiftwidth=2
"jjでコマンドラインモードに移行"
inoremap jj <Esc>
"バックスペースキーの有効化"
set backspace=indent,eol,start
"カーソルの回り込みをオンにする"
set whichwrap=b,s,h,l,<,>,[,],~

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
