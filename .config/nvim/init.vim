" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

Plug 'donRaphaco/neotex', { 'for': 'tex' }

Plug 'yggdroot/indentline'

Plug 'itchyny/lightline.vim'
Plug 'bagrat/vim-buffet'
Plug 'ryanoasis/vim-devicons'

Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'

Plug 'mattn/emmet-vim'

Plug 'stevearc/vim-arduino'

Plug 'hsanson/vim-android'

Plug 'Shadowsith/vim-dotnet'

Plug 'tpope/vim-fugitive'

Plug 'vim-scripts/VimIRC.vim'

Plug 'idbrii/vim-unreal'

Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'

Plug 'termhn/i3-vim-nav'

Plug 'sophacles/vim-processing'

Plug 'ObserverOfTime/coloresque.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Initialize plugin system
call plug#end()

filetype plugin on

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

set number
set guifont=Fira\ Code:h12
syntax on
filetype on
set encoding=utf-8
set so=10
set conceallevel=0
set mouse=nvi

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.o$']
let g:neotex_enabled=2
let g:tex_flavor = 'latex'
let g:buffet_use_devicons = 1
let g:vim_markdown_conceal = 0
let mapleader = ","

let g:SuperTabMappingForward="<c-tab>"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap c "_c
nnoremap Q !!bash<CR>
nnoremap <buffer> <F9> :!%:p<cr>
nnoremap <F2> :setlocal spell! spelllang=en_us<CR>

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

map <F11> "+y
map <F12> "+p

nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :TagbarToggle<CR>

nmap <F7> :tabnew<cr>
nmap <F8> :tabclose<cr>
nmap <F9> :tabprevious<cr>
nmap <F10> :tabnext<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementations)
nmap <silent> gr <Plug>(coc-references)

nmap ZO :wqall<cr>
nmap Zo :qall!<cr>

nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocActionAsync('doHover')
	endif
endfunction

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

map S :%s//g<Left><Left>


