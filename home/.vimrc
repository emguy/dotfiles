"---------------------------
" .vimrc starts from here
"---------------------------
"colorscheme torte
set background=dark
set nocindent
set noautoindent
set nosmartindent
set nowrap
set nobackup
set nohlsearch
set noincsearch

set nostartofline
set noswapfile
set noignorecase
set nosmartcase
set ruler
set nonumber
set tabstop=2
set shiftwidth=2
set expandtab
set modeline
set modelines=3
set nowritebackup
set scrolloff=3
set shortmess=atI
set showcmd
set showmatch
set title
set ttyfast
set visualbell t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set splitbelow
set splitright

"---------------------------
" keymap
"---------------------------
nnoremap <c-p> :bprevious<CR>
nnoremap <c-n> :bnext<CR>
nnoremap <space> :call ToggleHighlightUnderCursor()<CR>

let mapleader=","
nnoremap <leader>b :ls<CR>:b<Space>


""---------------------------
"" status
""---------------------------
set laststatus=0
highlight statusline   ctermfg=lightgreen ctermbg=black cterm=underline,bold
highlight statuslinenc ctermfg=white ctermbg=black cterm=underline
highlight vertsplit    ctermfg=white ctermbg=black cterm=NONE



"---------------------------
" auto command
"---------------------------
autocmd BufRead,BufNewFile *.tex :set textwidth=72
autocmd BufRead,BufNewFile *.tex,*.txt :set spell
autocmd BufRead,BufNewFile *.m4 :set syntax=sh
autocmd BufRead,BufNewFile *presubmit :set syntax=Jenkinsfile
autocmd BufRead,BufNewFile *postsubmit :set syntax=Jenkinsfile

autocmd BufRead,BufNewFile *.json :set conceallevel=0

"--------------------------
" NERDTree
"--------------------------
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '|'

"---------------------------
" gvim
"--------------------------
if has("gui_running")
  colorscheme torte
  set guioptions-=T
  set guioptions-=m
  set guifont=Terminus:h11   " use this font
  set lines=30      " height = 50 lines
  set columns=80      " width = 100 columns
  "set selectmode=mouse,key,cmd
  "set keymodel=none
endif

"---------------------------
" load local vimrc
"---------------------------
if filereadable('.vimrc.local')
  source .vimrc.local
endif

"---------------------------
" netrw settings
"---------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"

autocmd BufEnter * syntax sync fromstart


"---------------------------
" miscs
"---------------------------
set backspace=indent,eol,start
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" set viminfo='10,\"100,:20,%,n~/.viminfo

"------------------------------------------------------------------
" functions - toggle highlight under cursor
"------------------------------------------------------------------
let g:HlUnderCursor = 0
function! ToggleHighlightUnderCursor()
  if g:HlUnderCursor == 0
    execute printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    let g:HlUnderCursor = 1
  else
    match none
    let g:HlUnderCursor = 0
  endif
endfunction

""------------------------------------------------------------------
"" function - enable eslint
""------------------------------------------------------------------
"let g:syntastic_javascript_checkers = ['eslint']
""let g:syntastic_js_checkers = ['jshint']
"let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
"command S SyntasticCheck

"---------------------------
" cscope
"---------------------------
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
  nnoremap <C-c>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nnoremap <C-c>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
  nnoremap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  nnoremap <F8> :!make<CR><CR>
endif
