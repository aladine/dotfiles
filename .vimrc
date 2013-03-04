" Configuration inspired by http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
call pathogen#infect()

syntax enable
filetype plugin indent on       " load file type plugins + indentation

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

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
" http://vimcasts.org/e/14
" cnoremap %% <C-R>=expand('%:h').'/'<cr>
" map <leader>ew :e %%
nnoremap <leader><leader> <c-^>

let g:CommandTMaxHeight=10
let g:CommandTMinHeight=4

" Rspec
" function! RSpecFile()
"   execute("!clear && rspec " . expand("%p"))
" endfunction
" map <leader>S :call RSpecFile() <CR>
" command! RSpecFile call RSpecFile()
" 
" function! RSpecCurrent()
"   execute("!clear && rspec " . expand("%p") . ":" . line("."))
" endfunction
" map <leader>s :call RSpecCurrent() <CR>
" command! RSpecCurrent call RSpecCurrent()
" Rspec
function! RSpecLine()
  execute "!echo rspec " . expand("%") . " -l " . line('.') " > test-commands"
endfunction
function! RSpecFile()
  execute "!echo rspec " . expand("%") . " > test-commands"
endfunction
map <leader>s :w\|:call RSpecLine() <CR>\|:redraw!<CR>
map <leader>S :w\|:call RSpecFile() <CR>\|:redraw!<CR>


" Terminal Profile: http://noahfrederick.com/blog/2012/hemisu-for-lion-terminal/
" Font: Monaco 14 pt.
" Advanced: xterm-16color http://blog.remibergsma.com/2012/03/15/tweak-the-osx-terminal-to-display-colors/
" Color scheme: http://ethanschoonover.com/solarized

" 16 or 256
" let g:solarized_termcolors=   16
" 0 or 1
" let g:solarized_termtrans =   0
" let g:solarized_degrade   =   0
" let g:solarized_bold      =   1
" let g:solarized_underline =   1
" let g:solarized_italic    =   1
" normal, high or low
" let g:solarized_contrast  =   "normal"
" let g:solarized_visibility=   "normal"

set background=dark
"colorscheme solarized
colorscheme hemisu

" ctags -R --languages=ruby --exclude=.git

" https://gist.github.com/992a32cf1ef8651bd2c2 " tmux send -t zsh.0
" "RSpec::Core::Runner.run(['spec/models/products/book_spec.rb:33'], STDERR,
" STDOUT)" ENTER
"
" RSpec::Core::CommandLine.new().run()new

" Remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set grepprg=ack
set tags=./tags
