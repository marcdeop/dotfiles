--------------------------------------------------------------------------------
--                  Direct import from original .vimrc file                   --
--------------------------------------------------------------------------------
vim.cmd([[
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


call plug#begin('~/.config/nvim/plugged')
Plug 'aklt/plantuml-syntax'                                                                           " Syntax file for plantuml.
Plug 'andersevenrud/cmp-tmux'                                                                         " Tmux completion source for nvim-cmp.
Plug 'andymass/vim-matchup'                                                                           " Extended matching with '%'.
Plug 'anuvyklack/fold-preview.nvim'
    \ | Plug 'anuvyklack/keymap-amend.nvim'                                                           " Preview close folds, without opening them.
Plug 'Badacadabra/vim-archery'                                                                        " Vim colorscheme inspired by Arch Linux colors.
Plug 'benmills/vimux'                                                                                 " Easily interact with tmux from vim.
Plug 'brooth/far.vim'                                                                                 " Find and replace for vim.
Plug 'chriskempson/base16-vim'                                                                        " Base16 for Vim.
Plug 'christoomey/vim-tmux-navigator'                                                                 " Navigate seamlessly between vim and tmux splits.
Plug 'CopilotC-Nvim/CopilotChat.nvim'                                                                 " Copilot Chat for Neovim
Plug 'cquery-project/cquery',{ 'do': function('BuildCquery') }                                        " C/C++ language server.
Plug 'cyansprite/Extract'                                                                             " Extract; Draw forth what really matters.
Plug 'debugloop/telescope-undo.nvim'                                                                  " Visualize your undo tree and fuzzy-search changes in it.
Plug 'dracula/vim'                                                                                    " Dracula colorscheme for vim.
Plug 'Dynge/gitmoji.nvim'                                                                             " Gitmojis for Neovim using nvim-cmp
Plug 'easymotion/vim-easymotion'                                                                      " Vim motion on speed!.
Plug 'editorconfig/editorconfig-vim'                                                                  " Follow .editorconfig settings in projects.
Plug 'ellisonleao/glow.nvim'                                                                          " Preview markdown code directly in your neovim terminal
Plug 'fenetikm/falcon'                                                                                " A colour scheme for terminals, Vim and friends.
Plug 'folke/noice.nvim'                                                                               " Replace the UI for messages, cmdline and the popupmenu.
Plug 'godlygeek/tabular'                                                                              " Align text easily.
Plug 'github/copilot.vim'                                                                             " OpenAI Codex to suggest code and entire functions in real-time right
Plug 'hashivim/vim-terraform'                                                                         " Terraform filetype and highlight
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'junegunn/fzf.vim'                                                                               " fuzzy finder for vim.
Plug 'junegunn/gv.vim'                                                                                " Git commit browser.
Plug 'kosayoda/nvim-lightbulb'                                                                        " VSCode 💡 for neovim's built-in LSP.
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
Plug 'onsails/diaglist.nvim'                                                                          " Live-updating Neovim LSP diagnostics in quickfix and loclist
Plug 'onsails/lspkind.nvim'                                                                           " Add vscode-like pictograms to neovim built-in lsp
Plug 'OXY2DEV/markview.nvim'                                                                          " A highly-customisable & feature rich markdown previewer inside Neovim.
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'peterhoeg/vim-qml'                                                                              " QML syntax file for VIM
Plug 'petertriho/cmp-git'                                                                             " Git source for hrsh7th/nvim-cmp
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
Plug 'vim-utils/vim-man'                                                                              " View man pages in vim. Grep for the man pages.
Plug 'weirongxu/plantuml-previewer.vim'                                                               " Preview PlantUML.
Plug 'williamboman/mason.nvim'                                                                        " Easily install and manage LSP servers, DAP servers, linters, and formatters.
Plug 'williamboman/mason-lspconfig.nvim'                                                              " Bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
Plug 'windwp/nvim-autopairs'                                                                          " A super powerful autopair plugin for Neovim that supports multiple characters.
Plug 'Yggdroot/indentLine'                                                                            " Display thin vertical lines at each indentation level for code indented with spaces.
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'
call plug#end()

]])
--------------------------------------------------------------------------------
--                    End import from original .vimrc file                    --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--                                  General                                   --
--------------------------------------------------------------------------------
vim.opt.shortmess:append("I") -- Do not show intro message
vim.opt.shortmess:append("c") -- Do not pass messages to |ins-completion-menu|
vim.opt.undodir   = vim.fn.expand("~") .. "/.config/nvim/undo//"
vim.opt.directory = vim.fn.expand("~") .. "/.config/nvim/swapfiles//"
vim.opt.tags = "./tags;"
vim.opt.undofile = true                -- Keep file with undo history
vim.opt.laststatus = 2                 -- Always show status line
vim.opt.showmode = false               -- Do not show the mode we are working in (vim-airline)
vim.opt.showcmd = false                -- Show extra info while in visual mode (characters selected)
vim.opt.scrolloff = 3                  -- Always try to show three lines above and below cursor
vim.opt.backspace = "indent,eol,start" -- Del indentation,line breaks,pre-existing chars
vim.opt.compatible = false             -- No vi compatibility required
vim.opt.encoding = "utf-8"             -- Set default encoding
vim.opt.ignorecase = true              -- Ignore case
vim.opt.smartcase = true               -- Override ignorecase in the search pattern contains upper case characters
vim.opt.incsearch = true               -- Show where the pattern matches while typing a search command
vim.opt.showmatch = true               -- When a bracket is inserted, briefly jump to the matching one.
vim.opt.hlsearch = true                -- Highlight search pattern.
vim.opt.gdefault = true                -- Substitute everything by default, not only the first entry
vim.opt.hidden = true                  -- Required for operations modifying multiple buffers like rename.
vim.opt.ttyfast = true                 -- Faster redrawing
vim.opt.diffopt:append("vertical")     -- Open diff in vertical split
vim.opt.rtp:prepend('/usr/share/vim/vimfiles/') -- Make sure we read vimfiles ( in case we use nvim)
vim.opt.cmdheight = 1                   -- Give more space for displaying messages
vim.opt.updatetime = 300                -- Reduce to 300 because default is 4000!
vim.opt.showtabline = 1                 -- Show tabline if there are at least two tabs

