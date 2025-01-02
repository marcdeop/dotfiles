-- Start the GH actions language server
-- Requries `npm i -g @strozw/github-actions-languageserver`
vim.api.nvim_create_autocmd("FileType", {
  pattern = "github-actions-workflow",
  callback = function()
    vim.lsp.start({
      name = "gh-actions-ls",
      filetypes = { "github-actions-workflow" },
      cmd = { "npx", "github-actions-languageserver", "--stdio" },
      root_dir = vim.fn.getcwd(),
      init_options = {
        sessionToken = "",
      },
      settings = {},
    })
  end,
})

-- Set specify yaml files to be of type github-actions-workflow
vim.cmd("autocmd BufRead,BufNewFile *.github/workflows/*.yaml set filetype=github-actions-workflow")
vim.cmd("autocmd BufRead,BufNewFile *.github/workflows/*.yml set filetype=github-actions-workflow")
vim.treesitter.language.register("yaml", "github-actions-workflow")
