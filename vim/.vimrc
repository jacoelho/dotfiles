set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

let mapleader=","

" backspace insert mode
set backspace=indent,eol,start
set number
set list
set listchars=tab:▸\ ,eol:¬
set novisualbell " Mute error bell

colorscheme molokai
let g:rehash256 = 1

function! StripTrailingWhitespaces()
  " Don't try to strip whitespace in non buffers
  if (!empty(&buftype))
    return
  endif

  " Only strip whitespace if isn't a slim, haml or emblem file
  if &filetype =~ 'slim' || &filetype =~ 'haml' || &filetype =~ 'emblem'
    return
  endif
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Tabularize {
if isdirectory(expand("~/.vim/bundle/tabular"))
    nmap <Leader>as :Tabularize /^\s*\w*<CR>
    vmap <Leader>as :Tabularize /^\s*\w*<CR>
endif

" Column color
set colorcolumn=80
set fillchars+=vert:│
highlight ColorColumn guibg=#1e1e1e
highlight clear SignColumn

" Override color scheme
autocmd ColorScheme * highlight VertSplit guibg=NONE
autocmd ColorScheme * highlight NonText guifg=bg
