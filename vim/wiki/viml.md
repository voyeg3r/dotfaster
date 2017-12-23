# viml.md - Change: sáb 23 dez 2017 10:50:24 -03
Some usefull scripts

" How to know if I am on the last buffer
function! Bye()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :echom "You are in the last buffer!"
     else
         :bdelete
    endif
endfunction
map <silent> <F8> :call Bye()<CR>
