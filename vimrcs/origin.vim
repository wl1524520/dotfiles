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
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdtree'
"Plugin 'yegappan/mru'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'fatih/vim-go'
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'vim-scripts/VOoM'
Plugin 'guns/vim-sexp'
" Looks and feel
Plugin 'itchyny/lightline.vim' " status line
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'
Plugin 'sjl/badwolf'
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
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=5

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

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

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
"set foldcolumn=1

" title
set title
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

" show line number
set number

" remote terminal colors
set termguicolors

" hilight cursor line
set cursorline


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


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
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


""""""""""""""""""""""""""""""
" => window and tab commands
""""""""""""""""""""""""""""""
set splitbelow
set splitright
" tab in normal mode => last used buffer
nmap <tab> :b#<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


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

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" make binding
nnoremap <silent> <f9> :make<CR>:cw<CR>

" toggle close open error quick fix list
nnoremap <leader>ew :cw<CR>
nnoremap <leader>eo :copen<CR>
nnoremap <leader>ec :cclose<CR>

" close preview window / scratch window
nnoremap <leader>ep :only<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :call TrimWhitespace()<CR>
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" save yourself from accidental c-u and c-w
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: typescript settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" takes too long to save
"autocmd BufWritePost,FileWritePost *.ts call TypeScript_save()
function TypeScript_save()
    :silent :make
    :cw
endfunction

" rust settings
autocmd FileType rust call Rust_auto()
function Rust_auto()
    nnoremap <f9> :silent :!rustc %<CR>
    compiler cargo
    map <f10> :silent :make build<CR>
endfunction

" nvim terminal navigation key bindings
":tnoremap <Esc> <C-\><C-n>

" code jumps and tags
map <leader>t <C-]>

" copy and paste (xsel)
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
nmap <C-y> "+yy


" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: ycm settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_rust_src_path = '/usr/local/rust/src'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"uncomment to disable preview window
"set completeopt-=preview
" cycle with <C-N> and <C-P>
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" semantic triggers
let g:ycm_semantic_triggers = {
            \   'css': [ 're!^\s{4}', 're!:\s+' ],
            \ }
let g:ycm_semantic_triggers['typescript'] = ['.']
" key bindings
nnoremap <leader>ydl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ydf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>yde :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yrf :YcmCompleter GoToReferences<CR>
nnoremap <leader>yim :YcmCompleter GoToImplementation<CR>
nnoremap <leader>ydd :YcmCompleter GetDoc<CR>
nnoremap <leader>ygt :YcmCompleter GetType<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: snippets settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippets ultisnips supertab settings
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping             = 0
let g:UltiSnipsExpandTrigger        = '<tab>'
let g:UltiSnipsJumpForwardTrigger   = '<tab>'
let g:UltiSnipsJumpBackwardTrigger  = '<s-tab>'

" tex settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
function Tex_compile()
endfunction
autocmd FileType tex call Tex_auto()
function Tex_auto()
    "let b:tex_flavor = 'pdflatex'
    compiler tex
    setlocal makeprg=pdflatex\ \-shell-escape\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ '
    setlocal errorformat=%f:%l:\ %m
    "nnoremap <leader>r :silent :make %<CR>
    nnoremap <leader>r :Dispatch :silent :make %<CR>
    nnoremap <leader>j :cnext<CR>
    nnoremap <leader>k :cprev<CR>
    nnoremap <leader>v :Voom latex<CR>
endfunction

" voom settings
nnoremap <leader>v :Voom<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: ale settings - syntastics alternative - async
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%{ALEGetStatusLine()}
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 0
"let g:ale_open_list = 1
let g:ale_linters = {
            \   'javascript': [ 'eslint' ],
            \   'typescript': [ 'tslint' ],
            \   'css': [ 'prettycss' ],
            \   'php': [ 'php', 'phpcs' ],
            \   'html': [ 'htmlhint' ],
            \   'tex': [ '' ],
            \ }
let g:ale_php_phpcs_standard = "psr2"
"let g:ale_php_phpcs_standard = "--standard=psr2 -n --report=csv"
" key bindings
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: clojure vim-fireplace settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au Filetype clojure nnoremap <leader>rr :Require<cr>
autocmd FileType clojure call Clojure_auto()
function Clojure_auto()
    nnoremap <leader>rr :Require<cr>
    nnoremap <C-e> :Eval<Space>
    nnoremap <leader><leader> :Eval<CR>
    let b:AutoPairs = {"(": ")"}
endfunction

"quick fix window popup on make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: NERDTree settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exit Vim when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = { 'colorscheme': 'wombat', }
set noshowmode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin: easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" MRU settings
"let MRU_Max_Entries = 400
"map <leader>f :MRU<CR>

" bufExplorer settings
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

" Pmenu for menu colors
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
