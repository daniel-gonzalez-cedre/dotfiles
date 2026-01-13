function! s:set_lightline_colorscheme(name) abort
  let g:lightline.colorscheme = a:name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" TODO: not working on refocussing after closing pane with <c-d>
function! s:focus_gained_buffer()
  call lightline#toggle()
endfunction

" TODO: not working on tmux split pane
function! s:focus_lost_buffer()
  call lightline#toggle()
  echo ''
endfunction

augroup focus | au!
  au FocusGained * call s:focus_gained_buffer()
  au FocusLost * call s:focus_lost_buffer()
augroup END

" function! s:gitgutter_colors()
"   if $TERM_PROGRAM !=# 'Apple_Terminal'
"     hi clear SignColumn
"     hi GitGutterAdd ctermfg=142 ctermbg=none
"     hi GitGutterChange ctermfg=109 ctermbg=none
"     hi GitGutterDelete ctermfg=167 ctermbg=none
"     hi GitGutterChangeDelete ctermfg=175 ctermbg=none
"   endif
" endfunction

" augroup setup_colors | au!
"   " au ColorScheme gruvbox call s:gruvbox_settings()
"   " au ColorScheme gruvbox call s:gruvbox_colors()

"   au ColorScheme gruvbox-material call s:gruvbox_material_settings()
"   au ColorScheme gruvbox-material call s:gruvbox_material_colors()
" augroup END

packadd! gruvbox-material
colorscheme gruvbox-material
