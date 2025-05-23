local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

-- require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


-- find more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Copilot = "",
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-3), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(3), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
                              if cmp.visible() then
                                cmp.select_next_item()
                              elseif luasnip.expandable() then
                                luasnip.expand()
                              elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                              elseif check_backspace() then
                                fallback()
                              else
                                fallback()
                              end
                            end,
                            {
                              "i",
                              "s",
                            }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                  cmp.select_prev_item()
                                elseif luasnip.jumpable(-1) then
                                  luasnip.jump(-1)
                                else
                                  fallback()
                                end
                              end, {
                                "i",
                                "s",
                              }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu", },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s',
                                    kind_icons[vim_item.kind],
                                    vim_item.kind)
      vim_item.menu = ({
        buffer = "[Buffer]",
        cmdline = "[Vim Command]",
        luasnip = "[Luasnip]",
        nvim_lsp = "[LSP]",
        nvim_lsp_signature_help = "[Signature]",
        path = "[Path]",
        treesitter = "[Treesitter]",
        ultisnips = "[UltiSnips]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    -- ordering here gives weight. Do not sort please :-)
    { name = "nvim_lsp" },
    { name = "copilot" },
    { name = "ultisnips" },
    { name = "buffer" },
    { name = 'tmux' },
    { name = "path" },
    { name = 'nvim_lua' },
    { name = 'emoji' },
    { name = 'gitmoji' },
    { name = "git" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

-- search for word
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  }
})

-- command completion
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
