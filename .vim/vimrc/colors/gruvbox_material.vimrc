function! s:gruvbox_material_settings()
  let g:gruvbox_material_background = 'medium'  " soft, (medium), hard
  let g:gruvbox_material_foreground = 'material'  " (material), mix, original
  let g:gruvbox_material_transparent_background = 1
  let g:gruvbox_material_enable_bold = 1  " (0), 1
  let g:gruvbox_material_enable_italic = 0  " (0), 1
  let g:gruvbox_material_disable_italic_comment = 0  " (0), 1
  let g:gruvbox_material_visual = 'grey background'  " (grey background), red background, green background, blue background, reverse
  " let g:gruvbox_material_menu_selection_background = 'green'  " (grey), red, orange, yellow, green, aqua, blue, purple
  let g:gruvbox_material_spell_foreground = 'none'  " (none), colored
  let g:gruvbox_material_ui_contrast = 'low'  " (low), high
  let g:gruvbox_material_float_style = 'bright'  " (bright), dim
  let g:gruvbox_material_diagnostic_text_highlight = 0  " (0), 1
  let g:gruvbox_material_diagnostic_line_highlight = 0  " (0), 1
  let g:gruvbox_material_diagnostic_virtual_text = 'colored'  " (grey), colored, highlighted
  let g:gruvbox_material_better_performance = 0  " (0), 1
endfunction

function! s:gruvbox_material_colors()
  " let l:palette = gruvbox_material#get_palette('medium', 'material', {'bg0': ['#262626', '235'], 'bg1': ['#2f2c29', '235']})
  let l:palette = gruvbox_material#get_palette('medium', 'material', {'bg1': ['#2f2c29', '235']})
  " let l:palette = gruvbox_material#get_palette('medium', 'material', {})

  call gruvbox_material#highlight('IncSearch', l:palette.none, l:palette.none, 'inverse')
  " call gruvbox_material#highlight('IncSearch', l:palette.bg_yellow, l:palette.none, 'inverse')
  " call gruvbox_material#highlight('Search', l:palette.none, l:palette.bg2)
  call gruvbox_material#highlight('Search', l:palette.none, l:palette.bg3)

  call gruvbox_material#highlight('Comment', l:palette.bg5, l:palette.none, 'italic')

  call gruvbox_material#highlight('String', l:palette.fg0, l:palette.bg1, 'bold')

  call gruvbox_material#highlight('Todo', l:palette.grey1, l:palette.none, 'bolditalic')

  call gruvbox_material#highlight('ErrorText', l:palette.none, l:palette.none, 'undercurl', l:palette.red)
  call gruvbox_material#highlight('WarningText', l:palette.none, l:palette.none, 'undercurl', l:palette.yellow)
  call gruvbox_material#highlight('InfoText', l:palette.none, l:palette.none, 'undercurl', l:palette.blue)
  call gruvbox_material#highlight('HintText', l:palette.none, l:palette.none, 'undercurl', l:palette.aqua)

  " call gruvbox_material#highlight('LspDiagLine', l:palette.none, l:palette.none, 'undercurl', l:palette.fg1)
  call gruvbox_material#highlight('LspDiagInlineError', l:palette.none, l:palette.none, 'undercurl', l:palette.red)
  call gruvbox_material#highlight('LspDiagInlineHint', l:palette.none, l:palette.none, 'undercurl', l:palette.aqua)
  call gruvbox_material#highlight('LspDiagInlineInfo', l:palette.none, l:palette.none, 'undercurl', l:palette.blue)
  call gruvbox_material#highlight('LspDiagInlineWarning', l:palette.none, l:palette.none, 'undercurl', l:palette.yellow)

  call gruvbox_material#highlight('LspDiagSignErrorText', l:palette.red, l:palette.none, 'bold')
  call gruvbox_material#highlight('LspDiagSignHintText', l:palette.aqua, l:palette.none, 'bold')
  call gruvbox_material#highlight('LspDiagSignInfoText', l:palette.blue, l:palette.none, 'bold')
  call gruvbox_material#highlight('LspDiagSignWarningText', l:palette.yellow, l:palette.none, 'bold')

  " call gruvbox_material#highlight('ALEErrorSign', l:palette.none, l:palette.none, 'undercurl', l:palette.red)
  " call gruvbox_material#highlight('ALEWarningSign', l:palette.none, l:palette.none, 'undercurl', l:palette.yellow)
  " call gruvbox_material#highlight('ALEInfoSign', l:palette.none, l:palette.none, 'undercurl', l:palette.blue)
  " call gruvbox_material#highlight('ALEVirtualTextError', l:palette.none, l:palette.none, 'undercurl', l:palette.red)
  " call gruvbox_material#highlight('ALEVirtualTextWarning', l:palette.none, l:palette.none, 'undercurl', l:palette.yellow)

  call gruvbox_material#highlight('Folded', l:palette.bg3, l:palette.none)
  " call gruvbox_material#highlight('FoldColumn', l:palette.bg2, l:palette.none)
  " call gruvbox_material#highlight('FoldColumn', l:palette.grey1, l:palette.none)

  " call gruvbox_material#highlight('CursorLine', l:palette.none, ['#2a2a2a',   '235'])
  " call gruvbox_material#highlight('CursorLineNR', l:palette.grey1, ['#2a2a2a',   '235'])
  " call gruvbox_material#highlight('CursorLine', l:palette.none, l:palette.bg1)
  " call gruvbox_material#highlight('CursorLineNR', l:palette.grey1, l:palette.bg1)
  call gruvbox_material#highlight('LineNR', l:palette.bg5, l:palette.none)
  call gruvbox_material#highlight('CursorLine', l:palette.none, l:palette.none)
  call gruvbox_material#highlight('CursorLineNR', l:palette.fg1, l:palette.none)
  " call gruvbox_material#highlight('StatusLine', l:palette.bg2, l:palette.none)
  " call gruvbox_material#highlight('StatusLineNC', l:palette.bg2, l:palette.none)


  call gruvbox_material#highlight('MatchParen', l:palette.none, l:palette.none, 'reverse')
  " call gruvbox_material#highlight('MatchParen', l:palette.none, l:palette.bg2, 'bold')
  " call gruvbox_material#highlight('MatchParen', l:palette.none, l:palette.bg1, 'bold')

  call gruvbox_material#highlight('NonText', l:palette.bg2, l:palette.none)
  " call gruvbox_material#highlight('SpecialKey', l:palette.bg2, l:palette.none)

  call gruvbox_material#highlight('LeadingSpace', l:palette.none, l:palette.red)
  " match LeadingSpace /^\s\+/

  " call gruvbox_material#highlight('TrailingSpace', l:palette.none, l:palette.bg1)
  " match TrailingSpace / \+$/

  " call gruvbox_material#highlight('HighlightedyankRegion', l:palette.none, l:palette.bg3)
  " highlight HighlightedyankRegion cterm=reverse gui=reverse

  " highlight ExtraWhitespace ctermbg=red guibg=red
  call gruvbox_material#highlight('ExtraWhitespace', l:palette.none, l:palette.bg3)
endfunction

augroup setup_colors | au!
  au ColorScheme gruvbox-material call s:gruvbox_material_settings()
  au ColorScheme gruvbox-material call s:gruvbox_material_colors()
augroup END
