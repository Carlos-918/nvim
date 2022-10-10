"syntax on 
set noerrorbells
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber
set wrap
set signcolumn=yes
set scrolloff=8
set showmode

set mouse=

"set colorcolumn=80
"highlight ColorColum ctermbg=0 guibg=lightgrey


call plug#begin('~/.config/nvim/plugged') 
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
"Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man' 
"Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'
""for some reason ycm gives me error (python) 
"Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
""auto complete coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'Preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ajh17/VimCompletesMe'

Plug 'yggdroot/indentline'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ojroques/vim-oscyank', {'branch': 'main'}

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/','git --git-dir']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0
let g:loaded_clipboard_provider = 0
let g:python3_host_prog = '/bin/python3'
let g:ctrl_use_caching = 0
let g:vcm_default_maps=0
let g:loaded_clipboard_provider = 1

nnoremap <leader>f :FZF<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
"made to easy use in planckton
"imap /<Tab> <plug>vim_completes_me_forward
"Fix to windows ctrl+v overlap
nnoremap <leader>v <C-v>

""mapping for paste
"Cool remap for the use of <viW> that keeps in register the pasted word NOT the deleted one
xnoremap <leader>p "_dP

nnoremap <slent><leader>e :put =trim(execute(input(':', '', 'command')))<CR>i
"route of the file
"nnoremap <leader>kp :let @+=expand("%")<CR>

"faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
nmap <leader>s <Plug>(easymotion-s2)

"mapping for clipboard yank
vnoremap <leader>y :OSCYank<CR>

" Open a virtual terminal
function! OpenTerminal()
    "move to right buffer
    execute "normal \<C-l>"
    "open terminal
    execute "vsp term://bash" 
    "toggle insert mode
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!
    "set maps inside terminal buffer
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <ESC> <C-\\><C-n>"
endfunction

nmap <C-t> :call OpenTerminal()<CR>

