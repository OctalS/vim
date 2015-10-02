"""""""""" Global settings """"""""""
set number
set showmatch
set hlsearch
set fo-=r
set nowrap
set mouse=a
syntax off
filetype on
" Gui globals
if has("gui_running")
  set guioptions+=b
  set stal=2
  set lines=999
  set columns=999
  winpos 0 0 
endif

" Jump to last line when reopeing a file 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""" Custom Key Maps """"""""""
map <F2> I//<ESC>
map <F3> :nohls<CR>
map <F4> :syntax on<CR>
map <S-F4>: syntax off<CR>
map <F12> :syntax sync fromstart<CR>

"""""""""" Syntax and coloring """"""""""

if has("gui_running")
  au BufReadPre,BufNewFile *.[^c],*.[^c][^p][^p],*.[^c][^c],*.[^h],*.[^h][^p][^p],*.[^j][^a][^v][^a] colorscheme morning
  au BufReadPre,BufNewFile *.c,*.cpp,*.cc,*.h,*.hpp,*.java syntax on | colorscheme vlad
else
  au BufRead,BufNewFile *.c,*.cpp,*.cc,*.h,*.hpp,*.java syntax on | colorscheme vlad
endif

"""""""""" Cscope settings """"""""""
if has("cscope")
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  set csverb

  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <A-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <A-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <A-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  nmap <A-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <A-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <A-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <A-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <A-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
endif

"""""""""" clang_complete settings """"""""""
set completeopt=menu,menuone,longest
let g:clang_snippets_engine='clang_complete'
let g:clang_snippets=1
let g:clang_complete_copen=1

"""""""""" Misc """"""""""
" Scitools Understand context menu
:command! UMenu silent: exe "!~/tools/scitools/bin/linux64/understand -existing -contextmenu " expand("%:p") " -line " line('.') " -col " col('.') " -text <cword> &" | redraw!
map <F11> :UMenu<CR>
