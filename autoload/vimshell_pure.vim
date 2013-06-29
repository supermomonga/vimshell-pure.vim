let s:save_cpo = &cpo
set cpo&vim

function! vimshell_pure#preexec(cmdline, context)
  let g:vimshell_pure_last_command_started = localtime()
  return a:cmdline
endfunction


function! vimshell_pure#postexec(cmdline, context)
  let g:vimshell_pure_last_command_finished = localtime()
  let g:vimshell_pure_last_command_execution_time = g:vimshell_pure_last_command_finished - g:vimshell_pure_last_command_started
  return a:cmdline
endfunction

function! vimshell_pure#user_prompt()
  let l:prompt = fnamemodify(getcwd(), ":~")
  return l:prompt
endfunction

function! vimshell_pure#right_prompt()
  if g:vimshell_pure_last_command_execution_time == 0
    return ""
  else
    return g:vimshell_pure_last_command_execution_time . "s"
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
