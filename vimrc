" CONFIG
" -----------------------------------------
"  TRICKS
"  in command mode, ctrl-a will expand file globs
"  e.g.  :bd *pdf, press ctrl-a and * will expand
"  to the full names of pdf files
"
"  Yank/Paste:
"
"  "0p to get most recent yank
"  https://stackoverflow.com/questions/3638542/any-way-to-delete-in-vim-without-overwriting-your-last-yank
"
"  compare buffers in two split windows:
"  :windo diffthis
"  :windo diffoff
"
" Symbolic links
"
" ln -s source_file destination_file(the link)
" ln -s ~/.vim/vimrc ~/.vimrc
" make a symbolic link (~/.vimrc) pointing to ~/.vim/vimrc
" SHORTCUTS
" ------------------------------------------

"https://github.com/junegunn/vim-plug
"before install, need to ,s to source .vimrc
"command:  :PlugInstall

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" disable parallel installation of plugins
let g:plug_threads = 1

call plug#begin('~/.vim/plugged')
  Plug 'Raimondi/delimitMate'
  Plug 'captbaritone/better-indent-support-for-php-with-html'
  Plug 'tell-k/vim-browsereload-mac'
  Plug 'Chiel92/vim-autoformat'
  Plug 'joonty/vdebug'
  Plug 'sheerun/vim-polyglot'
  Plug 'wesgibbs/vim-irblack'
  Plug 'mileszs/ack.vim'
  Plug 'vim-scripts/bufkill.vim'
  Plug 'vim-scripts/matchit.zip'
  Plug 'bling/vim-airline'
  Plug 'rking/ag.vim'
  Plug 'vim-scripts/greplace.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-repeat'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-surround'
  Plug 'majutsushi/tagbar'
  Plug 'vim-php/tagbar-phpctags.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tobyS/pdv' | Plug 'tobyS/vmustache'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets', { 'frozen': 1 }
  Plug 'stephpy/vim-php-cs-fixer'
  Plug 'craigemery/vim-autotag'
  " Plug '2072/PHP-Indenting-for-VIm'
  " Plug 'phpfmt/vim-phpfmt'
  " Plug 'joonty/vim-phpqa'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-endwise'
  " Plug 'szw/vim-maximizer'
  " Plug 'tpope/vim-rails'
  " Plug 'tpope/vim-cucumber'
  " Plug 'syntastic/syntax_checkers/ruby/rubylint.vim'
call plug#end()

" seoul256 (dark):
" Range:   233 (darkest) ~ 239 (lightest)
" Default: 237


" let g:seoul256_background = 233
" colo seoul25

let mapleader=","
filetype indent on


set diffopt=vertical
set clipboard=unnamed

set nocompatible

set t_Co=256

" Send more characters for redraws
set ttyfast

if !has('gui_running') "exclude for MacVim
" " Enable mouse use in all modes
" set mouse=a
" Enable mouse scrolling only, (let's me copy and paste without option key)
" http://superuser.com/questions/238362/enable-mouse-for-scrolling-only-in-vim-in-iterm-macosx
" http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
set mouse=nicr

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
" http://usevim.com/2012/05/16/mouse/
set ttymouse=xterm2
endif

" for browserreload-mac plugin https://browsereload-macvim.readthedocs.org/en/latest/
" :ChromeReloadStart
" :ChromeReloadStop
let g:returnApp = 'iTerm' " refocus back to iTerm after reload
" let g:returnAppFlag = 0 " prevent refocus to terminal 

"delimit
set backspace=2
let delimitMate_expand_cr = 2

" PHPQa
" let g:phpqa_codesniffer_cmd='$HOME/Development/zidisha_dev/zidisha2/vendor/bin/phpcs'
" let g:phpqa_messdetector_cmd='$HOME/Development/zidisha_dev/zidisha2/vendor/bin/phpmd'
" let g:phpqa_messdetector_autorun = 0
" let g:phpqa_codesniffer_autorun = 0
" let g:phpqa_open_loc = 1

