" Plugins
call plug#begin('~/.local/share/nvim/plugged')

"General
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Coding
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

" Writing
Plug 'reedes/vim-pencil'

" Zettelkasten
Plug 'junegunn/fzf.vim'

call plug#end()

" Plugin Settings
"" General
set nocompatible
filetype plugin on
syntax on

"" Commenter
let g:NERDSpaceDelims = 1

"" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_default_coefficient = 0.4

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Settings
set hidden
syntax on
set nowrap
set nu rnu

let mapleader = ' '

set bg=dark
colorscheme lena

" Tab Settings
"" General
set clipboard+=unnamed,unnamedplus
set expandtab
set ignorecase
set mouse=a
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

set history=200

" File Type Options
"" HTML
au BufRead,BufNewFile *.html,*.scss,*.esh,*.css setlocal shiftwidth=2 tabstop=2 expandtab

" Competitive Programming
"" General
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

"" Mappings
map <F8> :<C-U>!g++ -O2 -DLOCAL -std=c++17 -Wall -Wextra -Wno-unused-result -static %:r.cpp -o %:r<CR>
nmap <leader>y ggVG"+y''

" Note Taking
"" Mappings
nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>
nnoremap <leader>nf :Files<CR>
nnoremap <leader>ns :Ag<CR>
nnoremap <leader>tg :silent !ctags -R . <CR>:redraw!<CR>
nnoremap <leader>ts :Tags<CR>

"" Linking
let g:zettelkasten = "/home/kaunta/src/notes/"
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M%S") . "-<args>.md"
nnoremap <leader>nz :NewZettel 

function! HandleFZF(file)
    "let filename = fnameescape(fnamemodify(a:file, ":t"))
    "why only the tail ?  I believe the whole filename must be linked unless everything is flat ...
    let filename = fnameescape(a:file)
    let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
    put=mdlink
endfunction

command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)

nnoremap <leader>na :call fzf#run({'sink': 'HandleFZF'})<CR>
