"bundles

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'

"themes
Bundle 'jpo/vim-railscasts-theme'
Bundle 'vim-scripts/xoria256.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'FuzzyFinder'

"lang
Bundle 'tpope/vim-rails'
Bundle "jQuery"
Bundle "ragtag.vim"
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rake'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'tpope/vim-cucumber.git'
Bundle 'puppetlabs/puppet-syntax-vim'

"files
Bundle 'tpope/vim-fugitive'
"Bundle 'http://git.wincent.com/command-t.git'
Bundle 'wincent/Command-T.git'
Bundle 'scrooloose/nerdtree'


"code
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
"Bundle 'Raimondi/delimitMate'
"Bundle 'xolox/vim-easytags'
"Bundle 'scrooloose/syntastic'
"Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/taglist.vim'

"other
Bundle 'ervandew/supertab'
Bundle 'ack.vim'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'SearchComplete'
Bundle "repeat.vim"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'IndexedSearch'
Bundle 'nixternal/taskwarrior-vim.git'
Bundle 'vim-scripts/file-line'


let &t_Co=16
set t_Co=16 "enable 256 colors
let g:solarized_termcolors=16

"let &t_Co=16
"set t_Co=16 "enable 256 colors
"let g:solarized_termcolors=16
" Basic stuff

set nocompatible
syntax on
set autoindent
set smartindent
set ic
set scs
set et
set sw=2
set ts=2
set laststatus=2
set smartcase
set incsearch
set hlsearch
set scrolloff=5
set wildmode=full
set ruler
set showmode
set foldmethod=syntax
set foldlevelstart=99
set autoread
set cf


filetype on
filetype indent on
filetype plugin on

if has("autocmd")
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " Enable filetype detection
  filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" githubs

au BufNewFile,BufRead COMMIT_EDITMSG setlocal textwidth=75 fileencoding=utf-8 encoding=utf-8 filetype=gitcommit spell
set fileencodings=utf-8,iso-8859-2

" trailing whitespace
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" very magic searches

map / /\v
map ? ?\v

" backups

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Scrolling viewport

nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
nmap <M-f> <C-f>
nmap <M-d> <C-b>

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>


let mapleader=","
"colorscheme railscasts
"colorscheme xoria256
syntax enable
set background=dark
colorscheme solarized


" custom maps

map <Leader>T :NERDTreeToggle<CR>
map <Leader>t :NERDTreeToggle<CR>
map <Leader>tt :TlistShowTag<CR>
map <Leader>p :set invpaste paste?<CR>
noremap <Leader>hls :set hlsearch! hlsearch?<CR>
cmap w!! %!sudo tee > /dev/null %
imap ;; :call InsertLineNumber()<CR>
:match ExtraWhitespace /\s\+$/



" functions

function! InsertLineNumber()
  let linenumber = line(".")
  execute "normal a \<BS>".linenumber
endfunction

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" SuperTab
" ---------------
" Set these up for cross-buffer completion (something Neocachecompl has a hard
" time with)
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" ---------------
" Neocachecompl
" ---------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1 "Select the first entry automatically
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=300
let g:neocomplcache_auto_completion_start_length=1

" Tab / Shift-Tab to cycle completions
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" ---------------
" Lusty Juggler
" ---------------
if has('unix')
" Allows for previous buffer on unix systems without most recent patch level
" that enable LustyJuggler to work
  nnoremap <leader>, :e#<CR>
else
  nnoremap <leader>, :LustyJugglePrevious<CR>
end
let g:LustyJugglerShowKeys=1 " Show numbers for Lusty Buffers
let g:LustyJugglerSuppressRubyWarning=1

" ---------------
" Syntastic
" ---------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Platform-specific config files
if has('win32') || has('win64')
  let g:syntastic_jsl_conf=$HOME.'/.vim/config/windows/syntastic/jsl.conf'
  let g:syntastic_disabled_filetypes=['sh'] " Disable .sh on Windows
endif

" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_enable_on_vim_startup=1

" ---------------
" Session
" ---------------
let g:session_autosave=0
let g:session_autoload=0
nnoremap <leader>os :OpenSession<CR>

" ---------------
" SpeedDating
" ---------------
let g:speeddating_no_mappings=1 " Remove default mappings (C-a etc.)
nmap <silent><leader>dm <Plug>SpeedDatingDown
nmap <silent><leader>dp <Plug>SpeedDatingUp
nmap <silent><leader>dn <Plug>SpeedDatingNowUTC

