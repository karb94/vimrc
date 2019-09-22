filetype off
filetype plugin on
syntax on
syntax enable

"Settings
let &t_SI.="\e[6 q"             "Change cursor shape in insert mode
let &t_SR.="\e[4 q"             "Change cursor shape in replace mode
let &t_EI.="\e[2 q"             "Change cursor shape in normal mode
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
colorscheme peachpuff


"Install the plugin manager vim-plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'vim-syntastic/syntastic'
call plug#end()

"Sneak
map <leader>f <Plug>Sneak_s
map <leader>F <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

nnoremap <silent> f :<C-U>call sneak#wrap('',           1, 0, 1, 1)<CR>
nnoremap <silent> F :<C-U>call sneak#wrap('',           1, 1, 1, 1)<CR>
xnoremap <silent> f :<C-U>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>
xnoremap <silent> F :<C-U>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>
onoremap <silent> f :<C-U>call sneak#wrap(v:operator,   1, 0, 1, 1)<CR>
onoremap <silent> F :<C-U>call sneak#wrap(v:operator,   1, 1, 1, 1)<CR>

nnoremap <silent> t :<C-U>call sneak#wrap('',           1, 0, 1, 1)<CR>
nnoremap <silent> T :<C-U>call sneak#wrap('',           1, 1, 1, 1)<CR>
xnoremap <silent> t :<C-U>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>
xnoremap <silent> T :<C-U>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>
onoremap <silent> t :<C-U>call sneak#wrap(v:operator,   1, 0, 1, 1)<CR>
onoremap <silent> T :<C-U>call sneak#wrap(v:operator,   1, 1, 1, 1)<CR>
let g:sneak#label = 1

"Fuzzy Finder (FZF)
nnoremap <leader>b :Buffers<CR>
nnoremap <C-r> :History:<CR>
nnoremap <C-t> :Files<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>l :BLines<CR>

"Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Mappings
inoremap lk <Esc>
vnoremap lk <Esc>
nnoremap <leader>c mbI#<Esc>`b
nnoremap <leader>u mb^x`b
nnoremap <leader>v :vsplit<CR><C-w>w
nnoremap <C-w> <C-w>w
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>o mbo<Esc>`b
nnoremap <leader>O mbO<Esc>`b
"nnoremap <leader>e :SyntasticCheck<CR>
"nnoremap <leader>s :ToggleSyntastic<CR>
inoremap ;; <C-n>
nnoremap <leader>j J
nnoremap J 3<C-e>
nnoremap K 3<C-y>
nnoremap U :redo<CR>

hi SpellBad cterm=bold,italic,underline  ctermfg=000 ctermbg=Red
highlight LineNr ctermfg=Yellow
highlight CursorLineNr ctermfg=Yellow
highlight Normal ctermfg=White

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



"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"let g:syntastic_mode_map = { 'mode': 'passive' }
