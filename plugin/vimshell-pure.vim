" dynamic prompt changer for vimshell
" Version: 0.0.1
" Author : supermomonga (@supermomonga)

if exists('g:loaded_vimshell_pure')
  finish
endif
let g:loaded_vimshell_pure = 1

let s:save_cpo = &cpo
set cpo&vim

" Default settings
let g:vimshell_pure_allow_overwrite             = get(g:, 'vimshell_pure_allow_overwrite', 1)
let g:vimshell_pure_allow_colorscheme_overwrite = get(g:, 'vimshell_pure_allow_colorscheme_overwrite', 1)
let g:vimshell_pure_default_username            = get(g:, 'vimshell_pure_default_username', '$USER')
let g:vimshell_pure_prompt                      = get(g:, 'vimshell_pure_prompt', '❯ ')
let g:vimshell_pure_user_prompt                 = get(g:, 'vimshell_pure_user_prompt', 'vimshell_pure#user_prompt()')
let g:vimshell_pure_right_prompt                = get(g:, 'vimshell_pure_right_prompt', 'vimshell_pure#right_prompt()')
let g:vimshell_pure_last_command_started        = localtime()
let g:vimshell_pure_last_command_finished       = localtime()
let g:vimshell_pure_last_command_execution_time = g:vimshell_pure_last_command_finished - g:vimshell_pure_last_command_started


if g:vimshell_pure_allow_overwrite == 1
  let g:vimshell_prompt       = g:vimshell_pure_prompt
  let g:vimshell_user_prompt  = g:vimshell_pure_user_prompt
  let g:vimshell_right_prompt = g:vimshell_pure_right_prompt
endif

if g:vimshell_pure_allow_colorscheme_overwrite == 1
  let g:vimshell_escape_colors[0]  = '#CC0000'
  let g:vimshell_escape_colors[1]  = '#CC0000'
  let g:vimshell_escape_colors[2]  = '#CC0000'
  let g:vimshell_escape_colors[3]  = '#CC0000'
  let g:vimshell_escape_colors[4]  = '#CC0000'
  let g:vimshell_escape_colors[5]  = '#CC0000'
  let g:vimshell_escape_colors[6]  = '#CC0000'
  let g:vimshell_escape_colors[7]  = '#CC0000'
  let g:vimshell_escape_colors[8]  = '#CC0000'
  let g:vimshell_escape_colors[9]  = '#CC0000'
  let g:vimshell_escape_colors[10] = '#CC0000'
  let g:vimshell_escape_colors[11] = '#CC0000'
  let g:vimshell_escape_colors[12] = '#CC0000'
  let g:vimshell_escape_colors[13] = '#CC0000'
  let g:vimshell_escape_colors[14] = '#CC0000'
  let g:vimshell_escape_colors[15] = '#CC0000'
endif

" Add hooks to vimshell
autocmd FileType vimshell
      \  call vimshell#hook#add('preexec',  'vimshell_pure_preexec',  'vimshell_pure#preexec')
      \| call vimshell#hook#add('postexec', 'vimshell_pure_postexec', 'vimshell_pure#postexec')

let &cpo = s:save_cpo
unlet s:save_cpo
