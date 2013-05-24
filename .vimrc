" Configuration inspired by http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
call pathogen#infect()

syntax enable
filetype plugin indent on       " load file type plugins + indentation

set shell=/usr/local/bin/zsh

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
"set list                        " Show invisible characters
set backspace=indent,eol,start  " backspace through everything in insert mode
autocmd FileType ruby,coffee,js,c,php autocmd BufWritePre <buffer> :%s/\s\+$//e

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set number    " line numbers aren't needed
set ruler       " show the cursor position all the time
set cursorline  " highlight the line of the cursor
set showcmd     " display incomplete commands
set shell=bash  " avoids munging PATH under zsh
let g:is_bash=1 " default shell syntax
set history=200 " remember more Ex commands
set scrolloff=3 " have some context around the current line always on screen

" Auto-reload buffers when file changed on disk
set autoread

set backupdir=~/.vim/_backup    " where to put backup files.
set directory=~/.vim/_temp      " where to put swap files.

let mapleader=","

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
" cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

nnoremap <leader><leader> <c-^>

function! RSpecLine()
  execute "!echo bundle exec rspec " . expand("%") . " -l " . line('.') " > test-commands"
endfunction
function! RSpecFile()
  execute "!echo bundle exec rspec " . expand("%") . " > test-commands"
endfunction
map <leader>s :w\|:call RSpecLine() <CR>\|:redraw!<CR>
map <leader>S :w\|:call RSpecFile() <CR>\|:redraw!<CR>

map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>x :wq<CR>

" Terminal Profile: http://noahfrederick.com/blog/2012/hemisu-for-lion-terminal/
" Font: Monaco 14 pt.
" Advanced: xterm-16color http://blog.remibergsma.com/2012/03/15/tweak-the-osx-terminal-to-display-colors/
" Color scheme: http://ethanschoonover.com/solarized
set background=dark
colorscheme hemisu

" Remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :w\|:source $MYVIMRC<cr>
nnoremap <leader>zsh :e ~/.zshrc<cr>

set grepprg=ack

"set tags=./tags
nnoremap <leader>gtag :!ctags -R --languages=ruby --exclude=.git -f ./.git/tags --tag-relative=yes<cr>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
noremap <silent> <Leader>yy :TagbarToggle       " Display panel with y (or ,y)

" Ctrl-P mapping is overwritten
let g:ctrlp_map = '<leader>f'
let g:ctrlp_custom_ignore = 'tmp\|log\|public\|vendor/assets\|vendor/bundle\|vendor/plugins\|spec/cassett\|\.git\|cassett\|/.git\|/app/assets/image\|/coverage'
let g:ctrlp_working_path_mode = 1
nnoremap <leader>b :CtrlPBuffer<CR>

"map <leader>j :call JumpBetweenSpecAndCode()<cr>

"function! JumpBetweenSpecAndCode()
"  let filename = expand("%:t")
"  if filename =~ '_spec\.'
"  let filename = substitute(filename, '_spec', '', '')
"  let foundfile = findfile(filename, ";,**")
"  exec "edit " . foundfile
"  else
"  let filename = substitute(filename, '\.', '_spec\.', '')
"  let foundfile = findfile(filename, ";,**")
"  exec "edit " . foundfile
"  endif
"endfunction
"
" From Alex for opening spec file for current file
" map <leader>A :on<CR>\|:vsplit<CR>\|<c-w>l\|:A<CR>
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

set runtimepath+=~/.vim/ultisnips_rep
