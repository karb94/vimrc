filetype off
filetype plugin on
syntax on
syntax enable

"Settings
highlight Normal ctermfg=White
highlight Cursor ctermfg=Blue
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
set nohlsearch                  "no highlights during search
set number relativenumber       "set relative number on
set incsearch                   "starts searching while you type
set ignorecase                  "Ingores case in searches
set smartcase                   "In combination with ignorecase, only ignores case when no uppercase is used
set tabstop=4                   "The tab key produces 4 'visual' spaces (only in vim, thus the need for expandtab)
set expandtab                   "Converts tabs into spaces
set path+=**                    "You can search for any file in any subdirectory (as long as you enter the exact name)
set wildmenu                    "It opens a horizontal menu where you cycle with <Tab> and <S-Tab>
set wildmode=longest:full,full  "Will complete to the longest common command
set timeoutlen=500              "Time waited for mappings
set shiftwidth=4                "Sets the number of spaces when indenting with '>>'
set autoindent                  "Sets new line with same indentation as current line
set smartindent                 "Auto-indents for {
let mapleader=" "               "Sets leader key
hi SpellBad cterm=bold,italic,underline  ctermfg=000 ctermbg=Red
highlight LineNr ctermfg=Yellow
highlight CursorLineNr ctermfg=Yellow

"Mappings
inoremap lk <Esc>
vnoremap lk <Esc>
nnoremap <leader>c mbI#<Esc>`b
nnoremap <leader>u mb^x`b
nnoremap <leader>v :vsplit<CR><C-w>w
nnoremap <leader>b :b<Space>
nnoremap <C-w> <C-w>w
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>o mbo<Esc>`b
nnoremap <leader>O mbO<Esc>`b
nnoremap <leader>e :SyntasticCheck<CR>
nnoremap <leader>t :ToggleSyntastic<CR>
inoremap ;; <C-n>
nnoremap <leader>j J
nnoremap J j
nnoremap K k

"Status bar
set laststatus=2
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermbg=Yellow ctermfg=0
  elseif a:mode == 'v'
    hi statusline ctermbg=166  ctermfg=0
  elseif a:mode == 'r'
    hi statusline ctermbg=Red  ctermfg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline  ctermbg=Blue ctermfg=0

" default the statusline to green when entering Vim
hi statusline ctermbg=Blue ctermfg=0
set statusline=%f%r%m%=%P


call plug#begin()
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

let g:syntastic_mode_map = { 'mode': 'passive' }
