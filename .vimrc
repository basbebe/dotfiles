set encoding=utf-8
scriptencoding utf-8

"# General Settings

set showcmd                                                 " Show command.
set tabstop=4                                               " Set TAB size.
set softtabstop=4                                           " TABs to spaces.
set shiftwidth=4                                            " Spaces for indentation.
set expandtab                                               " Insert appropriate number of spaces.
set autoindent                                              " Auto carry the indentation.
set smartindent                                             " Don't be dumb.
set background=dark                                         " Dark themed FTW.
set nohidden                                                " Close the buffer when another file is opened.
set autoread                                                " Auto update file if changed.
set ruler                                                   " Show current line and column position.
set hlsearch                                                " Highlight searching.
set incsearch                                               " Incremental while searching.
nnoremap <leader><space> :nohlsearch<CR>                    " keybinding to stop highlighting after search
set ignorecase                                              " Don't care about case while searching.
set smartcase                                               " Care about case if uppercase while searching.
set wrapscan                                                " Wrap to start if EOF while searching.
set wrap
set linebreak
set wildmenu                                                " Show all auto complete settings.
set lazyredraw                                              " Need performance for macros.
set foldenable                                              " Enable folding.
set nofoldenable                                            " Unfold all on start.
set foldnestmax=10                                          " Maximum nested folding limit.
set foldmethod=syntax                                       " Fold based on indentation.
set magic                                                   " Better regex.
set number                                                  " Show line number on current line.
set relativenumber                                          " Show other line numbers as relatives.
set cursorline                                              " Show selected line
set mouse=c                                                 " Disable mouse.
set noswapfile                                              " Don't generate swap files.
set nobackup                                                " Don't generate backup files.
set nowritebackup                                           " Don't write backup files.
set list                                                    " Show whitespace characters.
set listchars=tab:»\ ,trail:·,extends:›,precedes:‹,nbsp:·   " Fancy characters for whitespaces.
set secure                                                  " Don't load random .vimrc from local dir.
set fileformat=unix                                         " Use Unix line endings.
set path+=**                                                " Go into subfolders when searching files.
set clipboard=unnamedplus                                   " Copy to system clipboard
syntax on                                                   " Force language syntax highlight.
"let &colorcolumn="120"
set colorcolumn=80                                          " Set margin.
set termguicolors                                           "
set guifont=Hack:h14  

if !has('nvim')
    set ttymouse=xterm2
endif

if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif

autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2

"# Key Mappings

let mapleader=","
nnoremap <leader>w :w<CR>

"# fold .vimrc

augroup vim_folding
    autocmd!
    autocmd FileType vim set foldmethod=expr foldlevel=0
    " note that double quote in foldexpr has to be escaped with backslash
 autocmd FileType vim set foldexpr=getline(v:lnum)=~'^\"#'?'>'.(matchend(getline(v:lnum),'\"#*')-1):'='
augroup END

