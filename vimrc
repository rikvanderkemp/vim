" VIMRC partially taken from:  https://amix.dk/vim/vimrc.html

" Alternative package manager 
" execute pathogen#infect() 



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

Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'
Plugin 'msanders/snipmate.vim'
Plugin 'joonty/vim-sauce'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/taglist.vim'

" Testing syntastic, disabled this on
" Plugin 'joonty/vim-phpqa.git'

Plugin 'tpope/vim-surround'
Plugin 'rstacruz/sparkup'
Plugin 'terryma/vim-expand-region'
Plugin 'scrooloose/syntastic'
Plugin 'vimwiki/vimwiki'
Plugin 'docteurklein/vim-symfony'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'craigemery/vim-autotag'

call vundle#end()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin -> Pdv 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

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

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Pdv snippet shortcut
nmap <leader>d :call pdv#DocumentWithSnip()<CR>

nmap <leader><leader>. :NERDTreeFind<CR>
nmap <leader><leader>o o<Esc>
nmap <leader><leader>O O<Esc>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

syntax on

colorscheme monokai

au BufRead,BufNewFile *.twig set filetype=htmljinja

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I like line numbers
set number

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
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Extend expand-selection
call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1, 
      \ 'ii' :0,
      \ 'ai' :0, 
      \ })

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


inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

