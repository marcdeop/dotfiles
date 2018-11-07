""""""""""""""
"  vim-plug  "
""""""""""""""
function! BuildCquery(info)
  !git submodule update --init
  !mkdir -p build
  !cd build
  !cmake .. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
endfunction

function! BuildCommandT(info)
  !cd ruby/command-t/ext/command-t && ruby extconf.rb && make
endfunction

function! BuildMarkdownComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

function! BuildJavascriptLanguageServer(info)
  !npm install && npm run build
  !git checkout package-lock.json
endfunction

function! BuildNcm2Tern(info)
  !npm install
endfunction

function! BuildPhpLanguageServer(info)
  !composer install && composer run-script parse-stubs
endfunction

function! BuildPuppetLanguageServer(info)
  !bundle install
endfunction

function! BuildYCM(info)
  !./install.py --all
endfunction

call plug#begin('~/.vim/plugged')
Plug 'aklt/plantuml-syntax'                                                                           " Syntax file for plantuml.
Plug 'andymass/vim-matchup'                                                                           " Extended matching with '%'.
Plug 'airblade/vim-gitgutter'                                                                         " Shows a git diff in the sign column. Stage and undo individual hunks.
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }                  " Language server protocol client.
Plug 'Badacadabra/vim-archery'                                                                        " Vim colorscheme inspired by Arch Linux colors.
Plug 'benmills/vimux'                                                                                 " Easily interact with tmux from vim.
Plug 'brooth/far.vim'                                                                                 " Find and replace for vim.
Plug 'christoomey/vim-tmux-navigator'                                                                 " Navigate seamlessly between vim and tmux splits.
Plug 'cquery-project/cquery',{ 'do': function('BuildCquery') }                                        " C/C++ language server.
Plug 'cyansprite/Extract'                                                                             " Extract; Draw forth what really matters.
Plug 'dracula/vim'                                                                                    " Dracula colorscheme for vim.
Plug 'easymotion/vim-easymotion'                                                                      " Vim motion on speed!.
Plug 'editorconfig/editorconfig-vim'                                                                  " Follow .editorconfig settings in projects.
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildMarkdownComposer') }                      " Adds asynchronous Markdown preview.
Plug 'godlygeek/tabular'                                                                              " Align text easily.
Plug 'joshdick/onedark.vim'                                                                           " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'lingua-pupuli/puppet-editor-services', { 'do': function('BuildPuppetLanguageServer') }          " Puppet Language support for the Language Server Protocol.
Plug 'jsfaint/gen_tags.vim'                                                                           " Async plugin to ease the use of ctags/gtags.
Plug 'junegunn/fzf.vim'                                                                               " fuzzy finder for vim.
Plug 'junegunn/goyo.vim'                                                                              " Distraction-free writing in Vim.
Plug 'junegunn/gv.vim'                                                                                " Git commit browser.
Plug 'lifepillar/vim-solarized8'                                                                      " Solarized true color colorscheme for vim.
Plug 'majutsushi/tagbar'                                                                              " Class outline viewer for vim.
Plug 'marcdeop/php-language-server', { 'do': function('BuildPhpLanguageServer'), 'branch': 'rename' } " Language server protocol for php.
Plug 'MicahElliott/Rocannon',                                                                         " Vim for Ansible playbooks.
Plug 'mileszs/ack.vim'                                                                                " Run your favorite search tool from vim.
Plug 'morhetz/gruvbox'                                                                                " Gruvbox colorscheme for vim.
Plug 'mzlogin/vim-markdown-toc'                                                                       " Generate table of contents for Markdown files.
Plug 'nathanaelkane/vim-indent-guides'                                                                " Visually diosplaying indent levels for vim.
Plug 'ncm2/ncm2'                                                                                      " Slim, fast hackable completion framework, for neovim.
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-tern', { 'do': function('BuildNcm2Tern') }
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-ultisnips'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'rakr/vim-one'                                                                                   " Adaptation of one-light and one-dark colorschemes for Vim.
Plug 'rodjek/vim-puppet'                                                                              " Make vim more puppet friendly!.
Plug 'roxma/nvim-yarp'                                                                                " Required by ncm2.
Plug 'roxma/nvim-completion-manager'                                                                  " Async completion framework.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  \ | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/echodoc.vim'                                                                             " Show function signature and inline doc.
Plug 'Shougo/neco-vim'                                                                                " Autocompletion for vimscript.
Plug 'Shougo/neco-syntax'                                                                             " Syntax autocompletion.
Plug 'sickill/vim-pasta'                                                                              " context-aware pasting.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'                                                   " Snippets for vim.
Plug 'sjl/gundo.vim'                                                                                  " Visualize your vim undo tree.
Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install && npm run build' }         " Language server protocol for javascript.
Plug 'tpope/vim-fugitive'                                                                             " Git wrapper for vim.
Plug 'tpope/vim-repeat'                                                                               " Enable repeating supported plugin maps with `.`
Plug 'tpope/vim-surround'                                                                             " Quoting/parenthesizing made simple.
Plug 'tyru/open-browser.vim'                                                                          " Open URI with your favorite browser from your most favorite editor.
Plug 'vim-airline/vim-airline'                                                                        " Lean & mean status/tabline for vim.
Plug 'vim-airline/vim-airline-themes'                                                                 " Themes for vim-airline.
Plug 'vim-pandoc/vim-pandoc'                                                                          " Facilities to integrate Vim with the pandoc document converter.
Plug 'vim-pandoc/vim-pandoc-syntax'                                                                   " Standalone pandoc syntax module.
Plug 'vim-utils/vim-man'                                                                              " View man pages in vim. Grep for the man pages.
Plug 'weirongxu/plantuml-previewer.vim'                                                               " Preview PlantUML.
Plug 'w0rp/ale'                                                                                       " Asynchronous lint engine.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   GENERAL                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','
set undodir=$HOME/.vim/undo//
set directory=$HOME/.vim/swapfiles//
set tags=./tags;
set undofile                      " Keep file with undo history
set laststatus=2                  " Always show status line
set noshowmode                    " Do not show the mode we are working in (vim-airline)
set noshowcmd                     " Show extra info while in visual mode (characters selected)
set scrolloff=3                   " Always try to show three lines above and below cursor
set backspace=indent,eol,start    " Del indentation,line breaks,pre-existing chars
set nocompatible                  " No vi compatibility required
set encoding=utf-8                " Set default encoding
set ignorecase                    " Ignore case
set smartcase                     " Override ignorecase in the search pattern contains upper case characters
set incsearch                     " Show where the pattern matches while typing a search command
set showmatch                     " When a bracket is inserted, briefly jump to the matching one.
set hlsearch                      " Highlight search pattern.
set gdefault                      " Substitute everything by default, not only the first entry
set hidden                        " Required for operations modifying multiple buffers like rename.
set ttyfast                       " Faster redrawing
set diffopt+=vertical             " Open diff in vertical split
set rtp^=/usr/share/vim/vimfiles/ " Make sure we read vimfiles ( in case we use nvim)