"PHP-cs-fixer
" let g:php_cs_fixer_path = '$HOME/zidisha2/vendor/bin/php-cs-fixer'
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_fixers_list = 'phpdoc_params,align_double_arrow,align_equals,no_blank_lines_before_namespace'
nnoremap <silent><leader>fi :call PhpCsFixerFixFile()<CR>




" Toggle Tagbar
" nmap <leader>t :TagbarOpenAutoClose<CR>
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1

set updatetime=1000
" Ignore variables in Tagbar
let g:tagbar_type_php = {
    \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions:0:0',
        \ 'f:functions',
        \ 'j:javascript functions',
    \ ],
\ }

" need to go into this file and change ip address to match host machine(OS X),
" it changes often. Or else debugger won't work
" sudo vim /etc/php5/cli/conf.d/20-xdebug.ini
" sudo vim /etc/php5/fpm/conf.d/20-xdebug.ini
let g:vdebug_options = {
\ 'path_maps': {"/home/vagrant/zidisha2": "/Users/mark/Development/zidisha_dev/zidisha2",
\               "/home/vagrant/projects": "/Users/mark/Development/homestead"},
\ 'port': 10000,
\ 'break_on_open': 0
\}

" PHP documentor
let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" Ultisnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" nnoremap <tab> :call UltiSnips#ExpandSnippetOrJump()<CR> 
" nnoremap <D-tab> :call UltiSnips#JumpBackwards()<CR> 

" open current file in MacVim
nnoremap <leader>m :execute "! mvim +" . line(".") " -R %"<CR>  
" toggle pastemode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode

" https://stackoverflow.com/questions/8958047/in-vim-is-there-a-way-to-save-bookmarks-between-sessions
:set viminfo='1000,f1


"Greplace - use ag instead of grep
" http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
endif

"Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_html_tidy_exec = 'tidy'

" change cursor shape in different modes for OSX iTerm2
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
" statuline for Airline plugin
" let g:airline#extensions#default#layout = [ [ 'c', 'b', 'a' ], [ 'x', 'y', 'z', 'warning' ] ]
" let g:airline#extensions#default#layout = [ [ 'c', 'b'], [ 'x', 'z'] ]
" let g:airline_section_b = '%{getcwd()}'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_t = '%{tagbar#currenttag("[%s] ","")}'
" let g:airline#extensions#default#layout = [ [ 'c', 'b'], ['z'] ]
let g:airline#extensions#default#layout = [ [ 'c', 'b'], ['t', 'z'] ]
" let g:airline#extensions#tagbar#flags = ''
function! AirlineInit()
" let g:airline_section_a = airline#section#create(['%f'])
" let g:airline_section_b = airline#section#create(['branch'])
" let g:airline_section_b = 0
" let g:airline_section_x = 0
" let g:airline_section_y = 0
" let g:airline_section_z = 0
endfunction
autocmd VimEnter * call AirlineInit()


" maximize/restore current window
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

nmap <leader>u :echo 'leader is working'<CR>

"Quickly activate edit/reload the vimrc file
"
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>s :source $MYVIMRC<CR>
" nmap <leader>s :w<CR> :source %<CR>

" open new file in current directory
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/"<CR>

" Obsession, restore session
nnoremap <leader>rh :source $HOME/.vim/sessions/homestead.vim<CR>
nnoremap <leader>re :source $HOME/.vim/sessions/editor.vim<CR>
nnoremap <leader>rz :source $HOME/.vim/sessions/zidisha.vim<CR>

" fuzzyfinder keybindings
"nnoremap <leader>y :FufFile<CR>
" noremap <silent><leader>y :FufFile **/<CR>
"nnoremap <leader>d :FufDir<CR>
"nnoremap <leader>b :FufBufferTag<cr>
"nnoremap <leader>g :FufTag<cr>

