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

" Better tabbing, allows slection to remain selected for hitting more/less
" tabs
vnoremap < <gv
vnoremap > >gv

" Setting map leader to space
" let mapleader = " "
let mapleader = "\<Space>"

" Open the hotkeys file in a non editable vertical split
nmap <leader>hk :vsplit ~/.vim/hotkeys.vim <Bar> :vertical resize -10 <Bar> :setlocal nomodifiable<CR>

" Open NERDTree in a slightly bigger vertical split.
nnoremap <leader>t :NERDTreeFocus <Bar> :setlocal modifiable <Bar> :vertical resize +10 <Bar> :setlocal nomodifiable<CR>

" Close NERDTree
nnoremap <leader>tc :NERDTreeToggle<CR>
