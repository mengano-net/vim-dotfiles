syntax on
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartindent
set number
set relativenumber
set ruler
set nowrap
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set pastetoggle=<F2>                    " Toggles pasting of indented code
set cul
set cuc
set colorcolumn=100
" set statusline=                       " Not used since I've got airline plug
set showtabline=2                       " Always show tab line
set laststatus=2
set t_Co=256                            " 256 color scheme for terminal
set backspace=indent,eol,start          " set baspace to delete without insertion first
set noshowmode                          " Not needed after airline Plug(it manages airlines)
set path+=.,**,
set wildignore+='*.swp,.git,.gitignore' " ignore pattern whild expanding wildcard
set hidden                              " allows to change buffer without saving

""""""""""""""""""""  sourcing files   """"""""""""""""""""""""""""
source ~/.vim/mappings.vim 
"""""""""""""""""

" Plugins, see: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
call plug#end()

""""""""""""""""""  GruvBox theme options   """""""""""""""""""""""
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox
""""""""""""""""

""""""""""""""""""  IndetLines Plugin options """""""""""""""""""""
let g:indentLine_enabled = 0
let g:indentLine_setConceal = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""" ALE Plugin options """""""""""""""""""""       
" Enable completion where available.                              
" This setting must be set before ALE is loaded.                  
" You should not turn this setting on if you wish to use ALE as a completion    
" source for other completion plugins, like Deoplete.             
let g:ale_completion_enabled = 1                                  
let g:ale_sign_column_always = 1                                  
let g:ale_lint_on_text_changed = 1                                
let g:ale_lint_on_insert_leave = 1                                
let g:ale_lint_on_enter = 1                                       
let g:ale_lint_on_save = 1                                        
let g:ale_lint_on_filetype_changed = 1                            
let g:ale_fix_on_save = 1
""""""""""""""""

"""""""""""""""""" vim-airline  """""""""""""""""""""""""""""""""""
let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""