" ---------------
" Tabular
" ---------------
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>

" ---------------
" Fugitive
" ---------------
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>

" ---------------
" Zoomwin
" ---------------
" Zoom Window to Full Size
nmap <silent> <leader>wo :ZoomWin<CR>

" ---------------
" Command T and ctrlp.vim
" ---------------
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''
if has('ruby')
" We've got Ruby, use Command T

" Conditional Mappings
  if has("gui_macvim")
    nnoremap <silent><D-t> :CommandT<CR>
  else
    nnoremap <silent><M-t> :CommandT<CR>
  endif

" Leader Commands
  nnoremap <leader>t :CommandT<CR>
  nnoremap <leader>u :CommandT %%<CR>
else
" Fallback on ctrlp.vim if Ruby for Command T not available

" Conditional Mappings
  if has("gui_macvim")
    let g:ctrlp_map = '<D-t>'
  else
    let g:ctrlp_map = '<M-t>'
  endif

" Leader Commands
  nnoremap <leader>t :CtrlPRoot<CR>
endif

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:CommandTMaxHeight = 10

" Mapping from ctrlp we always use
if has('gui_macvim')
  nnoremap <silent><D-u> :CtrlPCurFile<CR>
  nnoremap <silent><D-y> :CtrlPMRUFiles<CR>
else
  nnoremap <silent><M-u> :CtrlPCurFile<CR>
  nnoremap <silent><M-y> :CtrlPMRUFiles<CR>
end

" Also map leader commands
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>y :CtrlPMRUFiles<CR>

" ---------------
" Powerline
" ---------------
" Keep ^B from showing on Windows in Powerline
if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
elseif has('gui_macvim')
  let g:Powerline_symbols = 'fancy'
endif

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" OpenURL
" ---------------

if has('ruby')
ruby << EOF
  require 'open-uri'
  require 'openssl'

  def extract_url(url)
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]\{\};:'".,<>?«»“”‘’]))}

    url.match(re).to_s
  end

  def open_url
    line = VIM::Buffer.current.line

    if url = extract_url(line)
      if RUBY_PLATFORM.downcase =~ /(win|mingw)(32|64)/
        `start cmd /c chrome #{url}`
        VIM::message("Opened #{url}")
      else
        `open #{url}`
        VIM::message("Opened #{url}")
      end
    else
      VIM::message("No URL found on this line.")
    end

  end

  # Returns the contents of the <title> tag of a given page
  def fetch_title(url)
    if RUBY_VERSION < '1.9'
      open(url).read.match(/<title>(.*?)<\/title>?/i)[1]
    else
      open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read.match(/<title>(.*?)<\/title>?/i)[1]
    end
  end

  # Paste the title and url for the url on the clipboard in markdown format: [Title](url)
  # Note: Clobbers p register
  def paste_url_and_title
    clipboard = VIM::evaluate('@+')
    url = extract_url(clipboard)
    if url and url.strip != ""
      puts "Fetching title"
      title = fetch_title(url)
      VIM::command "let @p = '[#{title}](#{url})'"
      VIM::command 'normal! "pp'
    else
      VIM::message("Clipboard does not contain URL: '#{clipboard[1..10]}'...")
    end
  end
EOF

" Open a URL
if !exists("*OpenURL")
  function! OpenURL()
    :ruby open_url
  endfunction
endif

command! OpenUrl call OpenURL()
nnoremap <leader>o :call OpenURL()<CR>

" ---------------
" Paste link with Title
" ---------------

" Open a URL
if !exists("*PasteURLTitle")
  function! PasteURLTitle()
    :ruby paste_url_and_title
  endfunction
endif

command! PasteURLTitle call PasteURLTitle()
map <leader>pt :PasteURLTitle<CR>

endif " endif has('ruby')

" ---------------
" Fix Trailing White Space
" ---------------
map <leader>ws :%s/\s\+$//e<CR>
command! FixTrailingWhiteSpace :%s/\s\+$//e

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
" Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <leader>z :QuickSpellingFix<CR>
set completeopt=longest,menuone
:nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
au BufRead,BufNewFile *.pp              set filetype=puppet
let g:ctags_statusline=2
let Tlist_Process_File_Always=1

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>
