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
nmap <leader>qq :qa<cr>

nmap <space><space> :Commands<cr>

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
    autocmd FileType python
                \   syn keyword pythonCls cls
                \ | highlight def link pythonCls Special
augroup end

set background=dark

" Set popup menu color(must set after background)
" hi Pmenu ctermbg=gray

" Set search highlight color
hi Search ctermbg=LightYellow
hi Search ctermfg=Black

hi Visual term=reverse cterm=reverse 

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

set ai "Auto indent
set si "Smart indent
nmap <leader>lb :set wrap!<cr>

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
"set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" map 0 ^

" Quick set mouse mode 
nmap <leader>mm :set mouse=a<cr>
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
nmap <silent> <leader>d :Dash<cr>

set updatetime=1000

" Toggle paste mode
set pastetoggle=<F2>

" Code fold
set foldlevel=99
set foldmethod=indent
"nnoremap <leader><space> za

" Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree
map <F3> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc','\~$','\.swp','__pycache__']
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDDefaultAlign = 'left'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast jump 
if !has('nvim')
    nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR> 
    nnoremap <leader>t :tab split \| YcmCompleter GoToDefinition<CR>
endif
set tags=./tags;/

"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_python_interpreter_path = 'python'
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \]
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


" YCM will use the first python executable it finds in the PATH to run jedi. 
" This means that if you are in a virtual environment and you start vim in that directory, 
" the first python that YCM will find will be the one in the virtual environment
"let g:ycm_python_binary_path = 'python'

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_seed_identifiers_with_syntax=1

" List like IDE
" set completeopt=longest,menu

" Django recommend
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

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
" => ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <C-m> <Plug>(ale_previous)
nmap <silent> <C-n> <Plug>(ale_next)
let g:ale_linters = {
	\ 'go': ['gopls'],
	\}
let g:ale_python_pylint_options = '--load-plugins pylint_django'
if has('nvim')
    let g:ale_disable_lsp = 1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <c-p> :FZF<cr>
nmap <leader>fb :Buffers<cr>
" Git files (git ls-files)
nmap <leader>fg :GFiles<cr>
" ag search result (ALT-A to select all, ALT-D to deselect all)
nmap <leader>ff :Ag<cr>
" Command history
nmap <leader>fh :History:<cr>
" Search history
nmap <leader>fs :History/<cr>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IndentLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┊'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt=filler,vertical
nmap <leader>gd :Gvdiff<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>dp :diffput<cr>
nmap <leader>dg :diffget<cr>

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
" => vim-signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default updatetime 4000ms is not good for async update
set updatetime=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go recommand
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>a :cclose<CR>
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

nmap <M-n> :cnext<CR>
nmap <M-m> :cprevious<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" would be slow
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_def_mode = 'gopls'

let g:go_rename_command = 'gopls'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
if !has('nvim')
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer --clang-completer' }
    Plug 'SirVer/ultisnips'
endif
if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
endif
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'nvie/vim-flake8'
Plug 'rizzatti/dash.vim'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'jceb/vim-orgmode'
Plug 'posva/vim-vue'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'triglav/vim-visual-increment'
Plug 'easymotion/vim-easymotion'

call plug#end()
