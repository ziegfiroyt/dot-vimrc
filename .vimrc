call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'css', 'json', 'graphql'] }
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'voronkovich/ctrlp-nerdtree.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'flowtype/vim-flow'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'mileszs/ack.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'jparise/vim-graphql'
Plug 'dikiaap/minimalist'
call plug#end()

syntax on

set t_Co=256
set background=dark
colorscheme minimalist

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '@'
let g:ale_sign_warning = '!!'

let g:ale_fix_on_save = 1

let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

let g:NERDTreeIndicatorMap = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

:nnoremap <F2> :buffers<CR>:buffer<Space>
set guifont=Ubuntu\ Mono\ 11
set noswapfile

let NERDTreeShowHidden=0
function! StartUp()
  if 0 == argc()
    NERDTree /var/www
  end
endfunction
autocmd VimEnter * call StartUp()

set number               
set encoding=UTF-8
set expandtab
set shiftwidth=2
set softtabstop=2
let g:UltiSnipsExpandTrigger="<C-l>"

let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.htm PrettierAsync

map <F8> ggVG
map <C-S-l> :Prettier<CR>
map <C-n> :NERDTreeToggle<CR>
map <F12> :ALEGoToDefinition<CR>

autocmd GuiEnter * silent NERDTree
autocmd VimEnter * silent NERDTree

"-- AUTOCOMPLETION --"
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" comment out: 
" - gcc to commentout single line
" - gc to commentout the target of a motion

