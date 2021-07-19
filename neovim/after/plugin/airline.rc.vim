" see :h airline
let g:airline_theme='term'
let g:airline_detect_paste = 1

" Skip empty sections
let g:airline_skip_empty_sections = 1

" Enable tabs above, wih each buffer opened
let g:airline#extensions#tabline#enabled = 1

" Omit full path on filename, on section 'c'
" let g:airline_section_c_only_filename = 1
let g:airline_stl_path_style = 'short'

" Display only current line and column numbers on section z
let g:airline_section_z = '%2l/%L☰%2v'

" I'm not enabling ALE on sectionz, leaving it here in case I change my mind
let g:airline#extensions#ale#enabled = 0

" Disable airline on FocusLost autocommand (e.g. when Vim loses focus): >
let g:airline_focuslost_inactive = 1
