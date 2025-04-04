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
"
" Tags:  https://andrew.stwrt.ca/posts/vim-ctags/
" ctags -R .
"
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
"let g:plug_threads = 1

" When making changes, remember to source $VIMRC before PlugInstall/Update
call plug#begin('~/.vim/plugged')
  Plug 'github/copilot.vim'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'tpope/vim-eunuch'
  Plug 'gioele/vim-autoswap'
  Plug 'ervandew/supertab'
  " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }
  Plug 'Raimondi/delimitMate'
  Plug 'tell-k/vim-browsereload-mac'
  Plug 'Chiel92/vim-autoformat'
  " Plug 'vim-vdebug/vdebug'
  Plug 'sheerun/vim-polyglot'
  Plug 'wesgibbs/vim-irblack'
  Plug 'mileszs/ack.vim'
  Plug 'vim-scripts/bufkill.vim'
  Plug 'vim-scripts/matchit.zip'
  Plug 'bling/vim-airline'
  Plug 'rking/ag.vim'
  Plug 'vim-scripts/greplace.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tomtom/tcomment_vim'
  Plug 'majutsushi/tagbar'
  Plug 'airblade/vim-gitgutter'
  Plug 'tobyS/pdv' | Plug 'tobyS/vmustache'
  " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets', { 'frozen': 1 }
  " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  " Plug 'craigemery/vim-autotag'
  " Plug 'scrooloose/syntastic'
  Plug 'dense-analysis/ale'

  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-cucumber'
  Plug 'vim-ruby/vim-ruby'
  " Plug 'pangloss/vim-javascript'
  Plug 'neoclide/vim-jsx-improve'
  Plug 'mattn/emmet-vim'
  " Plug 'ngmy/vim-rubocop'

  " Plug 'romainl/vim-qf' "https://stackoverflow.com/questions/76020586/vim-quickfix-window-automatically-open-file-to-view-by-focusing-on-it-without-p/76021219?noredirect=1#comment134095172_76021219

  " plugins to consider 
  " Plug 'dhruvasagar/vim-dotoo'
  " https://mattn.github.io/emmet-vim/
  " https://github.com/JoshCheek/seeing_is_believing
  " easy tag: https://stackoverflow.com/questions/26914063/migrating-to-vim-from-rubymine-interpreted-auto-completion
  " http://aftnn.org/post/75730734352/vim-auto-closers-compared
  " http://blog.mikecordell.com/2015/01/27/better-fuzzy-search-with-ctrl-p-in-vim.html

  " Not using
  " Plug 'chrisbra/csv.vim'
  " Plug 'szw/vim-maximizer'
  " Plug 'syntastic/syntax_checkers/ruby/rubylint.vim'

  " PHP Plugins
  " Plug 'captbaritone/better-indent-support-for-php-with-html'
  " Plug 'vim-php/tagbar-phpctags.vim'
  " Plug 'stephpy/vim-php-cs-fixer'
  " Plug 'phpfmt/vim-phpfmt'
  " " Plug 'joonty/vim-phpqa'
  " " Plug '2072/PHP-Indenting-for-VIm'
call plug#end()

" seoul256 (dark):
" Range:   233 (darkest) ~ 239 (lightest)
" Default: 237

" let g:seoul256_background = 233
" colo seoul25
"
" Set the title of the iterm tab
set title

" https://stackoverflow.com/a/67929452/7765761
vmap <leader>gl :Gclog<CR>

" https://sidneyliebrand.medium.com/vim-tip-persistent-undo-2fc78a2973a7
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.vim/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

"abbreviations

" example usage to make abbreviation pre 'page1preowned@gmail.com'
" iabbr <silent> pre page1preowned@gmail.com<c-r>=Eatchar('\m\s\<bar>/')<cr>

