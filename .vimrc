""""""""""""""
function! BuildBashLanguageServer(info)
  !PATH="/usr/lib/node_modules/yarn/bin/:$PATH" yarn install
  !PATH="/usr/lib/node_modules/yarn/bin/:$PATH" yarn run compile
endfunction

function! BuildCquery(info)
  !git submodule update --init
  !mkdir -p build
  !cd build
  !cmake .. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
endfunction

function! BuildCommandT(info)
  !cd ruby/command-t/ext/command-t && ruby extconf.rb && make
endfunction

function! BuildJavascriptLanguageServer(info)
  !npm install && npm run build && git checkout -- package-lock.json
endfunction


call plug#begin('~/.vim/plugged')
Plug 'aklt/plantuml-syntax'                                                                           " Syntax file for plantuml.
Plug 'andymass/vim-matchup'                                                                           " Extended matching with '%'.
Plug 'anuvyklack/fold-preview.nvim'
    \ | Plug 'anuvyklack/keymap-amend.nvim'                                                           " Preview close folds, without opening them.
Plug 'Badacadabra/vim-archery'                                                                        " Vim colorscheme inspired by Arch Linux colors.
Plug 'benmills/vimux'                                                                                 " Easily interact with tmux from vim.
Plug 'brooth/far.vim'                                                                                 " Find and replace for vim.
Plug 'chriskempson/base16-vim'                                                                        " Base16 for Vim.
Plug 'christoomey/vim-tmux-navigator'                                                                 " Navigate seamlessly between vim and tmux splits.
Plug 'cquery-project/cquery',{ 'do': function('BuildCquery') }                                        " C/C++ language server.
Plug 'cyansprite/Extract'                                                                             " Extract; Draw forth what really matters.
Plug 'dracula/vim'                                                                                    " Dracula colorscheme for vim.
Plug 'easymotion/vim-easymotion'                                                                      " Vim motion on speed!.
Plug 'editorconfig/editorconfig-vim'                                                                  " Follow .editorconfig settings in projects.
Plug 'ellisonleao/glow.nvim'                                                                          " Preview markdown code directly in your neovim terminal
Plug 'fenetikm/falcon'                                                                                " A colour scheme for terminals, Vim and friends.
Plug 'godlygeek/tabular'                                                                              " Align text easily.
Plug 'github/copilot.vim'                                                                             " OpenAI Codex to suggest code and entire functions in real-time right
Plug 'hashivim/vim-terraform'                                                                         " Terraform filetype and highlight
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'junegunn/fzf.vim'                                                                               " fuzzy finder for vim.
Plug 'junegunn/gv.vim'                                                                                " Git commit browser.
Plug 'kyazdani42/nvim-web-devicons'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}
Plug 'lewis6991/gitsigns.nvim'                                                                        " Super fast git decorations implemented purely in Lua.
Plug 'lewis6991/hover.nvim'                                                                           " General framework for context aware hover providers (similar to vim.lsp.buf.hover).
Plug 'lifepillar/vim-solarized8'                                                                      " Solarized true color colorscheme for vim.
Plug 'lukas-reineke/indent-blankline.nvim'                                                            " Add indentation guides to Neovim
Plug 'mads-hartmann/bash-language-server', { 'do': function('BuildBashLanguageServer') }              " A language server for Bash.
Plug 'majutsushi/tagbar'                                                                              " Vim plugin that displays tags in a window, ordered by scope
Plug 'mfussenegger/nvim-lint',                                                                        " An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
Plug 'MicahElliott/Rocannon',                                                                         " Vim for Ansible playbooks.
Plug 'mileszs/ack.vim'                                                                                " Run your favorite search tool from vim.
Plug 'morhetz/gruvbox'                                                                                " Gruvbox colorscheme for vim.
Plug 'nanozuki/tabby.nvim'                                                                            " A highly configurable, and neovim style tabline plugin. Use your nvim tabs as a workspace multiplexer!
Plug 'MunifTanjim/nui.nvim'                                                                           " UI Component Library for Neovim.
Plug 'navarasu/onedark.nvim'                                                                          " Dark and Light Themes for neovim >= 0.5 based on Atom One Dark & Atom One Light
Plug 'neovim/nvim-lspconfig'                                                                          " Configs for the Nvim LSP client (:help lsp).
Plug 'nvim-lua/plenary.nvim'                                                                          " All the lua functions I don't want to write twice.
Plug 'nvim-lualine/lualine.nvim'                                                                      " A blazing fast and easy to configure Neovim statusline written in Lua.
Plug 'nvim-neo-tree/neo-tree.nvim'                                                                    " Browse the file system and other tree like structures in whatever style suits you
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }                                           " Highly extendable fuzzy finder over lists.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                                           " Simple and easy way to use the interface for tree-sitter
Plug 'npmiller/vreeze'                                                                                " Breeze inspired vim colorscheme
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'peterhoeg/vim-qml'                                                                              " QML syntax file for VIM
Plug 'pwntester/octo.nvim'                                                                            " Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'rakr/vim-one'                                                                                   " Adaptation of one-light and one-dark colorschemes for Vim.
Plug 'ray-x/lsp_signature.nvim'                                                                       " Show function signature when you type.
Plug 'rmagatti/goto-preview'                                                                          " Preview native LSP's goto definition, type definition, implementation, and references calls in floating windows.
Plug 'sainnhe/gruvbox-material'                                                                       " Gruvbox fork.
Plug 'shumphrey/fugitive-gitlab.vim'                                                                  " Allows use of vim-fugitive with gitlab repositories
Plug 'Shougo/echodoc.vim'                                                                             " Show function signature and inline doc.
Plug 'Shougo/neco-vim'                                                                                " Autocompletion for vimscript.
Plug 'Shougo/neco-syntax'                                                                             " Syntax autocompletion.
Plug 'sickill/vim-pasta'                                                                              " context-aware pasting.
Plug 'SidOfc/mkdx',                                                                                   " Nice extras for working with markdown documents
Plug 'simrat39/symbols-outline.nvim'                                                                  " A tree like view for symbols via LSP
Plug 'sindrets/diffview.nvim'                                                                         " Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'                                                   " Snippets for vim.
Plug 'sjl/gundo.vim'                                                                                  " Visualize your vim undo tree.
Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install && npm run build' }         " Language server protocol for javascript.
Plug 'stephpy/vim-yaml'                                                                               " Override vim syntax for yaml files
Plug 'tpope/vim-fugitive'                                                                             " Git wrapper for vim.
Plug 'tpope/vim-repeat'                                                                               " Enable repeating supported plugin maps with `.`
Plug 'tpope/vim-surround'                                                                             " Quoting/parenthesizing made simple.
Plug 'tyru/open-browser.vim'                                                                          " Open URI with your favorite browser from your most favorite editor.
Plug 'vim-pandoc/vim-pandoc'                                                                          " Facilities to integrate Vim with the pandoc document converter.
Plug 'vim-pandoc/vim-pandoc-syntax'                                                                   " Standalone pandoc syntax module.
Plug 'vim-utils/vim-man'                                                                              " View man pages in vim. Grep for the man pages.
Plug 'weirongxu/plantuml-previewer.vim'                                                               " Preview PlantUML.
Plug 'williamboman/mason.nvim'                                                                        " Easily install and manage LSP servers, DAP servers, linters, and formatters.
Plug 'williamboman/mason-lspconfig.nvim'                                                              " Bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
Plug 'windwp/nvim-autopairs'                                                                          " A super powerful autopair plugin for Neovim that supports multiple characters.
Plug 'Yggdroot/indentLine'                                                                            " Display thin vertical lines at each indentation level for code indented with spaces.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   GENERAL                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=I                  " Do not show intro message
set shortmess+=c                  " Don't pass messages to |ins-completion-menu|
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
set cmdheight=1                   " Give more space for displaying messages
set updatetime=300                " Reduce to 300 because default is 4000!
set showtabline=1                 " Show tabline if there are at least two tabs

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
" Workaround for neovim wl-clipboard and netrw interaction hang
" (see: https://github.com/neovim/neovim/issues/6695 and
" https://github.com/neovim/neovim/issues/9806) 
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'pbcopy',
      \      '*': 'pbcopy',
      \    },
      \   'paste': {
      \      '+': 'pbpaste',
      \      '*': 'pbpaste',
      \   },
      \   'cache_enabled': 1,
      \ }