-- handling proper lenght of lines
vim.opt.wrap = true
vim.opt.textwidth = 79
vim.opt.formatoptions = "qrn1"
vim.opt.colorcolumn = "80"

-- splits open on the right or bottom (vertical/horizontal)
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showbreak = "↪"

-- General custom shortcuts
vim.keymap.set('n', '<leader>z', ':wincmd _<cr>') -- Zoom a vim pane
vim.keymap.set('n', '<leader>=', ':wincmd =<cr>') -- Rebalance panes
vim.keymap.set('v', '<C-c>', '"+y')               -- <C-c> copy selection to clipboard
vim.keymap.set('v', '<C-x>', '"+d')               -- <C-x> cut selection to clipboard
-- Workaround for neovim wl-clipboard and netrw interaction hang
-- (see: https://github.com/neovim/neovim/issues/6695 and
-- https://github.com/neovim/neovim/issues/9806) 
vim.g.clipboard = {
  name = 'myClipboard',
  copy = {
    ["+"] = 'pbcopy',
    ["*"] = 'pbcopy',
  },
  paste = {
    ["+"] = 'pbpaste',
    ["*"] = 'pbpaste',
  },
  cache_enabled = "1",
}
-- map <leader>v            :set paste!<cr> " toggle paste mode
vim.g.mapleader = ','
vim.g.localleader = ','
vim.keymap.set('n', '<Leader>n', ':Neotree toggle right<cr>')
vim.keymap.set('n', '<leader>b', ':Neotree toggle float buffers<cr>')
vim.keymap.set('n', '<leader>g', ':Neotree toggle float git_status<cr>')

vim.keymap.set('n', '<Leader>-', ':vertical resize -10<cr>')
vim.keymap.set('n', '<Leader>+', ':vertical resize +10<cr>')
vim.keymap.set('n', '<Leader>h-', ':resize -10<cr>')
vim.keymap.set('n', '<Leader>h+', ':resize +10<cr>')

-- Terminal mode window navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')

-- Completely disable the arrow keys
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('v', '<up>', '<nop>')
vim.keymap.set('v', '<down>', '<nop>')
vim.keymap.set('v', '<left>', '<nop>')
vim.keymap.set('v', '<right>', '<nop>')

-- Consider wraped lines as lines when moving with jk
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Scroll the viewport faster
vim.keymap.set('n', '<C-e>', '3<C-e>')
vim.keymap.set('n', '<C-y>', '3<C-y>')

-- Make sure you 
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = { "*.yaml", "*.yml" },
  callback = function()
    vim.cmd("set filetype=yaml")
  end
})
--" Comment/Uncomment selected lines on ,c/,u in visual mode
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = { "haskell", "vhdl", "ada", "lua" },
  callback = function()
    vim.b['comment_leader'] = '-- '
  end
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = { "vim" },
  callback = function()
    vim.b['comment_leader'] = '" '
  end
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = { "c", "cpp", "java" },
  callback = function()
    vim.b['comment_leader'] = '// '
  end
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = { "bash", "sh", "make", "pp", "yaml" },
  callback = function()
    vim.b['comment_leader'] = '# '
  end
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = { "tex" },
  callback = function()
    vim.b['comment_leader'] = '% '
  end
})

