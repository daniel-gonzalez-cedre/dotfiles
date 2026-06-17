packadd latex-unicoder.vim

let g:latex_to_unicode_file_types = '.*'

let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
let g:unicoder_cancel_visual = 1

nnoremap gt :call unicoder#start(0)<cr>
vnoremap gt :<c-u>call unicoder#selection()<cr>
inoremap <c-g>t <esc>:call unicoder#start(1)<cr><right>
