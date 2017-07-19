""""""""""""""
"  vim-plug  "
""""""""""""""
function! BuildCommandT(info)
  !cd ruby/command-t/ext/command-t && ruby extconf.rb && make
endfunction

function! BuildYCM(info)
  !./install.py --all
endfunction

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'rodjek/vim-puppet'
Plug 'mileszs/ack.vim'
Plug 'benmills/vimux'
Plug 'junegunn/gv.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'airblade/vim-gitgutter'
Plug 'ternjs/tern_for_vim'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'wincent/command-t', { 'do': function('BuildCommandT') }
Plug 'moll/vim-node', { 'for': 'javascript' }
" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading ToDO: load nerdtree-git-plugin on nerdtree loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  \ | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'lifepillar/vim-solarized8'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   GENERAL                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile " keep file with undo history
set undodir=$HOME/.vim/undo//
set directory=$HOME/.vim/swapfiles//
set laststatus=2 " always show status line
set cursorline " mark line of the cursor
set noshowmode " do not show the mode we are working in (vim-airline)
set noshowcmd " show extra info while in visual mode (characters selected)
set scrolloff=3 " always try to show three lines above and below cursor
set backspace=indent,eol,start "del indentation,line breaks,pre-existing chars
let mapleader = ","
set nocompatible " no vi compatibility required
set encoding=utf-8
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault "substitute everything by default, not only the first entry
set tags=./tags;

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
" <C-c>/<C-x> to copy/cut selection to clipboard
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>- :vertical resize -10<cr>
nnoremap <Leader>+ :vertical resize +10<cr>
nnoremap <Leader>h- :resize -10<cr>
nnoremap <Leader>h+ :resize +10<cr>

"clear highlighted text  matched on a search
nnoremap <leader><space> :noh<cr>

" toggle paste mode
map <leader>v :set paste!<cr>

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

" faster redrawing
set ttyfast

set diffopt+=vertical

" Specific filetype options
au BufRead,BufNewFile *.pp set filetype=puppet
au FileType puppet setlocal isk+=:
au FileType puppet nnoremap <c-]> :exe "tag " . substitute(expand("<cword>"), "^::", "", "")<CR>
au FileType puppet nnoremap <c-w><c-]> :tab split<CR>:exe "tag " . substitute(expand("<cword>"), "^::", "", "")<CR>

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
set background=light
set termguicolors
colorscheme solarized8_light_high

" specific to one theme
let g:solarized_visibility="high" "make trailing chars extra visible

" specific to one theme
let g:one_allow_italics = 1

" specific to gruvbox theme
let g:gruvbox_invert_signs = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_contrast_light = "hard"
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" mark 'misplaced' tab characters
set listchars=tab:·-,trail:·
set list

" enable reversenumbers and line numbering
set rnu
set nu

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   PLUGINS                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""
"  Ack  "
"""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""
"  NERDTree  "
""""""""""""""
let NERDTreeWinSize=30
let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1

"""""""""""""""
"  Syntastic  "
"""""""""""""""
set statusline+=%{SyntasticStatuslineFlag()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

" allow external sources on shellcheck
let g:syntastic_sh_shellcheck_args = "-x"

"""""""""
"  ale  "
"""""""""
let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = '∆∆'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

""""""""""""""""
"  EasyMotion  "
""""""""""""""""

let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" Bi-directional find motion
nmap s <Plug>(easymotion-overwin-f2)

" JKLH motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

"""""""""""""""
"  UltiSnips  "
"""""""""""""""

" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""
"  CommandT  "
""""""""""""""
" make esc key work on xterm/screen terminals
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif


""""""""""""""""""""""
"  Airline/Fugitive  "
""""""""""""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
" enable/disable tagbar integration >
let g:airline#extensions#tagbar#enabled = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" configure the minimum number of buffers needed to show the tabline.
let g:airline#extensions#tabline#buffer_min_count = 0
" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1
" change the text for when no branch is detected
let g:airline#extensions#branch#empty_message = ''
" do not use vcscommand.vim if available
let g:airline#extensions#branch#use_vcscommand = 0
" airline theme
let g:airline_theme="solarized"

" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

""""""""""""
"  tagbar  "
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

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>


"""""""""""
"  Vimux  "
"""""""""""
" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

""""""""""
"  Tmux  "
""""""""""

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"""""""""""""""""""
"  YouCompleteMe  "
"""""""""""""""""""
" Remove <tab> and <s-tab> keybindings to allow tab with UltiSnips
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