-- To be converted into pure lua
vim.cmd([[
noremap <silent> ,c
  \ :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> ,u
  \ :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>
]])
--------------------------------------------------------------------------------
--                               End of General                               --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--                                 Appearance                                 --
--------------------------------------------------------------------------------
vim.opt.background    = "dark"
vim.opt.termguicolors = true
vim.g.onedark_config  = {
    style = 'dark',
}
vim.cmd('colorscheme onedark')
vim.opt.list      = true
vim.opt.rnu       = true  -- Enable reversenumbers
vim.opt.nu        = true  -- Enable line numbering
vim.opt.listchars = { tab = '·-', trail = '·' } -- Mark 'misplaced' characters
--------------------------------------------------------------------------------
--                             End of Appearance                              --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                                Indentation                                 --
--------------------------------------------------------------------------------
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 0
vim.opt.cindent     = true
vim.opt.smartindent = true
vim.opt.expandtab   = true
--------------------------------------------------------------------------------
--                             End of Indentation                             --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--                                 Completion                                 --
--------------------------------------------------------------------------------
vim.filetype.plugin = "on"
vim.optomnifunc = "syntaxcomplete#Complete"
--------------------------------------------------------------------------------
--                             End of Completion                              --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--                                  Plugins                                   --
--------------------------------------------------------------------------------
------------------
--  EasyMotion  --
------------------
vim.g.EasyMotion_smartcase = 1   -- Turn on case insensitive feature
vim.g.EasyMotion_startofline = 0 -- keep cursor colum when JK motion
vim.keymap.set('n', 's', '<Plug>(easymotion-overwin-f2)', { silent = true })
vim.keymap.set('n', '<Leader>j', '<Plug>(easymotion-j)')
vim.keymap.set('n', '<Leader>k', '<Plug>(easymotion-k)')
vim.keymap.set('n', '<Leader>l', '<Plug>(easymotion-lineforward)')
vim.keymap.set('n', '<Leader>h', '<Plug>(easymotion-linebackward)')

--------------------
--  EditorConfig  --
--------------------
vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }

---------------
--  Extract  --
---------------
vim.g.extract_useDefaultMappings = 0
vim.g.extract_maxCount = 25
vim.g.extract_loadDeoplete = 1
vim.keymap.set('i', '<m-v>', '<Plug>(extract-completeReg)')
vim.keymap.set('i', '<c-v>', '<Plug>(extract-completeList)')

----------------
--  Fugitive  --
----------------
vim.keymap.set('n', '<leader>gs', ':Git status<cr>', { silent = true })
vim.keymap.set('n', '<leader>ge', ':Gedit<cr>',      { silent = true })
vim.keymap.set('n', '<leader>gr', ':Gread<cr>',      { silent = true })
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>',  { silent = true })

