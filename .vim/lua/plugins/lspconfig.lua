local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {}

require('lspconfig')['pylsp'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    pylsp = {
      configurationSources = { 'flake8' },
      plugins = {
        rope_autoimport = {
          enabled = true,
        },
        pyflakes = {
          enabled = false,
        },
        mccabe = {
          enabled = true,
          threshold = 5,
        },
        pycodestyle = {
          enabled = true,
        },
        flake8 = {
          enabled = false,
          maxComplexity = 10,
        },
        pylint = {
          enabled = true,
          args = { '--init-hook "import sys; sys.path.append(\'/usr/lib/python3.11/site-packages/\'); sys.path.append(\'/home/marc/.local/lib/python3.11/site-packages\')"' },
        },
        isort = {
          enabled = true,
        },
        autopep8 = {
          enabled = false,
        },
        yapf = {
          enabled = true,
        },
      }
    }
  }
}

require('lspconfig')['dockerls'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['tsserver'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    ["rust-analyzer"] = {}
  }
}

require('lspconfig')['docker_compose_language_service'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['lua_ls'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' },
      },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
    }
  },
}
