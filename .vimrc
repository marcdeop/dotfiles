""""""""""""""
"  vim-plug  "
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
  !npm install && npm run build && git checkout -- package-lock.json
endfunction

function! BuildPhpLanguageServer(info)
  !composer install && composer run-script parse-stubs
endfunction

function! BuildPuppetLanguageServer(info)
  !bundle install
  !bundle exec rake gem_revendor
endfunction

function! BuildXMLLanguageServer(info)
  !./mvnw clean verify
endfunction

function! BuildYCM(info)
  !./install.py --all
endfunction

call plug#begin('~/.vim/plugged')
Plug 'aklt/plantuml-syntax'                                                                           " Syntax file for plantuml.
Plug 'andymass/vim-matchup'                                                                           " Extended matching with '%'.
Plug 'angelozerr/lsp4xml', { 'do': function('BuildXMLLanguageServer') }                               " XML Language Server.
Plug 'airblade/vim-gitgutter'                                                                         " Shows a git diff in the sign column. Stage and undo individual hunks.
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
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildMarkdownComposer') }                      " Adds asynchronous Markdown preview.
Plug 'fenetikm/falcon'                                                                                " A colour scheme for terminals, Vim and friends.
Plug 'godlygeek/tabular'                                                                              " Align text easily.
Plug 'hashivim/vim-terraform'                                                                         " Terraform filetype and highlight
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}                              " Markdown preview plugin for neovim.
Plug 'joshdick/onedark.vim'                                                                           " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'puppetlabs/puppet-editor-services', { 'do': function('BuildPuppetLanguageServer') }             " Puppet Language support for the Language Server Protocol.
Plug 'jsfaint/gen_tags.vim'                                                                           " Async plugin to ease the use of ctags/gtags.
Plug 'junegunn/fzf.vim'                                                                               " fuzzy finder for vim.
Plug 'junegunn/goyo.vim'                                                                              " Distraction-free writing in Vim.
Plug 'junegunn/gv.vim'                                                                                " Git commit browser.
Plug 'lifepillar/vim-solarized8'                                                                      " Solarized true color colorscheme for vim.
Plug 'mads-hartmann/bash-language-server', { 'do': function('BuildBashLanguageServer') }              " A language server for Bash.
Plug 'majutsushi/tagbar'                                                                              " Vim plugin that displays tags in a window, ordered by scope
Plug 'marcdeop/php-language-server', { 'do': function('BuildPhpLanguageServer'), 'branch': 'rename' } " Language server protocol for php.
Plug 'MicahElliott/Rocannon',                                                                         " Vim for Ansible playbooks.
Plug 'mileszs/ack.vim'                                                                                " Run your favorite search tool from vim.
Plug 'morhetz/gruvbox'                                                                                " Gruvbox colorscheme for vim.
Plug 'nathanaelkane/vim-indent-guides'                                                                " Visually diosplaying indent levels for vim.
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                                       " Make your Vim/Neovim as smart as VSCode.
Plug 'npmiller/vreeze'                                                                                " Breeze inspired vim colorscheme
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'rakr/vim-one'                                                                                   " Adaptation of one-light and one-dark colorschemes for Vim.
Plug 'rodjek/vim-puppet'                                                                              " Make vim more puppet friendly!.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  \ | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'shumphrey/fugitive-gitlab.vim'                                                                  " Allows use of vim-fugitive with gitlab repositories
Plug 'Shougo/echodoc.vim'                                                                             " Show function signature and inline doc.
Plug 'Shougo/neco-vim'                                                                                " Autocompletion for vimscript.
Plug 'Shougo/neco-syntax'                                                                             " Syntax autocompletion.
Plug 'sickill/vim-pasta'                                                                              " context-aware pasting.
Plug 'SidOfc/mkdx',                                                                                   " Nice extras for working with markdown documents
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'                                                   " Snippets for vim.
Plug 'sjl/gundo.vim'                                                                                  " Visualize your vim undo tree.
Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install && npm run build' }         " Language server protocol for javascript.
Plug 'stephpy/vim-yaml'                                                                               " Override vim syntax for yaml files
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
set cmdheight=2                   " Give more space for displaying messages
set updatetime=300                " Reduce to 300 because default is 4000!

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
let g:airline_theme                               = 'gruvbox' " airline theme
let g:airline_powerline_fonts                     = 1
let g:airline#extensions#tagbar#enabled           = 1     " enable/disable tagbar integration >
let g:airline#extensions#tabline#enabled          = 1     " Enable the list of buffers
let g:airline#extensions#tabline#buffer_min_count = 0     " configure the minimum number of buffers needed to show the tabline.
let g:airline#extensions#branch#enabled           = 1     " enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#empty_message     = ''    " change the text for when no branch is detected
let g:airline#extensions#branch#use_vcscommand    = 0     " do not use vcscommand.vim if available
let g:airline_exclude_filetypes                   = ['nerdtree']

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

"""""""""
"  CoC  "
"""""""""
let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-css',
  \ 'coc-docker',
  \ 'coc-emoji',
  \ 'coc-git',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-markdownlint',
  \ 'coc-phpls',
  \ 'coc-pyright',
  \ 'coc-rls',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-tag',
  \ 'coc-tsserver',
  \ 'coc-ultisnips',
  \ 'coc-yaml',
  \ 'coc-yank'
  \]
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
nmap <silent><leader>b :Buffers<cr>

"""""""""""""""""""""""
"  Markdown Composer  "
"""""""""""""""""""""""
let g:markdown_composer_autostart = 0

""""""""""""""""""""""
"  Markdown Preview  "
""""""""""""""""""""""
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = 'falkon'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''

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
      \                              'update_on_write': 1,
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

""""""""""""""
"  NERDTree  "
""""""""""""""
let NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

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

" note that must keep noinsert in completeopt, the others is optional
set completeopt=noinsert,menuone,noselect,preview
inoremap <Nul> <C-x><C-o>

