" #######################################################
" My own set of 'basic' settings
" #######################################################

set encoding=UTF-8
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" set numbers ruler, relative numbers
set number
set relativenumber
set ruler

set nowrap
set nobackup
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set textwidth=99

" Toggles pasting of indented code
set pastetoggle=<F2>

" Unset paste mode aboue on InsertLeave action, that is leaving insert mode
autocmd InsertLeave * silent! set nopaste

" set cursor line, cursor column and vertical bar at cloumn 100
set cul
set cuc
set colorcolumn=100

" Always show tab line
set showtabline=2

" 256 color scheme for terminal
set t_Co=256

" set backspace to delete without insertion first
set backspace=indent,eol,start

" Not needed after airline Plug(it manages airlines)
set noshowmode
set noshowcmd

" Set path while searching for files
set path+=.,**,

" ignore pattern while expanding wildcard
set wildignore+='*.swp,.git,.gitignore'

" allows to close buffer without saving
set hidden

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f
set spelllang=en_us

" Splitting below and right is more natural
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
" set iskeyword+=-

" Redrawtime in miliseconds to redraw buffer
set redrawtime=250


" #######################################################
" My mappings not related to plug-ins, etc.
" Otherwise, those can be found in their related areas
" #######################################################

" Setting map leader to space
let mapleader = "\<Space>"
" let leader = "\<Space>"

" TAB in normal mode will cycle through buffers
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Use alt + hjkl to resize windows
nnoremap <A-j>    :resize -5<CR>
nnoremap <A-k>    :resize +5<CR>
nnoremap <A-h>    :vertical resize -5<CR>
nnoremap <A-l>    :vertical resize +5<CR>

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

" Open the hotkeys help file in a non editable vertical split
nmap <leader>hk :vsplit ~/.config/nvim/hotkeys.txt <Bar>
    \:vertical resize -15 <Bar>
    \:setlocal nomodifiable <Bar>
    \:redraw! <Bar>
    \:5sleep <Bar>
    \:bd
    \<CR>

" Enter :Reload to apply latest vim configuration
command! Reload execute "source ~/.config/nvim/init.vim"

" Open nvim's built-in terminal in a below split
nmap <leader>t :split term://zsh <Bar> :setlocal modifiable<CR>

" With nvim's terminal, once you get into 'insert' mode, the escape sequence
" is weird, so I'm making it easier
tnoremap <Esc> <C-\><C-n>

" Open quickfix window at the bottom with size 20.
nmap <leader>qf <cmd> copen 20<CR>


" #######################################################


" #######################################################
" For yaml filetypes
" #######################################################
augroup yamlfiles
    autocmd FileType yaml call SetYamlFileTypeOptions()
    function SetYamlFileTypeOptions()
        setlocal tabstop=2
        setlocal softtabstop=2
        setlocal shiftwidth=2
    endfunction
augroup END
" #######################################################



" #######################################################
" For python filetypes
" #######################################################
augroup pythonfiles
    autocmd FileType python call SetPythonFileTypeOptions()
    function SetPythonFileTypeOptions()
        setlocal tabstop=4
        setlocal softtabstop=4
        setlocal shiftwidth=4
    endfunction
augroup END
" #######################################################




" #######################################################
" My plugins, I'm using https://github.com/junegunn/vim-plug
" #######################################################
call plug#begin('~/.config/nvim/plugged')

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Fern tree browser
Plug 'lambdalisue/fern.vim'

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

" Git integration
Plug 'tpope/vim-fugitive'

" Add git gutter status information
Plug 'airblade/vim-gitgutter'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

" Lexima, autoclose parenthesis, curly braces, etc.
Plug 'cohama/lexima.vim'

" Formatter
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Coc, use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" #######################################################


" #######################################################
" Testing code
" #######################################################

function! Toggle_hotkey()
    for i in range(1, bufnr('$'))
        let bnum = bufnr(i)
        let bname = bufname(i)
        echo bnum
        echo bname
        " if match(bname,"hotkeys") != '-1'
        "     echo "Found it"
        "     echo bname
        " endif
    endfor
endfunction

function! Test()
    for i in range(1, bufnr('$'))
        let bnum = bufnr(i)
        let bname = bufname(i)
        echom bname
        echom bufwinnr("defaults")
    endfor
endfunction
