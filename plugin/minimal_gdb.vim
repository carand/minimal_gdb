sign define mingdbtag text=⬢ texthl=Breakpoint
hi Breakpoint guifg=#FF0000

function! MinGDBCheckFileType()
    if (&filetype != 'cpp' && &filetype != 'c')
        return
    endif
    cal minimal_gdb#show_breakpoints()
endfunc

com! MinGDBToggleBP cal minimal_gdb#toggle()
com! MinGDBDeleteAll cal minimal_gdb#delete_all()
com! MinGDBShowBreakpoints cal minimal_gdb#show_breakpoints()
com! MinGDBRefreshFile MinGDBShowBreakpoints
com! MinGDBListAll cal minimal_gdb#list_all()

nnoremap <Leader>b :MinGDBToggleBP<CR>
autocmd BufRead * cal MinGDBCheckFileType()
