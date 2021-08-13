" Settings
" ----------------------------------------------------------
let mapleader=" "

set clipboard+=unnamed,unnamedplus
set hidden
set undofile
set updatetime=300
set timeoutlen=1500
set formatoptions-=t
set shortmess+=c
set textwidth=100
set mouse=a
set ignorecase
set smartcase
set nowrap

" indentation
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4

" disable backups
set nobackup
set noswapfile
set nowritebackup

" UI
set termguicolors
set number
set cursorline
set inccommand="nosplit"
set colorcolumn=101
set scrolloff=5
set sidescrolloff=2
set splitright
set splitbelow
set pumheight=10
set list
set listchars=tab:→\ ,trail:·

" Statusline
" ----------------------------------------------------------

set statusline=
set statusline+=\ %<%f          " filename (truncates to the left)
set statusline+=\ %M\ %R        " modified/readonly flags
set statusline+=%=              " switch side
set statusline+=%l:%2c%6P\ %*   " line, column and buffer percentage

" Mappings
" ----------------------------------------------------------

" general
noremap <silent> zz :update<cr>
nnoremap <silent> <leader>\ :nohlsearch<cr>
nnoremap <leader>te :terminal<cr>
nnoremap j gj
nnoremap k gk

" move selected lines
xnoremap J :move ">+1<cr>gv=gv
xnoremap K :move "<-2<cr>gv=gv

" split navigation
nnoremap <c-h> <C-w>h<cr>
nnoremap <c-j> <C-w>j<cr>
nnoremap <c-k> <C-w>k<cr>
nnoremap <c-l> <C-w>l<cr>

" quickfix
nnoremap <leader>qn :cnext<cr>
nnoremap <leader>qp :cprev<cr>
nnoremap <leader>qf :cfirst<cr>
nnoremap <leader>ql :clast<cr>

" buffers
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bf :bfirst<cr>
nnoremap <leader>bl :blast<cr>

" strip whitespace
function! CleanWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

nnoremap <silent> <leader>cw :call CleanWhitespace()<cr>

" Open terminal in a split
nnoremap <silent> <leader>th :split <bar> terminal<cr>
nnoremap <silent> <leader>tv :vsplit <bar> terminal<cr>

" Autocommands
" ----------------------------------------------------------

" Italic comments everywhere!
augroup ColorSchemeTweaks
    autocmd!
    autocmd ColorScheme * hi Comment cterm=italic gui=italic
    autocmd ColorScheme * hi SpecialComment cterm=italic gui=italic
augroup END

" Make the terminal behave more like Vim's
augroup TerminalSettings
    autocmd!
    autocmd TermOpen * setlocal nocursorcolumn colorcolumn=0 nonumber listchars=
    autocmd TermOpen * startinsert
augroup END

" Lua stuff
" ----------------------------------------------------------

if has("nvim-0.5")
    lua require("plugins")
    lua require("lsp")
endif
