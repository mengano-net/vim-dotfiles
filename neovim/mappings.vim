" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Use alt + hjkl to resize windows
" nnoremap <A-j>    :resize -2<CR>
" nnoremap <A-k>    :resize +2<CR>
" nnoremap <A-h>    :vertical resize -2<CR>
" nnoremap <A-l>    :vertical resize +2<CR>

" Alternative ESC with quick jk convo
inoremap jk <Esc>

" Better navigatings splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better tabbing, allows slection to remain selected for hitting more/less
" tabs
vnoremap < <gv
vnoremap > >gv

" Setting map leader to space
let mapleader = "\<Space>"
" let leader = "\<Space>"

" Open the hotkeys file in a non editable vertical split
nmap <leader>hk :vsplit ~/.config/nvim/hotkeys.vim <Bar> :vertical resize -15 <Bar> :setlocal nomodifiable<CR>

" Enter :Config in normal mode to edit vim's config
command! Config execute ":e ~/.config/nvim/init.vim"

" Enter :Reload to apply latest vimrc configuration
command! Reload execute "source ~/.config/nvim/init.vim"
