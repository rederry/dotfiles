"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting
nmap <leader>e :q<cr>
nmap <leader>E :qa<cr>

" set backspace work as usual
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Disaplay line number
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
nmap <leader>s :set synmaxcol=100

" Enable 256 colors
set t_Co=256

try
    colorscheme molokai
catch
endtry

" Highlight python self keyword
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end

set background=dark

" Set popup menu color(must set after background)
" hi Pmenu ctermbg=gray

" Set search highlight color
hi Search ctermbg=LightYellow
hi Search ctermfg=Black

hi Visual term=reverse cterm=reverse 

" Change cursor shape in different modes
" Insert Replace Normal
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" YAML indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Use system clipboard
set clipboard=unnamed
" noremap <Leader>y "*y
" noremap <Leader>p "*p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>bd :bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>tt :tabnext 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
" set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Quick set mouse mode 
nmap <leader>m :set mouse=a<cr>
nmap <leader>nm :set mouse=<cr>


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>q :e<cr>
map <leader>vc :e ~/.vimrc<cr>
map <leader>so :so $MYVIMRC<cr>
nmap <silent> <leader>d <Plug>DashSearch

set updatetime=1000

nmap <leader>o o<ESC>k
nmap <leader>O O<ESC>j

" Toggle paste mode
set pastetoggle=<F2>

" Code fold
set foldlevel=99
set foldmethod=indent
nnoremap <leader><space> za

" Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree
" map <leader>t :NERDTreeToggle<cr>
map <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast jump 
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR> 
set tags=./tags;/

" YCM will use the first python executable it finds in the PATH to run jedi. 
" This means that if you are in a virtual environment and you start vim in that directory, 
" the first python that YCM will find will be the one in the virtual environment
let g:ycm_python_binary_path = 'python'

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_seed_identifiers_with_syntax=1

" List like IDE
" set completeopt=longest,menu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

let g:syntastic_auto_loc_list = 1
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"

nmap <F8> :SyntasticCheck<cr>
nmap <leader><F8> :SyntasticReset<cr>
nmap <leader>n :lnext<cr>
nmap <leader>p :lprevious<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ACK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :Ack 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IndentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┊'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt=filler,vertical
nmap <leader>gd :Gvdiff<cr>
nmap <leader>gst :Gstatus<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undo-tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :UndotreeToggle<cr>
nmap <leader>ut :UndotreeFocus<cr>

" Persistent undo
if has("persistent_undo")
    set undodir=~/.vim/.undodir/
    set undofile
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar/TaskList
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_sort = 0

let g:tlWindowPosition = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ghp <Plug>GitGutterPreviewHunk
nmap ghs <Plug>GitGutterStageHunk
nmap ghu <Plug>GitGutterUndoHunk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'nvie/vim-flake8'
Plug 'rizzatti/dash.vim'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'

call plug#end()
