-- Only use copilot on MacOS (used for work)
if vim.fn.has('macunix') then
  require("CopilotChat").setup {}
end