------------------
--  IndentLine  --
------------------
vim.g.indentLine_setConceal = 0

------------------------
--  Markdown Preview  --
------------------------
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_browser = 'falkon'
-- To be converted to pure lua. This seems to be a mac only command!
vim.cmd([[
function OpenMarkdownPreview (url)
  execute 'silent ! open -a Google\ Chrome -n --args --new-window ' . a:url
endfunction
]])
vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {}
}
vim.g.mkdp_markdown_css = ''
vim.g.mkdp_highlight_css = ''
vim.g.mkdp_port = ''
vim.g.mkdp_page_title = '「${name}」'

------------
--  MKDX  --
------------
vim.g['mkdx#settings'] = {
  image_extension_pattern = 'a\\?png\\|jpe\\?g\\|gif',
  restore_visual =          1,
  enter =                   { enable = 1, malformed = 1, o = 1,
                              shifto = 1, shift = 0 },
  map =                     { prefix = '<leader>', enable = 1 },
  tokens =                  { enter = { '-', '*', '>' },
                              bold = '**', italic = '*', strike = '',
                              list = '-', fence = '',
                              header = '#' },
  checkbox =                { toggles = { ' ', '-', 'x' },
                              update_tree = 2,
                              initial_state = ' ' },
  toc =                     { text = "Table of Contents",
                              list_token = '*',
                              update_on_write = 0,
                              position = 2,
                              details = {
                                 enable = 0,
                                 summary = 'Click to expand {{toc.text}}'
                              }
                             },
  table =                   { divider = '|',
                              header_divider = '-',
                              align = {
                                 left =    {},
                                 center =  {},
                                 right =   {},
                                 default = 'center'
                              }
                             },
  links =                   { external = {
                                  enable = 1, timeout = 3, host = '', relative = 1,
                                  user_agent =  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/9001.0.0000.000 vim-mkdx/1.8.1'
                              },
                              fragment = {
                                 jumplist = 1,
                                 complete = 1
                              }
                            },
  highlight =               { enable = 1 },
  auto_update =             { enable = 1 }
}

------------
--  Tmux  --
------------
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set('n', '<c-h>', ':TmuxNavigateLeft<cr>',  { silent = true })
vim.keymap.set('n', '<c-j>', ':TmuxNavigateDown<cr>',  { silent = true })
vim.keymap.set('n', '<c-k>', ':TmuxNavigateUp<cr>',    { silent = true })
vim.keymap.set('n', '<c-l>', ':TmuxNavigateRight<cr>', { silent = true })
vim.keymap.set('n', '<c-\\>', ':TmuxNavigatePrevious<cr>', { silent = true })

-----------------
--  UltiSnips  --
-----------------
vim.g.UltiSnipsListSnippets = '<c-l>'
vim.g.UltiSnipsEditSplit = 'vertical'           -- Open snips vertically
vim.g.UltiSnipsSnippetsDir = vim.fn.expand("~") .. '/.config/nvim/UltiSnips' -- Store snips in this folder

-------------
--  Vimux  --
-------------
vim.keymap.set('n', '<Leader>vp', ':VimuxPromptCommand<CR>')     -- Prompt for a command to run
vim.keymap.set('n', '<Leader>vl', ':VimuxRunLastCommand<CR>')    -- Run last command executed by VimuxRunCommand
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<CR>')     -- Inspect runner pane
vim.keymap.set('n', '<Leader>vq', ':VimuxCloseRunner<CR>')       -- Close vim tmux runner opened by VimuxRunCommand
vim.keymap.set('n', '<Leader>vx', ':VimuxInterruptRunner<CR>')   -- Interrupt any command running in the runner pane
vim.keymap.set('n', '<Leader>vz', ':call VimuxZoomRunner()<CR>') -- Zoom the runner pane (use <bind-key> z to restore runner pane)

--------------------------------------------------------------------------------
--                               End of Plugins                               --
--------------------------------------------------------------------------------
-- Load lua/user.lua file
require "user"
