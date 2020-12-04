let g:airline_powerline_fonts = 0
let g:airline#extensions#branch#displayed_head_limit = 10

""" remapping leader to comma key
let mapleader = ","
let maplocalleader = ","

""" reload .vimrc
"nmap <leader>v :source $MYVIMRC<CR>
"nmap <leader>V :tabnew $MYVIMRC<CR>
"
""" escape
inoremap jj <Esc>

""" FZF bindings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>r :History<CR>

""" nerdtree bindings
nmap ;; :NERDTreeToggle<CR>
nmap ] :NERDTreeFind<CR>

""" some sanite mappings
cab WQ wq | cab Wq wq | cab W w | cab Q q

""" cursor line
set cursorline

""" line numbers
set number

nmap <F8> :TagbarToggle<CR>
nnoremap <C-]> g<C-]>

set autowrite

colorscheme nord
let $BAT_THEME = 'Nord'

syntax on

"Navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" Dev shortcuts
nmap <leader>ds :!shadowenv exec -- /opt/dev/bin/dev style --include-branch-commits<cr>
nmap <leader>dt :!shadowenv exec -- /opt/dev/bin/dev test<cr>
nmap <leader>dtb :!shadowenv exec -- /opt/dev/bin/dev test --include-branch-commits<cr>
nmap <leader>dtl :!shadowenv exec -- /opt/dev/bin/dev test <cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

set hid "change buffer without saving

set whichwrap+=<,>,h,l  "characters that move the cursor to the previous/next line when at beginning/end

"Search
set ignorecase "ignore case in search
set smartcase  "unless the search term has uppercase
set hlsearch
set magic
"clear highlighted search
map <silent> <leader><cr> :noh<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Use the arrows to something usefull (switch buffers)
map <right> :bn<cr>
map <left> :bp<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" When pressing <leader>cd switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>

"Shortcut for displaying/hiding Invisibles from vimcasts
nmap <leader>l :set list!<CR>
set listchars+=tab:▸\ ,eol:¬,trail:␣,extends:⇉,precedes:⇇,nbsp:·

 "move in the same line if it is wrapped
nnoremap k gk
nnoremap j gj

"Commentary
"noremap \ :Commentary<CR>
"autocmd FileType ruby setlocal commentstring=#\ %s

" ALE
nmap <LEADER>af :ALEFix<CR>
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1

let g:ale_fixers = {
\  'ruby': [
\    'remove_trailing_lines',
\    'trim_whitespace',
\    'rubocop'
\  ]
\}
let g:ale_linters = {'ruby': ['rubocop', 'ruby']}
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
let g:ruby_indent_assignment_style = 'variable'

" vim-ruby
let g:ruby_indent_access_modifier_style = 'normal'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

set laststatus=2 "when the status line appears in the last window (2 = always)

"Escape in terminal mode
"tnoremap <Esc> <C-\><C-n>

filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
