"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: Wu Qiong <wuqiong4945@hotmail.com>
" Source: https://github.com/
" Version: 2.0 - 2017/11/04 (Nov 04) @ 01:46
"       Get this config, nice color schemes and lots of plugins!

" vim set foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:
" Setup language {{{ ==========================================================

" language en_US.UTF-8        " Solve some plugins incompatibilities

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("win32")
	call plug#begin('~/.vim/plugged')
else
	call plug#begin('$VIM/vimfiles/plugged')
endif

" Color schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim'
" Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'

Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
Plug 'Chiel92/vim-autoformat'

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Plug 'Shougo/neocomplete'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-go', { 'do': 'make',  'for': 'go' }
Plug 'zchee/deoplete-jedi', { 'for': 'py' }

Plug 'w0rp/ale'
" Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'

Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'mattn/emmet-vim'

" For git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

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
set completeopt+=noselect

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number											" line numbers on
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

let g:PaperColor_Theme_Options = {'theme':{'default':{'allow_italic':1}}}
" Choose color scheme and background according to time
let s:time = strftime("%H")
if s:time > 6 && s:time <= 18
	set background=light
	colorscheme PaperColor
else
	set background=dark
	colorscheme dracula
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

filetype plugin on

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
nnoremap <down>     :cclose<CR>
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

" }}}

"""""""""""""""python {{{"""""""""""""""""""""""""""""""""""""""
" autocmd FileType python set tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python nnoremap <leader>r :!python3 %<CR>

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

"""""""""""""""ale {{{""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" }}}

"""""""""""""""autoformate {{{""""""""""""""""""""""""""""""""""
noremap <silent> <F4> :Autoformat<CR>
" au BufWrite * :Autoformat

" }}}

"""""""""""""""deoplete {{{"""""""""""""""""""""""""""""""""""""
" Skip the check of neovim module
let g:python3_host_skip_check = 1
" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

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

let g:Gitv_OpenHorizontal = 0
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

"""""""""""""""vim_easy_align {{{"""""""""""""""""""""""""""""""
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

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
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

autocmd FileType go nmap <Leader>i <Plug>(go-info)

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" By default vim-go shows errors for the fmt command, to disable it
let g:go_fmt_fail_silently = 1
" Don't show the identifier information when completion is done
" let g:go_echo_go_info = 0
let g:go_auto_type_info = 1
" Automatically highlight matching identifiers
let g:go_auto_sameids = 1

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

" }}}
