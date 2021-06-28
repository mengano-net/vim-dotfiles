" ----------------------  sourcing files ---------------------------
source ~/.config/nvim/defaults.vim
source ~/.config/nvim/mappings.vim


" ----------------------  Plugins  ---------------------------
" Plugins, see: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

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