" previous/next buffer
nnoremap <F11> :bp<cr>
nnoremap <F12> :bn<cr>


" window navigation
:noremap <C-j> <C-w>j
:noremap <C-k> <C-w>k
:noremap <C-h> <C-w>h
:noremap <C-l> <C-w>l
" goes to last active window
" :noremap <C-X> <C-W><C-P>
:noremap <C-A> <C-W><C-P>

" ctrl d to write
noremap <silent> <C-D> :write<CR>
vnoremap <silent> <C-D> <esc>:write<CR>
inoremap <silent> <C-D> <esc>:write<CR>
nnoremap <leader>w :write<CR>

" ctrl s to write
noremap <silent> <C-s> :write<CR>
vnoremap <silent> <C-s> <esc>:write<CR>
inoremap <silent> <C-s> <esc>:write<CR>


"map escape key
inoremap ;; <esc>
inoremap kk <esc>
inoremap jj <esc>
inoremap ii <esc>
cnoremap ;; <esc>
cnoremap kk <esc>
cnoremap jj <esc>
cnoremap ii <esc>
" don't map kk and jj in visual mode because need direction keys in this mode
vnoremap ;; <esc>

nnoremap mm :/mod<cr> 
"Ag search
nnoremap <leader>f :Ag! --ignore '*.sql' <C-R><C-W> app/<cr>
nnoremap <leader>F :Ag! --ignore '*.sql' <C-R><C-W><cr>
" case insensitive searching
nnoremap <leader>fi :Ag! -i --ignore '*.sql' <C-R><C-W> app/<cr>
nnoremap <leader>Fi :Ag! -i --ignore '*.sql' <C-R><C-W><cr>


" PLUGINS STUFF
" ------------------------------------------
"nerdtree
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
let g:NERDTreeDirArrows = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'max:30'
let g:ctrlp_extensions = ['tag', 'buffertag']


"execute pathogen#infect()

"cntrl P buffer explorer
nmap <C-b> :CtrlPBuffer<CR>


"ctrl P delete buffer under cursor with control @
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
"    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
   let line = getline('.')
   let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
       \ : fnamemodify(line[2:], ':p')
   exec "bd" bufid
   exec "norm \<F5>"
endfunc

"gitgutter, alway show gutter
let g:gitgutter_sign_column_always = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1

nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

" GENERAL STUFF
" -------------------------------------------
"
"enables ruby formatting
" do gg , =, G to autoformat whole file
" if has("autocmd")
" filetype indent on
" endif

set backspace=indent,eol,start " backspace over everything in insert mode
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set background=dark
colorscheme ir_black

" makes new windows (e.g. vnew|new) appear on right
set splitright

set nowrapscan
set number
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2 " # of space when press > in visual mode, should be same as ts

set nohlsearch "disable search highlight
set incsearch
set laststatus=2 " option 2, always display status line (displays filename)
syntax on         " turn of syntax highlighting
set smartindent
filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on


map <Leader>j :%!python -m json.tool<CR>
autocmd BufNewFile,BufRead *.json set ft=javascript

"Scripts
"---------------------------------------------
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
 echo a:cmdline
 let expanded_cmdline = a:cmdline
 for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
       let expanded_part = fnameescape(expand(part))
       let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
 endfor
 botright new
 setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
 call setline(1, 'You entered:    ' . a:cmdline)
 call setline(2, 'Expanded Form:  ' .expanded_cmdline)
 call setline(3,substitute(getline(2),'.','=','g'))
 execute '$read !'. expanded_cmdline
 setlocal nomodifiable  1
endfunction

nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
   if g:quickfix_is_open
       cclose
       let g:quickfix_is_open = 0
       execute g:quickfix_return_to_window . "wincmd w"
   else
       let g:quickfix_return_to_window = winnr()
       copen
       let g:quickfix_is_open = 1
   endif
endfunction
