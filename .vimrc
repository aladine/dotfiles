" Configuration inspired by http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi
set encoding=utf-8
call pathogen#infect()

syntax enable
filetype plugin indent on       " load file type plugins + indentation

set shell=/usr/local/bin/zsh
setlocal spell spelllang=en_us 

"" Whitespace
set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
"set list                        " Show invisible characters
set backspace=indent,eol,start  " backspace through everything in insert mode
autocmd FileType ruby,coffee,js,c,php autocmd BufWritePre <buffer> :%s/\s\+$//e
set tw=72
set fo+=1

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
set clipboard=unnamed

let mapleader=","

autocmd FileType make setlocal noexpandtab
map <leader>gg :topleft 100 :split Gemfile<cr>

nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!zeus cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!zeus rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!zeus rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

map <leader>S :call RunCurrentTest()<CR>
map <leader>s :call RunCurrentLineInTest()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End bjo stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>x :wq<CR>

" Terminal Profile: http://noahfrederick.com/blog/2012/hemisu-for-lion-terminal/
" Font: Monaco 14 pt.
" Advanced: xterm-16color http://blog.remibergsma.com/2012/03/15/tweak-the-osx-terminal-to-display-colors/
" Color scheme: http://ethanschoonover.com/solarized
"set background=dark
set background=dark
colorscheme hemisu

" Remapping escape
inoremap jk <esc>
inoremap <esc> <nop>

" .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :w\|:source $MYVIMRC<cr>
nnoremap <leader>zsh :e ~/.zshrc<cr>
nnoremap <leader>th :e ~/.oh-my-zsh/themes/chip.zsh-theme<cr>

set runtimepath^=~/.vim/bundle/ctrlp.vim

map <leader>j :call JumpBetweenSpecAndCode()<cr>

function! JumpBetweenSpecAndCode()
  let filename = expand("%:t")
  if filename =~ '_spec\.'
  let filename = substitute(filename, '_spec', '', '')
  let foundfile = findfile(filename, ";,**")
  exec "edit " . foundfile
  else
  let filename = substitute(filename, '\.', '_spec\.', '')
  let foundfile = findfile(filename, ";,**")
  exec "edit " . foundfile
  endif
endfunction

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" http://blog.siyelo.com/vim-tips-part-ii
" :vimgrep /CurrencyNumberHelper/ app/models/*.rb
" :Qargs
" :argdo %s/CurrencyNumberHelper/CurrencyHelper/g
" :argdo update
"command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
" populate the argument list with each of the files named in the quickfix list
"function! QuickfixFilenames()
"  let buffer_numbers = {}
"  for quickfix_item in getqflist()
"    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
"  endfor
"  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
"endfunction

" Ctrl-P mapping is overwritten
let g:ctrlp_map = '<leader>f'
let g:ctrlp_custom_ignore = 'tmp\|log\|public\|vendor/assets\|vendor/bundle\|vendor/plugins\|spec/cassett\|\.git\|cassett\|/.git\|/app/assets/image\|/coverage'
let g:ctrlp_working_path_mode = 0
nnoremap <leader>b :CtrlPBuffer<CR>

"nmap <Leader>b :CtrlPBuffer<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>

