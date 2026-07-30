packadd! lexima.vim

let g:lexima_enable_basic_rules=1
let g:lexima_enable_newline_rules=1
let g:lexima_enable_endwise_rules=1
let g:lexima_disable_abbrev_trigger=1

call lexima#add_rule({
      \ 'char': '$',
      \ 'input_after': '$',
      \ 'filetype': ['tex', 'latex', 'typst']
      \ })
call lexima#add_rule({
      \ 'char': '$',
      \ 'at': '\%#\$',
      \ 'leave': 1,
      \ 'filetype': ['tex', 'latex', 'typst']
      \ })
call lexima#add_rule({
      \ 'char': '<bs>',
      \ 'at': '\$\%#\$',
      \ 'delete': 1,
      \ 'filetype': ['tex', 'latex', 'typst']
      \ })
" call lexima#add_rule(lexima#endwise_rule#make_rule(
"       \ '%s\$\#\$',
"       \ '\$',
"       \ 'typst',
"       \ [],
"       \ ))
" call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'typst'})
