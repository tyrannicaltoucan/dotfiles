vim.cmd [[
    augroup FileTypeSettings
        autocmd!
        autocmd FileType gitcommit,markdown setlocal spell
        autocmd FileType gitcommit setlocal colorcolumn=51,73 nolist
        autocmd FileType c,cpp setlocal commentstring=//\ %s
        autocmd FileType makefile setlocal noexpandtab
        autocmd FileType makefile,python setlocal colorcolumn=81
        autocmd FileType json,yaml setlocal shiftwidth=2 tabstop=2
    augroup END

    augroup TerminalSettings
        autocmd!
        autocmd TermOpen * setlocal nocursorcolumn signcolumn=no colorcolumn=0 nonumber nolist
        autocmd Termopen * startinsert
    augroup END

    augroup FileDetectSettings
        autocmd!
        autocmd BufRead,BufNewFile *.vs,*.fs,*.vert,*.frag,*.glsl set filetype=glsl
        autocmd BufRead,BufNewFile .clang-format,.clang-tidy set filetype=yaml
    augroup END
]]
