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
" set iskeyword+=-

" Redrawtime in miliseconds to redraw buffer
set redrawtime=1000


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

" Open the hotkeys help file in a non editable vertical split
nmap <leader>hk :vsplit ~/.config/nvim/hotkeys.vim <Bar> :vertical resize -15 <Bar> :setlocal nomodifiable<CR>

" Enter :Config in normal mode to edit vim's configuration
command! Config execute ":e ~/.config/nvim/init.vim"

" Enter :Reload to apply latest vim configuration
command! Reload execute "source ~/.config/nvim/init.vim"

" Open nvim's built-in terminal in a below split
nmap <leader>t :split term://zsh <Bar> :setlocal modifiable<CR>

" With nvim's terminal, once you get into 'insert' mode, the escape sequence
" is weird, so I'm making it easier
tnoremap <Esc> <C-\><C-n>

" #######################################################


" #######################################################
" My editing defaults for yaml files
" #######################################################
augroup yamlfiles
  " Set tabs to 2
  autocmd BufReadPost,BufWinEnter *.yaml,*.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufWinLeave,BufDelete,BufWinLeave *.yaml,*.yml setlocal tabstop=4 softtabstop=4 shiftwidth=4

  " Remove empty line on writing buffers
  autocmd BufWritePre *.yaml,*.yml silent! g/^$/d
  " Optionaly, remove trailing spaces on writing buffers
  " autocmd BufWritePre *.yaml,*.yml silent! %s/\s\+$//
augroup END


" #######################################################
" My plugins, I'm using https://github.com/junegunn/vim-plug
" #######################################################
call plug#begin('~/.config/nvim/plugged')

" Gruvbox theme
Plug 'morhetz/gruvbox'

" ctrl-p fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

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

" DevIcons
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" ----------------------  gruvbox plugin ---------------------------
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

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

" Skip empty sections
let g:airline_skip_empty_sections = 1

" Enable tabs above, wih each buffer opened
let g:airline#extensions#tabline#enabled = 1

" Omit full path on filename, on section 'c'
" let g:airline_section_c_only_filename = 1
let g:airline_stl_path_style = 'short'

" Display only current line and column numbers on section z
let g:airline_section_z = '%2l/%L ☰ %2v'

" I'm not enabling ALE on sectionz, leaving it here in case I change my mind
let g:airline#extensions#ale#enabled = 0

" Disable airline on FocusLost autocommand (e.g. when Vim loses focus): >
let g:airline_focuslost_inactive = 1

" ---------------------- ctril-p  plugin options ---------------------------
" See :h ctrlp-options
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_line_prefix = '> '
let g:ctrlp_by_filename = 0

" ---------------------- Fern  plugin options ---------------------------
" Copy most of this from https://github.com/nickjj/dotfiles
" Disable vim's built-in netrw file browser.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  " nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

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



