"syntax on 
set noerrorbells
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber
set wrap
"set nowrap
set signcolumn=yes
set scrolloff=8
set showmode

"get rid of mouse in nvim
set mouse=

"set colorcolumn=80
"highlight ColorColum ctermbg=0 guibg=lightgrey


call plug#begin('~/.config/nvim/plugged') 
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
"Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man' 
"Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'

""for some reason ycm gives me error (python) 
"Plug 'ycm-core/YouCompleteMe'
"
Plug 'mbbill/undotree'
""auto complete coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'Preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'ajh17/VimCompletesMe'

Plug 'yggdroot/indentline'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ojroques/vim-oscyank', {'branch': 'main'}

call plug#end()

"colorscheme gruvbox

set background=dark
"" Set contrast.
"" This configuration option should be placed before `colorscheme gruvbox-material`.
"" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'

" For better performance
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

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
nnoremap <leader>t gt
nnoremap <leader>T gT
""made to easy use in planckton
"imap /<Tab> <plug>vim_completes_me_forward
""Fix to windows ctrl+v overlap
nnoremap <leader>v <C-v>

""CoC config
" use <c-space>for trigger completion
set updatetime=300
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


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

