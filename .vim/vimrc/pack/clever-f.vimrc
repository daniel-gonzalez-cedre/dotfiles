" let g:clever_f_not_overwrites_standard_mappings=1

" let g:clever_f_across_no_line=0
let g:clever_f_ignore_case=0
let g:clever_f_smart_case=1
let g:clever_f_mark_direct=0
let g:clever_f_chars_match_any_signs=';'

let g:clever_f_mark_char=1
let g:clever_f_mark_char_color="FSearch"

" nmap f <Plug>(clever-f-f)
" xmap f <Plug>(clever-f-f)
" omap f <Plug>(clever-f-f)

" nmap t <Plug>(clever-f-t)
" xmap t <Plug>(clever-f-t)
" omap t <Plug>(clever-f-t)

map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)
