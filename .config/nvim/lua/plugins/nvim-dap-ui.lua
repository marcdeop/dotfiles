require("dapui").setup()
local function opts(description)
  return { noremap=true, silent=true, desc=description }
end

vim.keymap.set('n', '<leader>du' , function() require("dapui").toggle({}) end , opts("DAP UI"))
