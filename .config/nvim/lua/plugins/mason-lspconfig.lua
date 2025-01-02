require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "clangd",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "jsonls",
    "lemminx",
    "lua_ls",
    "marksman",
    "neocmake",
    "pylsp",
    "ruff",
    "rust_analyzer",
    "terraformls",
    "tflint",
    "vimls",
    "yamlls"
  }
}
