if !exists('g:ale_enabled') | finish | endif

let g:ale_sign_column_always = 1

" Code linters
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

" Code fixers
let g:ale_fixers = {
\   '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
\   'python': [ 'remove_trailing_lines', 'trim_whitespace',
\       'add_blank_lines_for_python_control_statements',
\       'autoimport', 'black', 'reorder-python-imports'
\   ],
\   'yaml': [ 'remove_trailing_lines', 'trim_whitespace',
\       'yamlfix'
\   ],
\}
let g:ale_fix_on_save = 1



" #######   Retired, I'm using Prettier now ######
" Automatically run these for all buffers on BufWritePre action
" autocmd BufWritePre * silent! call TrimBuffersAll()
" function TrimBuffersAll()
"     execute "ALEFix trim_whitespace"
"     execute "ALEFix remove_trailing_lines"
" endfunction
" #######################