map <leader>v            :set paste!<cr> " toggle paste mode
nnoremap <Leader>n :Neotree toggle right<cr>
nnoremap <leader>b :Neotree toggle float buffers<cr>
nnoremap <leader>g :Neotree toggle float git_status<cr>

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
au BufRead,BufNewFile *.tf set filetype=terraform
au BufRead,BufNewFile *.yaml,*.yml set filetype=yaml
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
"                                 APPEARANCE                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
set termguicolors
let g:onedark_config = {
    \ 'style': 'dark',
\}
colorscheme onedark

" specific to one theme
let g:solarized_visibility="high" "make trailing chars extra visible

" specific to gruvbox theme
let g:gruvbox_invert_signs      = 1
let g:gruvbox_italic            = 1
let g:gruvbox_contrast_dark     = "hard"
let g:gruvbox_contrast_light    = "hard"
let g:gruvbox_improved_strings  = 1
let g:gruvbox_improved_warnings = 1

set listchars=tab:·-,trail:· " mark 'misplaced' tab characters
set list
set rnu                      " Enable reversenumbers
set nu                       " Enable line numbering

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

"""""""""""""
"  Airline  "
"""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme                              = 'onedark'
let g:airline_powerline_fonts                     = 1
let g:airline#extensions#tagbar#enabled           = 1     " enable/disable tagbar integration >
let g:airline#extensions#tabline#enabled          = 0     " Enable the list of buffers
let g:airline#extensions#tabline#buffer_min_count = 0     " configure the minimum number of buffers needed to show the tabline.
let g:airline#extensions#branch#enabled           = 1     " enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#empty_message     = ''    " change the text for when no branch is detected
let g:airline#extensions#branch#use_vcscommand    = 0     " do not use vcscommand.vim if available
let g:airline_exclude_filetypes                   = ['nerdtree']

"""""""""
"  cmp  "
"""""""""
" lua/user/cmd.lua

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

""""""""""""""""
"  indentLine  "
""""""""""""""""
let g:indentLine_setConceal = 0

""""""""""""""""""""""
"  Markdown Preview  "
""""""""""""""""""""""
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = 'falkon'
function OpenMarkdownPreview (url)
  execute 'silent ! open -a Google\ Chrome -n --args --new-window ' . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

""""""""""
"  MKDX  "
""""""""""
let g:mkdx#settings = {
      \ 'image_extension_pattern': 'a\?png\|jpe\?g\|gif',
      \ 'restore_visual':          1,
      \ 'enter':                   { 'enable': 1, 'malformed': 1, 'o': 1,
      \                              'shifto': 1, 'shift': 0 },
      \ 'map':                     { 'prefix': '<leader>', 'enable': 1 },
      \ 'tokens':                  { 'enter': ['-', '*', '>'],
      \                              'bold': '**', 'italic': '*', 'strike': '',
      \                              'list': '-', 'fence': '',
      \                              'header': '#' },
      \ 'checkbox':                { 'toggles': [' ', '-', 'x'],
      \                              'update_tree': 2,
      \                              'initial_state': ' ' },
      \ 'toc':                     { 'text': "Table of Contents",
      \                              'list_token': '*',
      \                              'update_on_write': 0,
      \                              'position': 2,
      \                              'details': {
      \                                 'enable': 0,
      \                                 'summary': 'Click to expand {{toc.text}}'
      \                              }
      \                            },
      \ 'table':                   { 'divider': '|',
      \                              'header_divider': '-',
      \                              'align': {
      \                                 'left':    [],
      \                                 'center':  [],
      \                                 'right':   [],
      \                                 'default': 'center'
      \                              }
      \                            },
      \ 'links':                   { 'external': {
      \                                 'enable': 1, 'timeout': 3, 'host': '', 'relative': 1,
      \                                 'user_agent':  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/9001.0.0000.000 vim-mkdx/1.8.1'
      \                              },
      \                              'fragment': {
      \                                 'jumplist': 1,
      \                                 'complete': 1
      \                              }
      \                            },
      \ 'highlight':               { 'enable': 1 },
      \ 'auto_update':             { 'enable': 1 }}

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

"""""""""""""""
"  Telescope  "
"""""""""""""""
" lua/user/telescope.lua

"""""""""""""""
"  lspconfig  "
"""""""""""""""
" lua/user/lspconfig.lua

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
"<tab> used by cmp these days :-)
"let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsEditSplit='vertical'           " Open snips vertically
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips' " Store snips in this folder

"""""""""""""""""""""""
"  vim-pandoc-syntax  "
"""""""""""""""""""""""
let g:pandoc#syntax#conceal#use = 0

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
