" ----------------------------------------------------
" 基本的な設定
" ----------------------------------------------------
set nocompatible  "viとの互換性をとらない(vimの独自拡張機能を使う為)

set paste

" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" 自分で追加 "(タブ、空白を明示する)
set nolist

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチを使わない
"set noincsearch
" インクリメンタルサーチ
set incsearch

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示しない
set nonumber
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=blue
" コマンドライン補完を拡張モードにする
set wildmenu

highlight light ctermbg=white ctermfg=white guibg=blue guifg=white



" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=

"カラースキーマを設定
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

"" ステータスラインの色
""highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
"
""ここから追加
"hi Function ctermfg=darkgreen
"
"hi Repeat ctermfg=darkgreen
"
"hi String ctermfg=darkmagenta
"
"hi Number ctermfg=darkmagenta
"
"hi Boolean ctermfg=darkmagenta
"
"hi Cursor ctermfg=gray
"
""Commentでコメント文の色を変える
"hi Comment ctermfg=darkgray
"
"hi Constant term=underline ctermfg=blue
"
"hi Special ctermfg=blue
"
""hi Identifier term=underline ctermfg=white
"
""Statementでif、forなどの色を変える
"hi Statement ctermfg=darkblue
"
"hi PreProc term=underline ctermfg=darkgreen
"
"hi Type term=underline ctermfg=darkgreen
"
"hi Underlined term=underline cterm=underline ctermfg=darkcyan
"
"hi Ignore ctermfg=blue
"
"hi Error term=bold ctermbg=darkmagenta ctermfg=black
"
"hi Todo term=bold ctermfg=black ctermbg=darkcyan
"
"hi Pmenu ctermbg=black ctermfg=gray
"
"hi PmenuSel ctermbg=darkcyan ctermfg=black
"
"hi PmenuSbar ctermbg=darkred
"
"hi PmenuThumb cterm=reverse ctermfg=gray
"
"hi TabLine term=underline cterm=underline ctermfg=gray ctermbg=darkred
"
"hi TabLineSel term=bold
"
"hi TabLineFill term=reverse cterm=reverse
"
"hi MatchParen term=reverse ctermfg=brown ctermbg=darkcyan
"
"hi SpecialKey term=bold ctermfg=gray
"
"hi NonText term=bold ctermfg=blue
"
"hi Directory term=bold ctermfg=brown
"
"hi ErrorMsg ctermbg=darkmagenta ctermfg=black
"
"hi IncSearch term=reverse cterm=reverse ctermfg=brown ctermbg=black
"
"hi Search term=reverse ctermfg=black ctermbg=brown
"
"hi MoreMsg term=bold ctermfg=darkgreen
"
"hi ModeMsg term=bold ctermfg=darkmagenta
"
"
"
""LineNrで行番号の色を変える
"hi LineNr term=underline ctermfg=blue
"
"hi Question term=bold ctermfg=blue
"
""hi StatusLine term=bold,reverse cterm=reverse ctermfg=blue ctermbg=black
"hi StatusLine term=BOLD,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=BOLD guibg=#56A0EE guifg=white
"
"hi StatusLineNC term=bold,reverse cterm=reverse ctermfg=Green ctermbg=Gray
"
"hi VertSplit ctermfg=black ctermbg=darkred term=reverse cterm=reverse
"
"hi Title ctermfg=gray
"
"hi Visual term=reverse cterm=reverse ctermfg=darkcyan ctermbg=black
"
"hi VisualNOS term=bold,underline ctermfg=darkcyan ctermbg=black
"
"hi WarningMsg term=bold ctermfg=darkmagenta
"
"hi WildMenu term=bold ctermfg=black ctermbg=darkcyan
"
"hi Folded ctermbg=darkcyan ctermfg=black
"
"hi FoldColumn ctermbg=darkcyan ctermfg=black
"
"hi DiffAdd    ctermfg=black ctermbg=2
"hi DiffChange ctermfg=black ctermbg=3
"hi DiffDelete ctermfg=black ctermbg=6
"hi DiffText   ctermfg=black ctermbg=7
"
"hi SignColumn term=bold ctermfg=black ctermbg=darkcyan



"ここまで


"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
set noautoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使う
"set expandtab

"(自分で追加)タブ押下時にスペース挿入
set expandtab

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8
"set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
"set fileencodings+=,ucs-2le,ucs-2,utf-8
set fileformats=unix,dos,mac
"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I




"----------------------------------------------------
" 独自設定
"----------------------------------------------------
" スクロール時の余白確保
set scrolloff=5
" 他で書き換えられたら自動で読み直す
set autoread
" 行番号表示
set number

" インデント
set noautoindent
set nosmartindent
set nocindent
"set noexpandtab " タブをスペースに展開しない
"set expandtab " タブをスペースに展開する
set noexpandtab

"filetype off "これをしないとnoautoindentしても勝手にインデントされるらしい
"filetype plugin indent off

" コマンド補完を開始するキー
set wildchar=<tab>

set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする

" キーバインド関係
" 行単位で移動(1行が長い場合に便利)
nnoremap j gj
nnoremap k gk
noremap! ^? ^H

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" タグジャンプ
" http://qiita.com/tutu/items/fbc4023ebc3004964e86
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
set tags=./tags;

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
 
" 今後以下に追加のプラグインを書く"
" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
" Tagbarのキーマッピング
nmap <F8> :TagbarToggle<CR>

" fugitive
NeoBundle 'tpope/vim-fugitive'

" vim-go
NeoBundle 'fatih/vim-go'
"let g:go_version_warning = 0
"let g:go_bin_path = $GOPATH.'/bin'
"filetype plugin indent on
"let g:go_fmt_autosave = 0


call neobundle#end()
 
" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

" gocode
" https://qiita.com/uchiko/items/4c186292f007535116cc
" http://mattn.kaoriya.net/software/vim/20130531000559.htm
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
