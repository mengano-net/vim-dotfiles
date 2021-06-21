" Setting leader key
" First make sure spacebar doesn't have any preexisting mappings
nnoremap <SPACE> <Nop>
" Set map leader
let leader = " "

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>

" Alternative ESC with quick jk convo
inoremap jk <Esc>

" Better tabbing, allows slection to remain selected for hitting more/less
" tabs
vnoremap < <gv
vnoremap > >gv

" open hotkey help file on vertical split
nmap <leader>hk :vsplit ~/.vim/hotkeys.vim<CR>

" NerdTree plugin maps
nmap <leader>t :NERDTree<CR>
nmap <leader>tc :NERDTreeClose<CR>