" \Psy\Shell::debug(); does not work!
" iabbr <silent> de \Psy\Shell::debug();<c-r>=Eatchar('\m\s\<bar>/')<cr>
" iabbr <silent> de eval(\Psy\sh());<c-r>=Eatchar('\m\s\<bar>/')<cr>
" iabbr <silent> yt Yii::t('app', 'text')<c-r>=Eatchar('\m\s\<bar>/')<cr>
" iabbr <silent> ytp <?= Yii::t('app', 'text')<c-r>=Eatchar('\m\s\<bar>/')<cr>

" iabbr <silent> br \Psy\Shell::debug(get_defined_vars());<c-r>=Eatchar('\m\s\<bar>/')<cr>
iabbr <silent> br require IEx; IEx.pry<c-r>=Eatchar('\m\s\<bar>/')<cr>
" for Phalcon PHP framework
iabbr <silent> de $app->log->debug("" . print_r($var, true));<c-r>=Eatchar('\m\s\<bar>/')<cr>
" for testfit php portal server:
" $app->log->debug prints to .logs/bf_web.log
" error_log prints to the php built in server logs


" https://stackoverflow.com/questions/6980749/simpler-way-to-put-pdb-breakpoints-in-python-code
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>

let mapleader=","
filetype plugin indent on

set encoding=utf-8  " so NerdTree arrows display correctly
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


" https://stackoverflow.com/questions/7000960/in-vim-why-doesnt-my-mouse-work-past-the-220th-column
set ttymouse=sgr
endif

" for browserreload-mac plugin https://browsereload-macvim.readthedocs.org/en/latest/
" :ChromeReloadStart
" :ChromeReloadStop
let g:returnApp = 'iTerm' " refocus back to iTerm after reload
" let g:returnAppFlag = 0 " prevent refocus to terminal 

"delimit
set backspace=2
let delimitMate_expand_cr = 2

let PHP_removeCRwhenUnix = 1 " remove '\r' from newlines as per :help php-indent
" PHPQa
" let g:phpqa_codesniffer_cmd='$HOME/Development/zidisha_dev/zidisha2/vendor/bin/phpcs'
" let g:phpqa_messdetector_cmd='$HOME/Development/zidisha_dev/zidisha2/vendor/bin/phpmd'
" let g:phpqa_messdetector_autorun = 0
" let g:phpqa_codesniffer_autorun = 0
" let g:phpqa_open_loc = 1

let g:tcomment#filetype#guess_typescript = 1

"PHP-cs-fixer
let g:php_cs_fixer_path = '$HOME/bin/php-cs-fixer'
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_fixers_list = 'phpdoc_params,align_double_arrow,align_equals,no_blank_lines_before_namespace'
nnoremap <silent><leader>fi :call PhpCsFixerFixFile()<CR>


let g:phpfmt_on_save = 0
let g:phpfmt_update_on_open = 0 " don't update on open for now 04/28/16 because the newest .vim/plugged/vim-phpfmt/plugin/fmt.phar is broken
let g:phpfmt_psr2 = 1
let g:phpfmt_enable_default_mapping = 0
nnoremap <silent><leader>h :call PhpFmtFixFile()<CR>:call PhpCsFixerFixFile()<CR>

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

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }
" open definition in new window
" to make tags:  ctags -R .
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
autocmd FileType javascript nmap <buffer> <C-]> :YcmCompleter GoTo<CR>


" http://vim.wikia.com/wiki/Open_file_under_cursor
" map <C-W><C-F> :vertical wincmd f<CR> "opens in verticle split
nnoremap <C-W><C-F> <C-W>vgf

" need to go into this file and change ip address to match host machine(OS X),
" it changes often. Or else debugger won't work
" sudo vim /etc/php5/cli/conf.d/20-xdebug.ini
" sudo vim /etc/php5/fpm/conf.d/20-xdebug.ini
" zend_extension=xdebug.so
" xdebug.remote_enable = 1
" xdebug.remote_connect_back = 1
" xdebug.max_nesting_level = 512
" xdebug.remote_autostart = On
" xdebug.remote_host = 192.168.1.2
" xdebug.remote_port = 10000
"
" for remote only (e.g. running php on vm)
" let g:vdebug_options = {
" \ 'path_maps': {"/home/vagrant/zidisha2": "/Users/mark/Development/zidisha_dev/zidisha2",
" \               "/home/vagrant/projects": "/Users/mark/Development/homestead",
" \               "/var/www": "/Users/mark/Development/hadron-lamp/webroot",
" \               "/vagrant/src": "/Users/mark/Development/work/vagrant-lamp/webroot",
" \               "/var/www/public": "/Users/mark/Development/scotch-box/public" },
" \ 'port': 10000,
" \ 'break_on_open': 0
" \}

