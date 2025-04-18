-- local opts = { noremap=true, silent=true }
local function opts(description)
  return { noremap=true, silent=true, desc=description }
end
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts("Show diagnostics in a floating window"))
vim.keymap.set('n', '[d',       vim.diagnostic.goto_prev,  opts("Move to the previous diagnostic in the current buffer"))
vim.keymap.set('n', ']d',       vim.diagnostic.goto_next,  opts("Move to the next diagnostic in the current buffer"))
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts("Add buffer diagnostics to the location list"))

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function bufopts(description)
    return { noremap=true, silent=true, buffer=bufnr, desc=description }
  end
  -- lsp_signature seems to provide a better signature help.
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gD',        vim.lsp.buf.declaration            , bufopts("Jumps to the declaration of the symbol under the cursor"))
  vim.keymap.set('n', 'gd',        vim.lsp.buf.definition             , bufopts("Jumps to the definition of the type of the symbol under the cursor"))
  vim.keymap.set('n', 'K' ,        vim.lsp.buf.hover                  , bufopts("Displays hover information about the symbol under the cursor in a floating window"))
  vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation         , bufopts("Lists all the implementations for the symbol under the cursor in the quickfix window"))
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder   , bufopts("Add the folder at path to the workspace folders"))
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts("Remove the folder at path from the workspace folders"))
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts("List workspace folders"))
  vim.keymap.set('n', '<space>D',  vim.lsp.buf.type_definition, bufopts("Jumps to the definition of the type of the symbol under the cursor"))
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename         , bufopts("Renames all references to the symbol under the cursor"))
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action    , bufopts("Selects a code action available at the current cursor position"))
  vim.keymap.set('i', '<space>ca', vim.lsp.buf.code_action    , bufopts("Selects a code action available at the current cursor position"))
  vim.keymap.set('n', 'gr',        vim.lsp.buf.references     , bufopts("Lists all the references to the symbol under the cursor in the quickfix window"))
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts("Formats a buffer using the attached (and optionally filtered) language server clients"))
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {}

require('lspconfig')['pyright'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}

require('lspconfig')['dockerls'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['ts_ls'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['ruff'].setup{}

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

require('lspconfig')['groovyls'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

local lspconfig = require("lspconfig")['gopls'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['bashls'].setup{}
