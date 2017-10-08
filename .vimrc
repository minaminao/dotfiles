call plug#begin('~/.vim/plugged')
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'jiangmiao/simple-javascript-indenter'
" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'
call plug#end()

set encoding=utf-8
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
" インデントに対応する空白の数
set shiftwidth=2

set autoindent
set smartindent

" set backspace=indent,eol,start

set title
set ruler

" 行数を表示
set number
" カーソル行を目立たせる
set cursorline

" 検索結果をハイライト
set hlsearch
" インクリメンタルサーチ（即座に検索）
set incsearch
" 検索ワードの大文字小文字を区別しない
set ignorecase
" 検索ワードに大文字が含まれていたら大文字小文字を区別する
set smartcase

" 行末で一文字分余分に右移動できる
set virtualedit=onemore
" set showcmd

" 行頭行末の左右移動で行をまたぐ
set whichwrap&
set whichwrap+=h,l,<,>,[,],b,s

" set clipboard&
" set clipboard^=unnamedplus

" 上下n行の視界を確保
set scrolloff=8

" 外部でファイルが変更された場合は読み直す
set autoread

" statusline の表示 0:常に非表示 1: 2つ以上のファイルが開かれていたら表示 2: 常に表示
set laststatus=2

" 挿入モードから抜けるとIMEをオフ
" set imdisable

" バックアップをとらない
set nobackup

" clang-format の設定
if executable('clang-format-3.9')
  " clang-format からclang-format-3.9 へ
  let g:clang_format#command = 'clang-format-3.9'
  " 保存時に自動でフォーマット
  autocmd FileType c ClangFormatAutoEnable
endif

" vim-indent-guides を起動時に on
let g:indent_guides_enable_on_vim_startup = 1
