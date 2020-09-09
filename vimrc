set nocompatible " no more legacy

" Vundle specifics
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
"
" " Required
" Plugin 'VundleVim/Vundle'

call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'xolox/vim-misc'

" File browsing and search
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

" delight
Plug 'Lokaltog/vim-easymotion'
Plug 'djoshea/vim-autoread'
Plug 'flazz/vim-colorschemes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'xolox/vim-colorscheme-switcher'

" languages
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'stevearc/vim-arduino'
Plug 'elixir-lang/vim-elixir'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-ragtag' " HTML and more
Plug 'godlygeek/tabular' " Aligns csv files

" pro ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'thoughtbot/vim-rspec'
Plug 'danchoi/ruby_bashrockets.vim'

" code formating and manipulation
Plug 'tsaleh/vim-align'
Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

" Git
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

call plug#end()              " required
" To install the plugins, load this file and run :PlugInstall

set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

"  Comments
set formatoptions-=cro " disables comment continuation

" to auto load changed files
set autoread

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_height = 40


if has("gui_running")
  map <D-p> :execute 'CtrlP '<cr>

  " avoids the unwanted substitution press enter key or type command to continue message
  map <D-s> :w<cr>
  imap <D-s> :w<cr>
endif


if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore=*/tmp/*,*.so,*.swp,*.zip,.git,vendor/plugins,spec/cassettes

let g:ctrlp_custom_ignore = 'spec/cassettes\|.git'

map <D-t> :tabnew<cr>
imap <D-t> <Esc>:tabnew<cr>

let mapleader=","
nnoremap ; :

set noswapfile  " medication for the herpes of text editing

set modeline
set modelines=2

set ignorecase " ignore case if all lowercase
set smartcase  " if some uppercase do not ignore case

set title " shows file name
set scrolloff=5  " pads lines for search results so we're never on edge of screen

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set ruler " shows cursor position
set number " shows numbers in left side

set showcmd " I think that shows the visual selection in the command area
set showmatch
set lazyredraw
set copyindent
set nobackup

" Don't wrap lines longer than the window's width
set nowrap
set linebreak
set sidescroll=5
set listchars+=precedes:<,extends:>

" ensure windows aren't crushed too small in split views
" set winwidth=120     " active split
" set winminwidth=80  " other splits
map <C-=> :winc

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Automatically save all files on blur
" autocmd BufLeave,FocusLost * silent! wall

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on



" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
map <Leader>; :nohlsearch<CR> " remove highlight

set list

au BufRead,BufNewFile *.hamlc set ft=haml

autocmd BufWritePre * :%s/\s\+$//e " delete trailing space automatically
autocmd BufWritepre  *    set noinsertmode
autocmd FileType c        setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8 noautoindent smartindent " 8 spaces instead of my usual 2
autocmd FileType make     setlocal noexpandtab

autocmd BufNewFile,BufRead *.dryml setfiletype xml
autocmd BufNewFile,BufRead Gemfile setfiletype ruby

set shortmess=atI
set visualbell
set noerrorbells

" NERD_tree
map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""

"Default to autoindenting of C like languages
"This is overridden per filetype below
set noautoindent smartindent

"The rest deal with whitespace handling and
"mainly make sure hardtabs are never entered
"as their interpretation is too non standard in my experience
set softtabstop=2
set tabstop=2
" Note if you don't set expandtab, vi will automatically merge
" runs of more than tabstop spaces into hardtabs. Clever but
" not what I usually want.
set expandtab
set shiftwidth=2
set shiftround
set nojoinspaces
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""

"Syntax highlighting if appropriate
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set incsearch "For fast terminals can highlight search string as you type
endif

if &diff
  "I'm only interested in diff colours
  syntax off
endif

let g:ragtag_global_maps = 1

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
highlight RedundantSpaces term=standout ctermbg=black guibg=black
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set filetype=ruby
au BufNewFile,BufRead *.jbuilder      set filetype=ruby

""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""

" align plugin stuff
call Align#AlignCtrl('W=|p1P1')
map <Leader>aa :Align =><CR>
map <Leader>ab :Align = <CR>
map <Leader>ac :Align { } <CR>
map <D-C-=> mzgg=G'z<Esc>

"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X

"<home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>
function! Home()
  let curcol = wincol()
  normal ^
  let newcol = wincol()
  if newcol == curcol
    normal 0
  endif
endfunction

"<end> goes to end of screen before end of line
imap <kend> <end>
nmap <kend> <end>
inoremap <silent> <end> <C-O>:call End()<CR>
nnoremap <silent> <end> :call End()<CR>
function! End()
  let curcol = wincol()
  normal g$
  let newcol = wincol()
  if newcol == curcol
    normal $
  endif
  "The following is to work around issue for insert mode only.
  "normal g$ doesn't go to pos after last char when appropriate.
  "More details and patch here:
  "http://www.pixelbeat.org/patches/vim-7.0023-eol.diff
  if virtcol(".") == virtcol("$") - 1
    normal $
  endif
endfunction

if has("gui_running")
  " commenting
  map <D-/> Vgc<ESC>
  vmap <D-/> gc<ESC>

  "Ctrl-{up,down} to scroll.
  "The following only works in gvim?
  "Also vim doesn't have default C-{home,end} bindings?
  nmap <C-up> <C-y>
  imap <C-up> <C-o><C-y>
  nmap <C-down> <C-e>
  imap <C-down> <C-o><C-e>

  imap <D-]> <Esc><D-]>
endif

" window splitting mappings
nmap <Leader>v :vs<CR>
" x
" PREFER SAVING EASILY
" nmap <Leader>s :w<CR>

" <leader>S opens a scratch buffer
nmap <Leader>S :Scratch<CR>

nmap <Leader>n :set number<CR>

" set ttimeoutlen=10
" set timeoutlen=150

" Auto-center the view on the next search term
nmap n nzz
nmap N Nzz

set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=1

" taken from http://stackoverflow.com/questions/13850914/vim-overloaded-mapping-for-multiple-modes
function! MapBoth(keys, rhs)
    execute 'nmap' a:keys a:rhs
    execute 'imap' a:keys '<C-o>' . a:rhs
endfunction

" fixing append in line
map <S-a> $a

" Easy window navigation
call MapBoth('<C-h>', '<C-w>h')
call MapBoth('<C-j>', '<C-w>j')
call MapBoth('<C-k>', '<C-w>k')
call MapBoth('<C-l>', '<C-w>l')

" Restore Cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" FROM Gary Bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<javascript\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1 || match(current_file, '\<validators\>') != -1 || match(current_file, '\<query_objects\>') != -1 || match(current_file, '\<value_objects\>') != 1

  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
      let new_file = substitute(new_file, '^assets/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = substitute(new_file, '\.jbuilder$', '_jbuilder_spec.rb', '')
    let new_file = substitute(new_file, '\.coffee$', '_spec.coffee', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_jbuilder_spec.rb', '.jbuilder', '')
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if match(current_file, 'coffee') != -1
      let new_file = substitute(new_file, '_spec.coffee$', '.coffee', '')
      let new_file = 'assets/' . new_file
    end
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" rubocop on the current file
map <Leader>r :!rubocop -a %<CR>

let g:rspec_command = "zeus test {spec}"

" Allow ci( to work as desired
function! New_cib()
    if search("(","bn") == line(".")
        sil exe "normal! f)ci("
        sil exe "normal! l"
        startinsert
    else
        sil exe "normal! f(ci("
        sil exe "normal! l"
        startinsert
    endif
endfunction

nnoremap ci( :call New_cib()<CR>
nnoremap cib :call New_cib()<CR>

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END


iab xdate     <c-r>=strftime("%d/%m/%y")<cr>
iab xdatetime <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --hidden -l -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" COLORS
colorscheme molokai

set cursorline        " highlight current line
set cursorcolumn      " highlight current column
set noballooneval
set balloondelay=100000
setlocal balloonexpr=
let g:netrw_nobeval = 1
