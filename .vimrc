"
" tsj.july@gmail.com
"

" vundle setting
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'

Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

try
	colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
	" skip
endtry

set visualbell

set backspace=indent,eol,start

set number		" line number
"set numberwidth=6	" line number width, not works
set nowrap
set ruler		" show the cursor position all the time

" colorcolumn
set colorcolumn=80

" status bar
set ls=2		" last status 2 row

set statusline=

set statusline+=%m "modify

set statusline+=%r "readonly

" style : [unix/utf-8(BOM)]
set statusline+=[
set statusline+=%{&ff} "eol
set statusline+=/ "delimiter
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''} "encoding
set statusline+=%{(&bomb?\"(BOM)\":\"\")} "BOM
set statusline+=]

set statusline+=\ "separator

" style : [go]
set statusline+=%y "syntax

set statusline+=\ "separator

" style : (master)
set statusline+=(
set statusline+=%{fugitive#head()}
set statusline+=)

set statusline+=%=

set statusline+=%l-%L:
set statusline+=%2c

set statusline+=\ "separator

set statusline+=(%2P)

set statusline+=\ "separator
set statusline+=[%f]

" recommend 
set wildmenu		" in Tab auto complete, show list
set showcmd		" display incomplete commands

" search
set incsearch		" do incremental searching
set hlsearch		" highlight search
set ignorecase		" ignore case
set smartcase		" if a pattern contains an uppercase letter,
			" it is case sensitive

" indent
set autoindent		" always set autoindenting on
set cindent
set smartindent

" backup
set nobackup
" or backup
" set backupdir=~/backup
" set dir=~/backup/swap
set history=1024

syntax enable

" encoding
set fencs=ubs-bom,utf-8,korea
"set fileencoding=utf-8

" eol
set ffs=unix,dos,mac
"set ff=unix

" GUI
if has("gui_win32")
	set guioptions+=b
	set guifont=DejaVu_Sans_Mono:h14
	set clipboard=unnamed "share clipboard 
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
elseif has("gui_macvim")
	set guioptions+=b
	set guifont=Menlo:h14
	set clipboard=unnamed "share clipboard 
	set columns=120
	set lines=40
endif

" key mapping

" tab
" can use tab and shift + tab in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" reference: http://blog.dokenzy.com/archives/1700
" for splitting tab
noremap ff <C-w><C-w>

" map function keys
map <F2> :tabe <BAR> :NERDTreeToggle <CR>
map <F3> :Gstatus <CR>
map <F4> :Gvdiff <CR>

au FileType go map <F7> :vs <BAR> :GoDef <CR>
au FileType go map <F8> :GoDocBrowser <CR>

" F11 execute
if has("gui_win32")
	au FileType dosbatch map <F11> :!% <CR>
	au FileType html map <F11> :!explorer % <CR>
elseif has("gui_macvim")
	au FileType sh map <F11> :!./% <CR>
	au FileType html map <F11> :!open -a /Applications/Safari.app % <CR>
elseif has("unix")
	au FileType sh map <F11> :!./% <CR>
endif

au FileType ruby map <F11> :!ruby % <CR>
au FileType python map <F11> :!python % <CR>
au FileType go map <F11> :!go run % <CR>

" tab size
au FileType ruby set tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType python set tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType html set tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType javascript set tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType php set tabstop=4 expandtab shiftwidth=4 softtabstop=4

let g:go_fmt_command = "goimports"
let g:NERDTreeQuitOnOpen=1

" starts up with NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" SwapExists 
"au SwapExists * let v:swapchoice = 'o'

