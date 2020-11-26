" Plugins ================================================

call plug#begin(stdpath('data') . '/plugged')

" general
Plug 'gruvbox-community/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" Editor Settings =========================================

let g:mapleader = "\<space>"

set clipboard+=unnamed,unnamedplus  " use system clipboard
set hidden                          " switch buffers without saving
set inccommand=nosplit              " enable dynamic substitutions
set shortmess+=c                    " disable completion messages
set ignorecase                      " use case insensitive searching by default
set smartcase                       " use case sensitive searching for uppercase entries
set updatetime=300                  " hold cursor for 300 milliseconds (default is four seconds)
set undofile                        " enable persistent undo
set nowritebackup                   " don't write to backup files
set noswapfile                      " disable swap files
set expandtab                       " use soft tabs
set shiftround                      " round indents to multiples of `shiftwidth`
set shiftwidth=4                    " indenting motions (e.g >>) shift lines by four spaces
set softtabstop=4                   " insert four spaces per <TAB> key press
set nowrap                          " disable line wrapping by default
set linebreak                       " when wrapping is enabled, wrap at word boundaries
set textwidth=100                   " break lines longer than 100 characters
set splitright                      " open new vertical splits to the right
set splitbelow                      " open new horizontal splits from below
set completeopt-=preview            " disable preview buffers for insert completions
set formatoptions-=cro              " disbale newline continution of comments
set number                          " show line numbers
set termguicolors                   " enable all the colors!
set cursorline                      " highlight the line the cursor is on
set colorcolumn=+1                  " highlight one column after `textwidth`
set scrolloff=3                     " show the next three columns while vertically scrolling
set sidescrolloff=5                 " show the next five columns while horizontally scrolling
set mouse=a                         " enable mouse features
set pumheight=10                    " limit popup menu size to 10 items
set list                            " shows whitespace characters provided by `listchars`
set listchars=tab:→\ ,trail:·       " visualize tabs and trailing spaces

" hide various files from the wildmenu
set wildignore+=*.git                                       " git files
set wildignore+=*cache,*.user,*.autosave,build*             " cache and editor files
set wildignore+=*.dll,*.exe,*.dylib,*.app,*.o,*.obj,*.so    " compiled binary files/bundles
set wildignore+=*.png,*.jpeg,*.jpg,*.dds                    " image files
set wildignore+=.DS_Store                                   " macOS DirectoryServices files

" nice and minimal completions
set completeopt=menuone,noinsert,noselect

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat^=%f:%l:%c:%m
endif

fun! StripTrailingSpaces()
    if &modifiable
        let l:line = line('.')
        let l:column = col('.')
        call execute('%s/\s\+$//e')
        call histdel('/', -1)
        call cursor(l:line, l:column)
    endif
endfun

augroup filetype_settings
    autocmd!
    autocmd BufRead,BufNewFile .clang* setfiletype yaml
    autocmd BufRead,BufNewFile Brewfile setfiletype ruby
    autocmd FileType c,cplusplus setlocal commentstring=//\ %s
augroup END

augroup file_save_settings
    autocmd!
    autocmd BufWritePre * call StripTrailingSpaces()
augroup END

augroup colorscheme_mods
    autocmd!
    autocmd ColorScheme * hi Comment cterm=italic gui=italic
    autocmd ColorScheme * hi SpecialComment cterm=italic gui=italic
augroup END

augroup terminal_buffer_settings
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * setlocal signcolumn=no nonumber nocursorline nocursorcolumn listchars=
augroup END

let g:gruvbox_sign_column="bg0"
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" Statusline ===============================================

set statusline=\ %n\ \|                        " buffer number
set statusline+=\ %<%f                         " file (truncates to the left)
set statusline+=%{&modified?'\ \|\ ✻\ ':''}    " file status
set statusline+=%{&readonly?'\ \|\ RO\ ':''}   " read-only status
set statusline+=%=                             " switch side
set statusline+=\ %2l:%2c\ (%P)\ %*            " (buffer %) row:column

" vim-signify ==============================================

let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'
let g:signify_sign_show_count = 0 " Don’t show deleted line count.

" FZF ======================================================

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window='' " disable the preview window
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'Type'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Character'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

if executable('rg')
    let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob
        \ "!{.git,.cache,.clangd,build,out,*party,external,vendor}/"'
endif

nnoremap <leader>fb :FzfBuffers<CR>
nnoremap <leader>fc :FzfColors<CR>
nnoremap <leader>ff :FzfFiles<CR>
nnoremap <leader>fh :FzfHistory<CR>
nnoremap <leader>fr :FzfRg<CR>

" Vim-LSP =================================================

let g:lsp_semantic_enabled=1

fun! LSPBufferSettings()
    setlocal signcolumn=yes
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nnoremap <buffer> <leader>ld <plug>(lsp-definition)
    nnoremap <buffer> <leader>lr <plug>(lsp-references)
    nnoremap <buffer> <leader>li <plug>(lsp-implementation)
    nnoremap <buffer> <leader>lr <plug>(lsp-rename)
    nnoremap <buffer> <leader>lf <plug>(lsp-document-format)
    nnoremap <buffer> <leader>lg <plug>(lsp-document-range-format)
    nnoremap <buffer> <leader>lh <plug>(lsp-hover)
    nnoremap <buffer> <leader>l[ <plug>(lsp-previous-diagnostic)
    nnoremap <buffer> <leader>l] <plug>(lsp-next-diagnostic)
endfun

if executable('clangd')
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'clangd -header-insertion=never',
        \ 'cmd': {server_info->['clangd']},
        \ 'semantic_highlight': {
        \   'entity.name.function.cpp': 'Function',
        \   'entity.name.function.method.cpp': 'Function',
        \   'entity.name.function.method.static.cpp': 'Function',
        \   'entity.name.function.preprocessor.cpp': 'PreProc',
        \   'entity.name.namespace.cpp': 'Identifier',
        \   'entity.name.type.class.cpp': 'Identifier',
        \   'entity.name.type.enum.cpp': 'Typedef',
        \   'entity.name.type.enummember.cpp': 'Typedef',
        \   'entity.name.type.template.cpp': 'Identifier',
        \   'entity.name.type.typedef.cpp': 'Typedef',
        \   'storage.type.primitive.cpp': 'Type',
        \   'variable.other.enummember.cpp': 'Typedef',
        \ },
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call LSPBufferSettings()
augroup END

" Keymaps =================================================

" toggle search highlights
nnoremap <silent> <leader>\ :nohlsearch<CR>

" edit/reload this vim configuration file
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>

" visual-mode-esqe line scrolling
noremap j gj
noremap k gk

" buffer
nnoremap <silent> <leader>bd :bdelete<CR>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprev<CR>
nnoremap <silent> <leader>bl :ls<CR>

" quickfix
nnoremap <silent> <leader>qo :copen<CR>
nnoremap <silent> <leader>qc :cclose<CR>
nnoremap <silent> <leader>q[ :cprevious<CR>
nnoremap <silent> <leader>q] :cnext<CR>

" split switching
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" netrw
nnoremap <leader>eh :Sexplore<CR>
nnoremap <leader>ev :Vexplore<CR>

" terminal
nnoremap <leader>tv :vsplit<CR>:terminal<cr>
nnoremap <leader>ts :split<CR>:terminal<cr>
