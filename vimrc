"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: Wu Qiong <wuqiong4945@hotmail.com>
" Source: https://github.com/
" Version: 1.1 - 2017/08/01 (Aug 01) @ 16:14
"       Get this config, nice color schemes and lots of plugins!

" vim set foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:
" Setup language {{{ ==========================================================

" language en_US.UTF-8        " Solve some plugins incompatibilities

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if !has("win32")
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
else
	set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
	call vundle#begin('$VIM/vimfiles/bundle/')
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color schemes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

Plugin 'mhinz/vim-startify'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'
Plugin 'mbbill/undotree'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" A solid language pack for Vim
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'

Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
" Plugin 'klen/python-mode'

" For git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Icons
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","               " default is '\'
" map caps lock to escape
if !has("win32")
	autocmd VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
endif

let g:is_posix = 1              " vim's default is archaic bourne shell, bring it up to the 90s
set confirm                     " confirm when dispose unsaved/readonly file
set autochdir                   " set directory of current editing file as cwd
set autoread                    " auto read when a file is changed from the outside
set clipboard^=unnamed,unnamedplus      " use clipboard buffer
set hidden                      " can load a buffer in a window that currently has a modified buffer

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number		                	" line numbers on
" set relativenumber
set cursorline                  " highlight current line
set guioptions+=b               " show horizontal scroll bar

set wildmenu                    " show list instead of just completing
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap too
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set display+=lastline           " display as much as possible of a line

set mouse=a                     " enable mouse in GUI mode
set mousehide                   " hide mouse after chars typed
set mousemodel=popup            " pop menu after right click

" set showtabline=2               " always show tab line
set laststatus=2                " always show status line.

set shortmess=atI               " shortens messages
set showcmd                     " display an incomplete command in statusline

" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                       " enable syntax

" Choose color scheme and background according to time
let s:time = strftime("%H")
if s:time < 6 || s:time >= 18
	set background=dark
	colorscheme gruvbox
	" colorscheme solarized
else
	set background=light
	colorscheme PaperColor
	let g:airline_theme='papercolor'
	highlight Comment cterm=italic gui=italic
endif

" Allow to inverse background
function! ToggleBG()
	let s:tbg = &background
	if s:tbg == "dark"
		set background=light
	else
		set background=dark
	endif
endfunction
nnoremap <silent> <leader>bg :call ToggleBG()<CR>

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8              " set default encoding
scriptencoding utf-8            " utf-8 all the way
" set ambiwidth=double            " treat CJK ambiguous characters as wide
if !has("win32")
	set guifont=Fantasque\ Sans\ Mono\ 16
	set guifontwide=Noto\ Sans\ Mono\ CJK\ SC\ Regular\ 14
else
	set guifont=FantasqueSansMono_NF:h16
	set guifontwide=YouYuan:h16
endif

set fileformats=unix,dos,mac    " use Unix as the standard file type

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set writebackup
set noswapfile

" Show the textwidth visually
set colorcolumn=+1,+2

nnoremap <silent> <leader>do :DiffOrig<CR>
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
			\ | diffthis | wincmd p | diffthis

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions+=j            " delete comment character when joining commented lines
set autoindent                  " indent at the same level of the previous line
set smartindent                 " smart autoindenting when starting a new line
set cindent                     " c-style indent

set tabstop=2                   " tab size eql 2 spaces
set shiftwidth=2                " default shift width for indents
set softtabstop=2
set noexpandtab                 " don't replace tabs with ${tabstop} spaces
set smarttab                    " use tab at the beginning of line/section

set backspace=indent,eol,start  " backspace for dummies
set linebreak                   " not break word,is not used when the 'wrap' option is off

set nowrap                      " do not wrap long lines

