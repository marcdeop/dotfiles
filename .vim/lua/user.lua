local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- disable virtual_text (inline) diagnostics and use floating window
-- format the message such that it shows source, message and
-- the error code.
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = true,
  float = {
    border = "rounded",
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        -- diagnostic.code or diagnostic.user_data.lsp.code
        diagnostic.code
      )
    end,
  },
})

-- IMPORTANT!!! Order here might be relevant
-- mason must be ahead of lspconfig for example
require('plugins.autopairs')
require('plugins.cmp')
require('plugins.goto-preview')
require('plugins.lsp_signature')
require('plugins.mason')
require('plugins.mason-lspconfig')
require('plugins.lint')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.lualine')
require('plugins.symbols-outline')
require('plugins.fold-preview')
require('plugins.gitsigns')
require('plugins.neotree')
