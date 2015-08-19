" 安裝 Vim Bundle Manager
set nocompatible			
" VIM 不使用和 VI 相容的模式

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
filetype plugin indent on
 
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" 
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" 編輯喜好設定

syntax on				
" 語法上色顯示

set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

set ruler				
" 顯示右下角設定值

set hlsearch		
" 設定高亮度顯示搜尋結果

" 自定義命令
" define OpenURL (OSX)
":command -bar -nargs=1 OpenURL :!open &ltargs&gt  
" define OpenURL (Windows)
":command -bar -nargs=1 OpenURL :!start cmd /cstart /b &ltargs&gt
" define OpenURL (Linux)
:command -bar -nargs=1 OpenURL :!firefox <targs>
" Keymaping
nmap \s :w<cr> 
nmap \q :q!<cr> 
nmap \f <C-f> " Maping '\f' to Ctrl-F (Page Down) for Mac
nmap \b <C-b> " Maping '\b' to Ctrl-B (Page Up) for Mac
nmap \d <C-d> " Maping '\d' to Ctrl-d (Half-Page Down) for Mac
nmap \u <C-u> " Maping '\u' to Ctrl-u (Half-Page Up) for Mac
nmap \r <C-r> " Maping '\r' to Ctrl-r (Redo) for Mac
nmap \w <C-w>w " Maping '\w' to Ctrl-w w (Window command) for Mac