" Allow to toggle wrap/nowrap
nnoremap <silent> <leader>wr :setlocal wrap!<CR>

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search and match {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch                   " show matching brackets
set matchtime=5                 " bracket blinking time
set ignorecase                  " be case insensitive when searching
set smartcase                   " be case sensitive when input has a capital letter
set hlsearch                    " highlight search
set incsearch                   " show matches while typing

" Clear search highlighting
nnoremap <silent> <leader>nh :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>
" Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
nnoremap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

nnoremap <C-h> :%s//g<left><left>

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimgrep searching and cope displaying {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimgrep and put the cursor in the right position
nnoremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
nnoremap <leader><space> :vimgrep // <C-r>%<C-a><right><right><right><right><right><right><right><right><right>

" Show the current list of errors
nnoremap <leader>er :botright cope<CR>
nnoremap <leader>n  :cnext<CR>
nnoremap <leader>p  :cprevious<CR>
" map <Leader>p :set paste<CR>o<esc>"+]p:set nopaste<cr>

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fold {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable                  " turn on folding
set foldmethod=indent           " fold method
set foldlevel=100               " don't autofold anything

" Use space to open/close fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright                  " puts new vsplit windows to the right of the current
set splitbelow                  " puts new split windows to the bottom of the current

set viminfo^=!                  " save and restore global variables that start with an uppercase letter

" Buffers
nnoremap <C-Tab>    :bnext<CR>
nnoremap <C-S-Tab>  :bprevious<CR>
nnoremap <C-q>      :lclose<CR>:bdelete<CR>
nnoremap <leader>ba :%bdelete<CR>
" Close error window automatically when :bdelete it
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" Use the arrows to something usefull
nnoremap <up>       :Errors<CR>
nnoremap <down>     :lclose<CR>
nnoremap <left>     :bprevious<CR>
nnoremap <right>    :bnext<CR>

" Quickly open a buffer for scribble
nnoremap <leader>q  :e ~/buffer<cr>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab

" Useful mappings for managing tabs
nnoremap <leader>co ggVGy:tabnew<CR>:set syntax=qf<CR>pgg
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove
" Opens a new tab with the current buffer's path
nnoremap <leader>te :tabedit <C-r>=expand("%:p:h")<CR>/

" Return to last edit position when opening files
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk]
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" Moving fast to front, back and 2 sides
inoremap <M-$> <ESC>$a
inoremap <M-^> <ESC>^i
inoremap <M-0> <ESC>0i
inoremap <M-l> <right>

set listchars=tab:\┊\ ,trail:~,extends:>,precedes:<,nbsp:+,space:␣,eol:⇚
" Toggle display unprintable characters
nnoremap <silent> <F5> :setlocal list!<CR>

" Toggle paste mode on and off
nnoremap <silent> <leader>pp :setlocal paste!<CR>

nnoremap <F12> gg=G<C-o><C-o>
nnoremap <C-j> gEa<CR><ESC>ew   " split line(opposite to S-J joining line)
nnoremap <C-CR> A<CR><ESC>
inoremap <C-CR> <ESC>o

" Toggle spell checking
nnoremap <silent> <leader>ss :setlocal spell!<CR>

" Fast saving
nnoremap <C-s> :w<cr>
nnoremap <leader>w :w<cr>

" Insert current date and time
inoremap <C-z> <C-R>=strftime("%Y/%m/%d (%b %d) @ %H:%M")<CR>
" nnoremap <C-z> "=strftime("%Y/%m/%d (%b %d) @ %H:%M")<CR>p

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <silent> <leader>dm mmHmt:%s/<C-v><CR>//ge<CR>'tzt'm

" Remove trailing whitespaces
nnoremap <silent> <leader>dt :%s/\s\+$//<CR>

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype generic {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""xml {{{""""""""""""""""""""""""""""""""""""""""""
" Don't delete comment character when joining commented lines
autocmd FileType xml setlocal formatoptions-=j
" Format xml file
nnoremap <silent> <leader>xx ggvGJ:silent 1,$!xmllint --format --recover - 2>/dev/null<CR>

" }}}

"""""""""""""""python {{{"""""""""""""""""""""""""""""""""""""""
autocmd FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python nnoremap <leader>r :!python %<CR>

let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint']

" }}}

"""""""""""""""others {{{"""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.b2v setfiletype cpp

" }}}

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins  {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""startify {{{"""""""""""""""""""""""""""""""""""""
let g:startify_bookmarks = ['~/.vimrc', '$VIM/_vimrc']

" }}}

"""""""""""""""airline {{{""""""""""""""""""""""""""""""""""""""
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Use powerline symbol setting, need related font
let g:airline_powerline_fonts = 1

" }}}

"""""""""""""""nerdtree {{{"""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F1> :NERDTreeToggle %:p:h<CR>
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}

"""""""""""""""nerdtree syntax highlight {{{""""""""""""""""""""

" }}}

"""""""""""""""ctags {{{""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :TagbarToggle<CR>

" }}}

"""""""""""""""nerdcommenter {{{""""""""""""""""""""""""""""""""
" A space added after/before the left/right delimiter
let g:NERDSpaceDelims = 1

" }}}

"""""""""""""""undotree {{{"""""""""""""""""""""""""""""""""""""
" Use :UndotreeToggle to toggle the undo-tree panel
nnoremap <silent> <leader>uu :UndotreeToggle<cr>

" }}}

"""""""""""""""fugitive {{{"""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff 

" }}}


"""""""""""""""gitgutter {{{""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gg :GitGutterToggle<CR>

" }}}

"""""""""""""""gitv {{{"""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1

" }}}

"""""""""""""""indentLine {{{"""""""""""""""""""""""""""""""""""
nnoremap <silent> <F6> :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'

" }}}

"""""""""""""""vim devicons {{{"""""""""""""""""""""""""""""""""
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" }}}

"""""""""""""""tabular {{{""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-t> :call <SID>align()<CR>
function! s:align()
	let c = nr2char(getchar())
	exec 'Tabularize/'.c.'/l1'
	echo 'Tabularize/'.c.'/l1'
endfunction

" }}}

"""""""""""""""syntastic {{{""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
" Automatically closed when no errors, not opened automatically
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Make the error window smaller if fewer than 10 errors are found
function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 10])
	endif
endfunction

" }}}

"""""""""""""""vim-javascript {{{"""""""""""""""""""""""""""""""
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" }}}

"""""""""""""""vim-go {{{"""""""""""""""""""""""""""""""""""""""
" By default syntax-highlighting for Functions, Methods and Structs is disabled
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" By default vim-go shows errors for the fmt command, to disable it
let g:go_fmt_fail_silently = 1
" Don't show the identifier information when completion is done 
let g:go_echo_go_info = 0

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Using with Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" }}}

"""""""""""""""neosnippet {{{"""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" }}}

"""""""""""""""neocomplete {{{""""""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" }}}

" }}}