" handling proper lenght of lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" splits open on the right or bottom (vertical/horizontal)
set splitright
set splitbelow
set showbreak=↪

" General custom shortcuts
nnoremap <leader>z :wincmd _<cr>               " Zoom a vim pane
nnoremap <leader>= :wincmd =<cr>               " Rebalance panes
vnoremap <C-c> "+y                             " <C-c> copy selection to clipboard
vnoremap <C-x> "+d                             " <C-x> cut selection to clipboard
nnoremap <leader><space> :noh<cr>              "clear highlighted text  matched on a search
map <leader>v            :set paste!<cr>       " toggle paste mode
nnoremap <Leader>n       :NERDTreeToggle<cr>
nnoremap <Leader>-       :vertical resize -10<cr>
nnoremap <Leader>+       :vertical resize +10<cr>
nnoremap <Leader>h-      :resize -10<cr>
nnoremap <Leader>h+      :resize +10<cr>
" terminal mode window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Completely disable the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" consider wraped lines as lines when moving with jk
nnoremap j gj
nnoremap k gk

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Specific filetype options
au BufRead,BufNewFile *.pp set filetype=puppet
au FileType puppet setlocal isk+=:
au FileType puppet nnoremap <c-]> :exe "tag " . substitute(expand("<cword>"), "^::", "", "")<CR>
au FileType puppet nnoremap <c-w><c-]> :tab split<CR>:exe "tag " . substitute(expand("<cword>"), "^::", "", "")<CR>
au FileType cpp set tags+=~/.vim/tags/qt5

" Comment/Uncomment selected lines on ,c/,u in visual mode
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType bash,sh,make,pp let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '

noremap <silent> ,c
  \ :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u
  \ :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  FUNCTIONS                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RubyHashesAll()
  :%s/:\([^ ]*\)\(\s*\)=>/\1:/ge
endfunction

function! RubyHashesSelected()
  :'<,'>s/:\([^ ]*\)\(\s*\)=>/\1:/ge
endfunction

nmap <Leader>rhh :call RubyHashesAll()<CR>
vmap <Leader>rhh :call RubyHashesSelected()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 APPEARANCE                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
set termguicolors
colorscheme gruvbox

" specific to one theme
let g:solarized_visibility="high" "make trailing chars extra visible

" specific to gruvbox theme
let g:gruvbox_invert_signs = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_contrast_light = "medium"
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

set listchars=tab:·-,trail:· " mark 'misplaced' tab characters
set list


set rnu " Enable reversenumbers
set nu  " Enable line numbering

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 INDENTATION                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=0 " setting it to zero we make it  be the same as tabstop
set cindent
set smartindent
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 COMPLETION                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
set omnifunc=syntaxcomplete#Complete
"set completeopt=longest,menuone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   PLUGINS                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""
"  Ack  "
"""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""
"  Ale  "
"""""""""
let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = '∆∆'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

