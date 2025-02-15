return {
  "saghen/blink.cmp",

  version = "*",
  event = { "BufReadPost", "BufNewFile", "CmdlineEnter" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {

      preset = "none",                    -- disable all keymaps, that we didn't create

      ['<C-Space>'] = { "show", "hide" }, -- toggle
      ['<CR>'] = { "accept", "fallback" },
      ['<C-k>'] = { "select_prev", "fallback" },
      ['<C-j>'] = { "select_next", "fallback" },
      ['<C-h>'] = { "snippet_backward" },
      ['<C-l>'] = { "snippet_forward" },
    },

    completion = {
      list = {
        selection = {
          preselect = false
        }
      }
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }
}
