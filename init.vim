call plug#begin()
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plug 'vim-voom/VOoM'
let g:voom_default_mode="latex"

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'mechatroner/rainbow_csv'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Shortcut at F4 to compile C file and run on below split
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r') <bar> below split <bar> exec 'terminal ./'.shellescape('%:r') <bar> startinsert <CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Toggle NERDTree
nnoremap <C-B> :NERDTreeToggle<CR>

" Toggle the g:prettier#autoformat setting based on whether a config file can be found in the current directory or any parent directory. Note that this will override the g:prettier#autoformat setting!
let g:prettier#autoformat_config_present = 1

" Next/prev buffer shortcut
" nnoremap <C-PageUp> :bn<CR>
" nnoremap <C-PageDown> :bp<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>p :Prettier<CR>

" Tabbing
set tabstop=4 shiftwidth=4 expandtab

" Navigating
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-c> :bp\|bd #<CR>

set number
