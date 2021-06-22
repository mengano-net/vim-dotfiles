set encoding=UTF-8
syntax on
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" set numbers ruler, relative numbers
set number
set relativenumber
set ruler

set nowrap
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch

" Toggles pasting of indented code
set pastetoggle=<F2>

" Unset paste mode aboue on InsertLeave action, that is leaving insert mode
autocmd InsertLeave * silent! set nopaste

" set cursor line, cursor column and vertical bar at cloumn 100
set cul
set cuc
set colorcolumn=100

" Not used since I've got airline plug
" set statusline=

" Always show tab line
set showtabline=2

" 256 color scheme for terminal
set t_Co=256

" set backspace to delete without insertion first
set backspace=indent,eol,start

" Not needed after airline Plug(it manages airlines)
set noshowmode

" Set path while searching for files
set path+=.,**,

" ignore pattern while expanding wildcard
set wildignore+='*.swp,.git,.gitignore'

" allows to change buffer without saving
set hidden

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f
set spelllang=en_us

" Splitting below and right, more natural
set splitbelow
set splitright

" Set menu wildmenu size, one that comes up during autocompletion
set wildmenu
set wildmode=full

" Do not show cursor lines in inactive buffers.
augroup ActiveBuffer
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cuc
  au WinLeave * setlocal nocursorline nocuc
augroup END

" paste from vim into system clipboard
" set clipboard=unnamedplus

" Tread '-' as a word separator
set iskeyword+=-

" ----------------------  sourcing files ---------------------------
source ~/.vim/keymap/mappings.vim

" ----------------------  Plugins  ---------------------------
" Plugins, see: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" Show/toggle indent characers
Plug 'Yggdroot/indentLine'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" ctrl-p bring up a file browser
Plug 'ctrlpvim/ctrlp.vim'

" Another NERDTree file browser
Plug 'preservim/nerdtree'

" NerdTree syntax highliter
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Adding icons to plugins, such as NerdTree
Plug 'ryanoasis/vim-devicons'

" Autocompletion
Plug 'dense-analysis/ale'

" Airline and its themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" use 'gcc' to toggel comments
Plug 'tpope/vim-commentary'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Better show whitespaces
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" ----------------------  gruvbox plugin ---------------------------
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

" ----------------------  IndentLine plugin ---------------------------
let g:indentLine_enabled = 0
let g:indentLine_setConceal = 1

" ----------------------  ALE plugin options ---------------------------
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

" ---------------------- vim-ariline  plugin options ---------------------------
" see :h airline
let g:airline_theme='term'
let g:airline_detect_paste = 1
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_count = 1
" Display only file name on section 'c' =, which is for filename
let g:airline_section_c_only_filename = 1

" ---------------------- ctril-p  plugin options ---------------------------
" See :h ctrlp-options
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_line_prefix = '> '
let g:ctrlp_by_filename = 0
