set encoding=utf-8
scriptencoding utf-8
"# Plugins

"### dein Scripts

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim 

  " Required:
  if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

"## Plugins

  "### General
  call dein#add('mhinz/vim-startify')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('Yggdroot/indentLine')
  call dein#add('preservim/nerdcommenter')
  call dein#add('psliwka/vim-smoothie')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')
  call dein#add('mcchrish/nnn.vim')

  "### Colorthemes
  call dein#add('morhetz/gruvbox')
  call dein#add('drewtempelmeyer/palenight.vim')
  call dein#add('ayu-theme/ayu-vim')

  "### Syntax
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('chr4/nginx.vim')
  call dein#add('dag/vim-fish')
  call dein#add('cespare/vim-toml')

  "### Code Completion
  call dein#add('ncm2/ncm2')
  call dein#add('roxma/nvim-yarp')
  call dein#add('ncm2/ncm2-bufword')
  call dein#add('ncm2/ncm2-path')
  call dein#add('ncm2/ncm2-github')
  call dein#add('ncm2/ncm2-syntax')
  call dein#add('shougo/neco-syntax')

  
  call dein#add('Shougo/neosnippet.vim')  " Snippets
  call dein#add('ncm2/ncm2-neosnippet')  " Snippets
  call dein#add('Shougo/neosnippet-snippets')  " Snippets
  call dein#add('honza/vim-snippets')  " Snippets
  call dein#add('ncm2/ncm2-vim')  " Vimscript
  call dein#add('shougo/neco-vim')  " Vimscript
  call dein#add('ncm2/ncm2-tern')  " Javascript
  call dein#add('ncm2/ncm2-jedi')  " Python
  call dein#add('slashmili/alchemist.vim')  " Elixir
  call dein#add('pbogut/ncm2-alchemist')  " Elixir
  call dein#add('artur-shaik/vim-javacomplete2')  " Java
  call dein#add('ObserverOfTime/ncm2-jc2')  " Java

  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })

  "### Linting
  call dein#add('dense-analysis/ale')
  call dein#add('maximbaz/lightline-ale')

  "### Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('junegunn/gv.vim')

  "### NERDTree
  call dein#add('preservim/nerdtree')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  "### Pandoc, Markdown, LaTeX
  call dein#add('vim-pandoc/vim-pandoc')
  call dein#add('vim-pandoc/vim-pandoc-syntax')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('lervag/vimtex')

  "### Icons – needs to be last
  call dein#add('ryanoasis/vim-devicons')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
let g:dein#auto_recache = 1

" End dein Scripts


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

tnoremap <Esc> <C-\><C-n>

autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2

"# Colors

let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='medium'
let g:gruvbox_italic=1
colorscheme gruvbox

"# Key Mappings

let mapleader=","

nnoremap <leader>w :w<CR>
nnoremap <leader>g :Gstatus
nnoremap <leader><leader> <c-^>


"# Plugin Settings

"## startify

autocmd User Startified setlocal cursorline

let g:startify_enable_special      = 1
let g:startify_files_number        = 10
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ '/data/repo/neovim/runtime/doc',
        \ '/Users/mhi/local/vim/share/vim/vim74/doc',
        \ ]

let g:startify_bookmarks = [
        \ { 'c': '~/.config/nvim/init.vim' },
        \ ]

let g:startify_custom_footer =
       \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

" " returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" startify + NERDTree
autocmd VimEnter *
  \   if !argc()
  \ |   Startify
  \ |   NERDTree
  \ |   wincmd w
  \ | endif

let NERDTreeHijackNetrw = 0

"## indentLine

let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'startify', 'tagbar', 'vimfiler', 'markdown', 'minimap', 'pandoc']

"## haskell-vim

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"## lightline

" change colortheme
" Show git branch info (w/ fugitive)
" Use Powerline Symbols

let g:lightline = {
  \   'colorscheme': 'gruvbox',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
  \            [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#Head',
  \   }
  \ }
"let g:lightline.separator = {
  "\   'left': '', 'right': ''
  "\}
"let g:lightline.subseparator = {
  "\   'left': '', 'right': ''
  "\}

"### ALE-lightline

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \} 

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:ightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"


function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#enable_devicons = 1
set noshowmode

" Show tabline and disable GUI tabline
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

"## nerdcommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"## nnn

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

"## vim-table-mode

let g:table_mode_auto_align = 0
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

"## FZF

nnoremap <C-p> :Files<ENTER>
if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
end

"## ncm2

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

"## neosnippets
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_neosnippet#expand_or("\<CR>", 'n')
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_or_jump)
nmap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.cache/dein/repos/github.com/honza/vim-snippets/snippets'

"## LanguageClient-neovim

" Required for operations modifying multiple buffers like rename.
set hidden

"let g:LanguageClient_serverCommands = {
    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    "\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"## ALE

"let g:ale_linters = {
"\   'python': ['flake8'],
"\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
"let g:ale_fix_on_save = 1

" keep sign gutter open
 "let g:ale_sign_column_always = 1

"## NERDTree

" open NERDTree on opening an directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if when only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>


"# fold .vimrc

augroup vim_folding
    autocmd!
    autocmd FileType vim set foldmethod=expr foldlevel=0
    " note that double quote in foldexpr has to be escaped with backslash
 autocmd FileType vim set foldexpr=getline(v:lnum)=~'^\"#'?'>'.(matchend(getline(v:lnum),'\"#*')-1):'='
augroup END

