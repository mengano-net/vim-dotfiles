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

" My editing defaults for yaml files
augroup yamlfiles
  " Set tabs to 2
  autocmd BufReadPost,BufWinEnter *.yaml,*.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufWinLeave,BufDelete,BufWinLeave *.yaml,*.yml setlocal tabstop=4 softtabstop=4 shiftwidth=4

  " Remove empty line on writing buffers
  autocmd BufWritePre *.yaml,*.yml silent! g/^$/d
  " Remove trailing spaces on writing buffers
  autocmd BufWritePre *.yaml,*.yml silent! %s/\s\+$//
augroup END

" Testing function to close the hotkeys buffers, if opened
function! Toggle_hotkey()
    for i in range(1, bufnr('$'))
        let bnum = bufnr(i)
        let bname = bufname(i)
        echom bnum
        echom bname
        " if bname == '/home/ec2-user/.config/nvim/hotkeys.vim'
        if bname == '/hotkeys.vim'
            " :bdelete bnum
            echom "found it!"
            return
        endif
    endfor
endfunction

function! Test()
    for i in range(1, bufnr('$'))
        let bname = bufname(i)
        echom bname
    endfor
endfunction
