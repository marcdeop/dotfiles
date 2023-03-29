require('goto-preview').setup {
  -- Width of the floating window
  width = 120;
  -- Height of the floating window
  height = 15;
  -- Border characters of the floating window
  border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"};
  -- Bind default mappings
  default_mappings = false;
  -- Print debug information
  debug = false;
  -- 0-100 opacity level of the floating window where 100 is fully transparent.
  opacity = nil;
  -- Binds arrow keys to resizing the floating window.
  resizing_mappings = false;
  -- A function taking two arguments, a buffer and a window to be ran as a hook.
  post_open_hook = nil;
  -- Configure the telescope UI for slowing the references cycling window.
  references = {
    telescope = require("telescope.themes").get_dropdown({
                                                           hide_preview = false
                                                         })
  };
  -- These two configs can also be passed down to the goto-preview definition
  -- and implementation calls for one off "peak" functionality.
  -- Focus the floating window when opening it.
  focus_on_open = true;
  -- Dismiss the floating window when moving the cursor.
  dismiss_on_move = false;
  -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  force_close = true,
  -- the bufhidden option to set on the floating window. See :h bufhidden
  bufhidden = "wipe",
}

vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.keymap.set("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", {noremap=true})
vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {noremap=true})
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {noremap=true})
