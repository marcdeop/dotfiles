local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.hadolint.with({
          diagnostic_config = {
            underline = true,
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            severity_sort = true,

          }
        }),
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = {"--ignore-missing-imports",},
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
        -- We use pylsp for this
        -- null_ls.builtins.formatting.yapf,
    },
})
