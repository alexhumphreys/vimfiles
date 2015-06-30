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

map <leader>w :call SplitNext()<CR>
function! SplitNext()
  execute ":normal \<C-W>\<C-w>"
endfunction