" let g:vdebug_options = {
" \ 'path_maps': {"/home/ubuntu/testfit/testfit-web": "/Users/markw/Development/testfit-io/testfit-web" },
" \ 'port': 9000,
" \ 'break_on_open': 0,
" \ "ide_key" : 'markw'
" \}



" PHP documentor
let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" https://www.reddit.com/r/vim/comments/2sx567/snipmate_and_youcompleteme_doesnt_work_well/
" (via http://stackoverflow.com/a/22253548/1626737)
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'


" https://stackoverflow.com/questions/38534285/vim-youcompleteme-plugin-opens-up-a-split-window-with-function-definition
" https://github.com/Valloric/YouCompleteMe#the-gycm_autoclose_preview_window_after_completion-option
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,juliaerl6ython,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

" Show type of variable under cursor
nmap <silent> <leader>gt :YcmCompleter GetType<CR>

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" nnoremap <tab> :call UltiSnips#ExpandSnippetOrJump()<CR> 
" nnoremap <D-tab> :call UltiSnips#JumpBackwards()<CR> 


nnoremap <leader>o :cd /Users/mark/Library/Mobile Documents/com~apple~CloudDocs/3notes<CR>  

" open current file in MacVim
nnoremap <leader>m :execute "! mvim +" . line(".") " -R %"<CR>  

" toggle paste mode
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
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
  "
" https://superuser.com/questions/649714/can-i-get-the-vim-ctrlp-plugin-to-ignore-a-specific-folder-in-one-project
" let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlpignore`"'

