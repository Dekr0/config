" vim-plucall plug#begin('~/AppData/Local/nvim/plugged')
call plug#begin('~/.config/nvim/plugged')
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" discord
Plug 'andweeb/presence.nvim'

" gruvbox
Plug 'morhetz/gruvbox'

" markdown
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['markdown', 'vim-plug'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vimtex
Plug 'lervag/vimtex'

" ultisnips
Plug 'SirVer/ultisnips'

" vim-snippets
Plug 'honza/vim-snippets'

call plug#end()


" Basic Keymap
let mapleader = " "

noremap <LEADER><CR> :nohlsearch<CR>

map Q :q<CR>
map s <nop>
map S :w<CR>


" Basic Setting
syntax on

set cursorline
set number
set relativenumber
set showcmd
set wildmenu
set wrap
set hlsearch
set incsearch
set smartcase


" coc-config
set hidden
set updatetime=100

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif


" coc-plugin
" * - enabled
" + - existed
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp']


" gruvbox
colorscheme gruvbox
set background=dark


" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = 'chromium'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']


" markdown-table
noremap <Leader>tm :TableModeToggle<CR> 

function! s:isAtStartOfLine(mapping)
	  let text_before_cursor = getline('.')[0 : col('.')-1]
	  let mapping_pattern = '\V' . escape(a:mapping, '\')
	  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
	\ <SID>isAtStartOfLine('\|\|') ?
	\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

inoreabbrev <expr> __
	\ <SID>isAtStartOfLine('__') ?
	\ '<c-o>:silent! TableModeDisable<cr>' : '__'


" markdown-snippits
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap .h {{< highlight go "linenos=false" >}}<Enter><++><Enter>{{< / highlight >}}<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,j img_<++>.jpg <Esc>F_a
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap .l $$$$ <++><Esc>F$hi
autocmd Filetype markdown inoremap <c <center><Enter><++><Enter></center><Enter><Enter><++><Esc>4kA


" vimtex
let g:tex_flavor='latex'