"""""""""""""
"  Airline  "
"""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1           " enable/disable tagbar integration >
let g:airline#extensions#tabline#enabled = 1          " Enable the list of buffers
let g:airline#extensions#tabline#buffer_min_count = 0 " configure the minimum number of buffers needed to show the tabline.
let g:airline#extensions#branch#enabled = 1           " enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#empty_message = ''    " change the text for when no branch is detected
let g:airline#extensions#branch#use_vcscommand = 0    " do not use vcscommand.vim if available
let g:airline_theme='one'                             " airline theme

""""""""""""""""
"  EasyMotion  "
""""""""""""""""
let g:EasyMotion_smartcase = 1                " Turn on case insensitive feature
let g:EasyMotion_startofline = 0              " keep cursor colum when JK motion
nmap <silent> s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

""""""""""""""""""
"  EditorConfig  "
""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"""""""""""""
"  Extract  "
"""""""""""""
let g:extract_useDefaultMappings = 0
let g:extract_maxCount = 25
let g:extract_loadDeoplete = 1
" mappings for insert
imap <m-v> <Plug>(extract-completeReg)
imap <c-v> <Plug>(extract-completeList)

""""""""""""""
"  Fugitive  "
""""""""""""""
nmap <silent><leader>gs :Gstatus<cr>
nmap <silent><leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

"""""""""
"  FZF  "
"""""""""
nmap <silent><leader>t :Files<cr>
nmap <silent><leader>a :Ag<cr>

""""""""""""""""""""
"  LanguageClient  "
""""""""""""""""""""
" used on CTRL-X CTRL-U on insert mode
set completefunc=LanguageClient#complete
" on formatting
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
let g:LanguageClient_autoStart = 1 " Automatically start language servers.
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings 
let g:LanguageClient_settingsPath = expand('~/.vim/cquery_settings.json')
let g:LanguageClient_serverCommands = {
    \ 'c': ['~/.vim/plugged/cquery/build/release/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'cpp': ['~/.vim/plugged/cquery/build/release/bin/cquery', '--log-file=/tmp/cq.log'],
    \ 'javascript': ['node', '~/.vim/plugged/javascript-typescript-langserver/lib/language-server-stdio'],
    \ 'php': ['php', '~/.vim/plugged/php-language-server/bin/php-language-server.php'],
    \ 'puppet': ['bundle', 'exec', 'ruby', '~/.vim/plugged/puppet-editor-services/puppet-languageserver', '--stdio', '--debug=/home/marc.deop/puppet-lsp.log', '--timeout=10', '-c'],
    \ 'ruby': ['docker', 'run', 'mtsmfm/language_server-ruby'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

"""""""""""""""""""""""
"  Markdown Composer  "
"""""""""""""""""""""""
let g:markdown_composer_autostart = 0

""""""""""""""
"  NERDTree  "
""""""""""""""
let NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden = 1

""""""""""""
"  Tagbar  "
""""""""""""
let g:tagbar_type_puppet = {
  \ 'ctagstype': 'puppet',
  \ 'kinds': [
    \'c:class',
    \'s:site',
    \'n:node',  
    \'d:definition',
    \'r:resource',
    \'f:default'
  \]
\}

""""""""""
"  Tmux  "
""""""""""
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
"let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsEditSplit='vertical'           " Open snips vertically
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips' " Store snips in this folder

"""""""""""
"  Vimux  "
"""""""""""
map <Leader>rb :call VimuxRunCommand('clear; rspec ' . bufname("%"))<CR> " Run the current file with rspec
map <Leader>vp :VimuxPromptCommand<CR>                                   " Prompt for a command to run
map <Leader>vl :VimuxRunLastCommand<CR>                                  " Run last command executed by VimuxRunCommand
map <Leader>vi :VimuxInspectRunner<CR>                                   " Inspect runner pane
map <Leader>vq :VimuxCloseRunner<CR>                                     " Close vim tmux runner opened by VimuxRunCommand
map <Leader>vx :VimuxInterruptRunner<CR>                                 " Interrupt any command running in the runner pane
map <Leader>vz :call VimuxZoomRunner()<CR>                               " Zoom the runner pane (use <bind-key> z to restore runner pane)

" enable ncm2 for all buffer
autocmd BufEnter * call ncm2#enable_for_buffer()

" note that must keep noinsert in completeopt, the others is optional
set completeopt=noinsert,menuone,noselect
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
inoremap <Nul> <C-x><C-o> 
" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"au User Ncm2Plugin call ncm2#register_source({
"        \ 'name' : 'css',
"        \ 'priority': 9, 
"        \ 'subscope_enable': 1,
"        \ 'scope': ['css','scss'],
"        \ 'mark': 'css',
"        \ 'word_pattern': '[\w\-]+',
"        \ 'complete_pattern': ':\s*',
"        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"        \ })
