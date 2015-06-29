map <leader>v :call VertSplit()<CR>
function! VertSplit()
  execute ":vsp"
endfunction

map <leader>V :call CloseVertSplit()<CR>
function! CloseVertSplit()
  execute ":on"
endfunction

map <leader>b :call BufferPrev()<CR>
function! BufferPrev()
  execute ":bp"
endfunction

map <leader>f :call BufferNext()<CR>
function! BufferNext()
  execute ":bn"
endfunction
