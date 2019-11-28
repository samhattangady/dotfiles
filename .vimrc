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

" Show status line at all points
set laststatus=2

" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Reset syntax highlighting
nnoremap <F12> :syntax sync fromstart<CR>

" Highlight trailing whitespace. [Except on line currently being typed.]
highlight ExtraWhiteSpace ctermbg=red
match ExtraWhiteSpace /\s\+\%#\@<!$/

" Ignore node_modules when using vimgrep
set wildignore+=**/node_modules/**

