require ('mason-nvim-dap').setup({
  ensure_installed = {'python'},
  handlers = {
    function(config)
      -- all sources with no handler get passed here
      -- Keep original functionality
      require('mason-nvim-dap').default_setup(config)
    end,
    python = function(config)
      config.adapters = {
        type = "executable",
        command = os.getenv('HOME') .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
        args = {
          "-m",
          "debugpy.adapter",
        },
      }
      require('mason-nvim-dap').default_setup(config) -- don't forget this!
    end,
  },
})
