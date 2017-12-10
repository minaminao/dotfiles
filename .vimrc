" vim-plug
call plug#begin('~/.vim/plugged')

" 外観
" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
" statusline を powerline 風に
Plug 'itchyny/lightline.vim'
" インデントを見やすく
Plug 'nathanaelkane/vim-indent-guides'

" 構文チェック
" Plug 'scrooloose/syntastic'

" format
" C/C++/Java/JavaScript/Objective-C/Protobuf
Plug 'rhysd/vim-clang-format'

" ファイルツリー
Plug 'scrooloose/nerdtree'

" Ruby
" end を自動入力
Plug 'tpope/vim-endwise'

" Python
" Plug 'davidhalter/jedi-vim'

" JavaScript
Plug 'pangloss/vim-javascript'

" Git
Plug 'tpope/vim-fugitive'

" その他
Plug 'kana/vim-operator-user'

call plug#end()

set encoding=utf-8
set fileencodings=utf-8,cp932
syntax on 

" 色数
" 環境変数 $TERM の値が自動的に設定される
" set t_Co=256

set background=dark
colorscheme jellybeans

" Tab を空白にする
set expandtab
" Tab が対応する空白の数
set tabstop=2
" Tab を空白にし、インデントをバックスペースした時に空白2文字分消せるようにする
set softtabstop=2
" 読み込み時のインデントに対応する空白の数
set shiftwidth=2

set autoindent
set smartindent

" バックスペースで消せる文字
set backspace=indent,eol,start

" ファイル名を表示
set title
" ルーラーを表示
set ruler

" 行数を表示
set number
" カーソル行を目立たせる
set cursorline
" 対応する括弧を強調
set showmatch

" 検索結果をハイライト
set hlsearch
" インクリメンタルサーチ（即座に検索）
set incsearch
" 検索ワードの大文字小文字を区別しない
set ignorecase
" 検索ワードに大文字が含まれていたら大文字小文字を区別する
set smartcase
" 最後まで検索を終えたら先頭へ戻る
set wrapscan

" 行末で一文字分余分に右移動できる
set virtualedit=onemore

" 行頭行末の左右移動で行をまたぐ
set whichwrap&
set whichwrap+=h,l,<,>,[,],b,s

" set clipboard&
" set clipboard^=unnamedplus

" 入力中のコマンドを表示
set showcmd

" 上下n行の視界を確保
set scrolloff=8

" 外部でファイルが変更された場合は読み直す
set autoread

" statusline の表示 0:常に非表示 1: 2つ以上のファイルが開かれていたら表示 2: 常に表示
set laststatus=2

" 挿入モードから抜けるとIMEをオフ
" set imdisable

" backupファイルとswapファイルの保存先を変更
if !isdirectory('vimtmp')
  call system('mkdir ~/vimtmp')
endif
set directory=~/vimtmp
set backupdir=~/vimtmp

" clang-format の設定
if executable('clang-format-3.9')
  " clang-format からclang-format-3.9 へ
  let g:clang_format#command = 'clang-format-3.9'
  " 保存時に自動でフォーマット
  autocmd FileType c,cpp,objc,java,javascript ClangFormatAutoEnable
endif

" vim-indent-guides を起動時に on
let g:indent_guides_enable_on_vim_startup = 1

" 自動でコメントアウトしない
autocmd Filetype * set formatoptions-=c fo-=o fo-=r

" キーマッピング
" 行移動を直感的に
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" 行頭行末移動を楽に
noremap <Space>h ^
noremap <Space>l $

" set mouse=a

" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

" 全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

vnoremap * "zy:let @/ = @z<CR>n

