" VIMRC inspiration from:  https://amix.dk/vim/vimrc.html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins using Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required by Vundle
set nocompatible
filetype off

" recognize file specific settings
set modeline
set modelines=5

" Runtime path, include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'adoy/vim-php-refactoring-toolbox'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'bling/vim-airline'
Plugin 'docteurklein/vim-symfony'
Plugin 'elzr/vim-json'
Plugin 'gmarik/vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'joonty/vim-sauce'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'msanders/snipmate.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'sirver/ultisnips'
Plugin 'stanangeloff/php.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tobys/pdv'
Plugin 'tobys/vmustache'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mattn/emmet-vim'
" Disabled causes performance issues
" Plugin 'craigemery/vim-autotag'

call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

syntax on

colorscheme monokai


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Pdv snippet shortcut
nmap <leader>d :call pdv#DocumentWithSnip()<CR>

" Opens NERDTree at item
nmap <leader><leader>. :NERDTreeFind<CR>
nmap <leader><leader>o o<Esc>
nmap <leader><leader>O O<Esc>

" Working with Tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>

map <leader><leader>n :set relativenumber!<CR>

" Remove trailing whitespace http://vim.wikia.com/wiki/Remove_unwanted_space
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I like line numbers
set number
set relativenumber

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu (in command mode tab for autocomplete)
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

set ruler

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful mappings for managing tabs


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line (deprecated in favour of airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set laststatus=2
" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.wiki set tw=80

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ["php", "phpcs"]
let g:syntastic_php_phpcs_args = "--standard=Symfony2"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin -> Pdv
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When root dir changes set VIM's cd to directory
let NERDTreeChDirMode = 2

" Hides "Press ? for help"
let NERDTreeMinimalUI = 1

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions and checks :-)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set directory=~/.vimswp

" Extend expand-selection behaviour like PHPStorm
call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

if has("gui_running")
    if has("gui_macvim")
        set guifont=Monaco:h14
        set guioptions-=L
    endif
endif

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
        hi! def link phpDocParam phpType
    endfunction

    augroup phpSyntaxOverride
        autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo integration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