" https://github.com/kien/ctrlp.vim READ.ME
  " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

  " ignore stuff in .gitigore: https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6
  " let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

  " for Python
  " let g:ctrlp_user_command = [‘.git/’, ‘git ls-files -oc — exclude-standard | grep -Ev “(jpg|png|gif|__init__.py)$”’]

  " http://softwareas.com/a-simple-way-to-speed-up-vim-ctrl-p-plugin-delegate-to-ag/
  " https://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
  " let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  "       \ --ignore .git
  "       \ --ignore .svn
  "       \ --ignore .hg
  "       \ --ignore .DS_Store
  "       \ --ignore "**/*.pyc"
  "       \ -g ""'


  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
else
  " https://github.com/junegunn/vim-plug/issues/380
  let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ }
  \ }
endif

" let g:ctrlp_custom_ignore = 'bah\|DS_Store\|git'
" " https://github.com/kien/ctrlp.vim READ.ME
"
"Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ["elixir"]
let g:syntastic_elixir_elixir_args = '+elixirc'


" let g:syntastic_ruby_checkers = ["rubocop"]
" let g:syntastic_enable_ruby_checker = 0


let g:ale_enabled = 1
let g:ale_linters = {
\   'ruby': ['standardrb'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\    'ruby': ['standardrb'],
\}

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
" let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1

" https://github.com/testdouble/standard/wiki/IDE:-vim
let g:ruby_indent_assignment_style = 'variable'
" change cursor shape in different modes for OSX iTerm2
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
" statuline for Airline plugin
" let g:airline#extensions#default#layout = [ [ 'c', 'b', 'a' ], [ 'x', 'y', 'z', 'warning' ] ]
" let g:airline#extensions#default#layout = [ [ 'c', 'b'], [ 'x', 'z'] ]
" let g:airline_section_b = '%{getcwd()}'
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#branch#format = 1
" let g:airline#extensions#branch#displayed_head_limit = 1
let g:airline_section_t = '%{tagbar#currenttag("[%s] ","")}'
" let g:airline#extensions#default#layout = [ [ 'c', 'b'], ['z'] ]
" let g:airline#extensions#default#layout = [ [ 'c', 'b'], ['t', 'z'] ]
" let g:airline#extensions#default#layout = [ [ 'c', 'b'], ['z'] ]
let g:airline#extensions#default#layout = [ [ 'c', 'b'], ['z'] ]
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
" to save a session  :mksession $HOME/.vim/sessions/editor.vim
" nnoremap <leader>rh :source $HOME/.vim/sessions/homestead.vim<CR>
" nnoremap <leader>re :source $HOME/.vim/sessions/editor.vim<CR>
nnoremap <leader>r :source $HOME/.vim/sessions/editor.vim<CR>
" nnoremap <leader>rz :source $HOME/.vim/sessions/zidisha.vim<CR>

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
" inoremap ;; <esc>
" inoremap kk <esc>
" inoremap jj <esc>
inoremap jk <esc>
" inoremap ii <esc>
" cnoremap ;; <esc>
" cnoremap kk <esc>
" cnoremap jj <esc>
cnoremap jk <esc>
"cnoremap ii <esc>
" don't map kk and jj in visual mode because need direction keys in this mode
vnoremap ;; <esc>

nnoremap mm :/mod<cr> 
"Ag search
nnoremap <leader>f :Ag! --ignore '*.sql' <C-R><C-W> apps/<cr>
nnoremap <leader>F :Ag! --ignore '*.sql' <C-R><C-W><cr>
" case insensitive searching
" nnoremap <leader>fi :Ag! -i --ignore '*.sql' <C-R><C-W> apps/<cr>
" nnoremap <leader>Fi :Ag! -i --ignore '*.sql' <C-R><C-W><cr>

" https://www.reddit.com/r/vim/comments/5oqu9t/best_way_to_search_all_files_in_current_directory/
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" PLUGINS STUFF
" ------------------------------------------
"nerdtree
map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
let g:NERDTreeDirArrows = 1

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'w'
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
" nmap ]c <Plug>GitGutterNextHunk
" nmap [c <Plug>GitGutterPrevHunk

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

set termguicolors
colorscheme ir_black
set background=dark


" makes new windows (e.g. vnew|new) appear on right
set splitright

set nowrapscan
set number
set expandtab
set smarttab

set tabstop=2
set shiftwidth=2 " # of space when press > in visual mode, should be same as ts
"
" https://stackoverflow.com/questions/11666170/vim-persistent-set-syntax-for-a-given-filetype
autocmd BufNewFile,BufRead *.js.php set filetype=javascript
autocmd BufNewFile,BufRead *.vue set filetype=html

" https://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
" autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType swift setlocal shiftwidth=4 tabstop=4
autocmd FileType c setlocal shiftwidth=4 tabstop=4

set nohlsearch "disable search highlight
set incsearch
set laststatus=2 " option 2, always display status line (displays filename)
syntax on
set smartindent
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete " don't we need this since we have YouComplete me
" filetype plugin indent on

" format current json file
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

" http://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations
function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" https://stackoverflow.com/questions/9160570/append-or-prepend-selected-text-to-a-file-in-vim
com! -nargs=1 -range Sbak call MoveSelectedLinesToFile(<f-args>)
fun! MoveSelectedLinesToFile(filename)
    exec "silent! '<,'>w! >>" . a:filename
    " norm gvd
endfunc

map <leader>c :Sbak /Users/mark/Library/Mobile\ Documents/com~apple~CloudDocs/work/zidisha/session_notes.txt<cr>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"NOTES
" for PHP/HTML syntax: http://vim.wikia.com/wiki/Forcing_Syntax_Coloring_for_files_with_odd_extensions
" let php_minlines=500

" https://stackoverflow.com/questions/9092347/how-to-make-vim-use-the-same-environment-as-my-login-shell-when-running-commands
" set shell=bash\ --login  " don't do this, makes git-fugitive slow


let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:flow#autoclose = 1

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" https://stackoverflow.com/questions/237289/vim-configure-line-number-coloring
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
