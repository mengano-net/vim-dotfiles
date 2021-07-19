if !exists(':PrettierVersion') | finish | endif
vnoremap <leader>pf :PrettierFragment<CR>

" Max line length that prettier will wrap on: a number or 'auto'
let g:prettier#config#print_width = 100 " default is 'auto'
