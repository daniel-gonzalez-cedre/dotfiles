function! s:gruvbox_settings()
  let g:gruvbox_improved_strings = 1  " (0), 1
  let g:gruvbox_improved_warnings = 1  " (0), 1
  let g:gruvbox_hls_cursor = 'orange'
  let g:gruvbox_contrast_dark = 'medium'  " soft, (medium), hard
  let g:gruvbox_contrast_light = 'hard'  " soft, (medium), hard
endfunction

function! s:gruvbox_colors()
  hi clear Folded
  hi Folded guifg=#504945 ctermfg=240 ctermbg=none cterm=none

  hi clear String
  hi String guifg=#b8bb26 ctermfg=142 cterm=none

  hi clear StatusLine
  hi clear StatusLineNC
  hi StatusLine guifg=#504945 ctermfg=240 ctermbg=none cterm=none
  hi StatusLineNC guifg=#504945 ctermfg=240 ctermbg=none cterm=none

  hi clear Visual
  " hi Visual ctermfg=none ctermbg=none cterm=inverse
  " hi Visual ctermbg=238
  hi Visual guibg=#504945 ctermbg=239 cterm=none
  " hi Visual guifg=#ebdbb2 guibg=#504945 ctermfg=15 ctermbg=239 cterm=none

  hi clear MatchParen
  " hi MatchParen guibg=#504945 ctermfg=0 ctermbg=240
  " hi MatchParen cterm=inverse
  hi MatchParen cterm=bold

  hi clear SignColumn
  hi clear LineNR
  hi clear CursorLine
  hi clear CursorLineNR
  hi LineNR guifg=#504945 ctermfg=240 cterm=none
  " hi CursorLine ctermfg=none ctermbg=235 cterm=none
  hi CursorLineNR guifg=#7c6f64 ctermfg=244 cterm=none

  " hi SpellBad ctermfg=131 ctermbg=234 cterm=underline
  " hi SpellCap ctermfg=66 ctermbg=234 cterm=underline
  hi clear SpellBad
  hi clear SpellCap
  hi clear SpellLocal
  hi clear SpellRare
  hi SpellBad ctermbg=none cterm=underline
  hi SpellCap ctermbg=none cterm=underline
  hi SpellLocal ctermbg=none cterm=none
  hi SpellRare ctermbg=none cterm=none

  hi clear texStyleItal
  hi clear texCmdSize
  hi clear texCmdStyle
  hi texStyleItal ctermfg=214 ctermbg=none cterm=none
  hi texCmdSize ctermfg=208 ctermbg=none cterm=none
  hi texCmdStyle ctermfg=208 ctermbg=none cterm=none

  hi SignColumn ctermbg=black
endfunction

augroup setup_colors | au!
  au ColorScheme gruvbox call s:gruvbox_settings()
  au ColorScheme gruvbox call s:gruvbox_colors()
augroup END
