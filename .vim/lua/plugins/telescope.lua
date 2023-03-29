require('telescope').setup{
}

--------------------
--  Key Mappings  --
--------------------
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", {noremap=true})
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<CR>", {noremap=true})
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope tags<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", {noremap=true})
vim.keymap.set("n", "<leader>fws", "<cmd>Telescope lsp_workspace_symbols<CR>", {noremap=true})
