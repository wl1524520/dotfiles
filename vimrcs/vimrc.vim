" no vi compatible
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'alvan/vim-closetag'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'scrooloose/nerdtree'
"Plugin 'yegappan/mru'
"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'fatih/vim-go'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rust-lang/rust.vim'
"Plugin 'leafgarland/typescript-vim'
"Plugin 'tpope/vim-salve'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-sexp-mappings-for-regular-people'
"Plugin 'vim-scripts/VOoM'
"Plugin 'guns/vim-sexp'

" Looks and feel
Plugin 'itchyny/lightline.vim' " status line
Plugin 'morhetz/gruvbox'
"Plugin 'dracula/vim'
"Plugin 'sjl/badwolf'

" Assembly
" Plugin 'shirk/vim-gas'
" vim-easymotion
" Plugin 'easymotion/vim-easymotion'
" Plugin 'jceb/vim-orgmode'

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
"nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=5

" Avoid garbled characters in Chinese language windows OS

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files

"Always show current position
set ruler

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

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

" Add a bit extra margin to the left
"set foldcolumn=1

" title
set title
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

" show line number
set number

" remote terminal colors
" set termguicolors

" hilight cursor line
set cursorline

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    " colorscheme desert
    colorscheme gruvbox
catch
endtry

"nnoremap <silent> <leader>tt :exec 'colorscheme' (g:colors_name ==# 'gruvbox') ? 'github' : 'gruvbox'<CR>
"nnoremap <silent> <leader>tt :call Colorscheme_toggle()<CR>

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


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


""""""""""""""""""""""""""""""
" => window and tab commands
""""""""""""""""""""""""""""""
"set splitbelow
"set splitright

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: snippets ultisnips supertab settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping             = 0
let g:UltiSnipsExpandTrigger        = '<tab>'
let g:UltiSnipsJumpForwardTrigger   = '<tab>'
let g:UltiSnipsJumpBackwardTrigger  = '<s-tab>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = { 'colorscheme': 'wombat', }
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
