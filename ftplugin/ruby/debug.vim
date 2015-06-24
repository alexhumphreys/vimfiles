" debug statements
map <leader>t :call InsertDebug()<CR>

function! InsertDebug()
  let trace = ""
  if (&filetype=='ruby')
    let trace = "binding.pry"
    execute "normal! O".trace
  elseif (&filetype=='python')

    let trace = "pdb.set_trace()"
    execute "normal! O".trace

    let cnt=0
    execute "g/import pdb/let cnt=cnt+1"
    if (cnt == 0)
      let import = "import pdb"
      execute "m'"
      execute "normal! ggO".import
    endif
    execute "normal! \<c-o>"
  endif
endfunction

map <leader>T :call RemoveDebug()<CR>

function! RemoveDebug()
  let trace = ""
  if (&filetype=='ruby')
    execute "g/pry/d"
  elseif (&filetype=='python')
    execute "g/pdb/d"
  endif
  execute "normal! \<c-o>"
endfunction
