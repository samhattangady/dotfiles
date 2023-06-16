" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Handle tabs and spaces
set expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4

" Changes default split behaviour to open vsplit on right etc.
set splitright splitbelow

" Allow mouse control
set mouse=a

" Allow undo even after closing (and reopening) vim
set undodir=~/.vimdid
set undofile

" Set file indents
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype lisp setlocal ts=2 sw=2 sts=0 expandtab
set autoindent

" syntax highlighting for different filetypes
au BufRead,BufNewFile *.vasm set syntax=hovalaag
au BufRead,BufNewFile *.glsl set syntax=glsl
au BufRead,BufNewFile *.p8 set syntax=pico8
au BufRead,BufNewFile *.zig set syntax=zig
au BufRead,BufNewFile *.bol set syntax=bol

" Show status line at all points
set laststatus=2

" what is ruler
set ruler

" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Reset syntax highlighting
nnoremap <F12> :syntax sync fromstart<CR>

" Highlight trailing whitespace. [Except on line currently being typed.]
highlight ExtraWhiteSpace ctermbg=red
match ExtraWhiteSpace /\s\+\%#\@<!$/

" Ignore node_modules when using vimgrep
set wildignore+=**/node_modules/**

" Settings for gvim 
colorscheme slate
set guifont=JetBrains\ Mono:h10
set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar

" turn hybrid line numbers on
set number relativenumber

" enable ligatures
set renderoptions=type:directx
set encoding=utf-8

" prevent zig from searching through std lib for autocomplete
set complete-=i

" run run.sh on pressing f5
nnoremap <F5> :!run.bat<CR>
