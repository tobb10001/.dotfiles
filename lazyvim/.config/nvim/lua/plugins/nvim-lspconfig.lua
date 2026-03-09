return {
  {
    "barreiroleo/ltex_extra.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              linters = {
                SentenceCapitalization = false,
                LongSentences = false,
                AvoidCurses = false,
              },
              dialect = "British",
            },
          },
        },
        ltex_plus = {
          on_attach = function(client, bufnr)
            require("ltex_extra").setup(client, bufnr)
          end,
          filetypes = { "tex" }, -- Use Harper for everything else.
          settings = {
            ltex = {
              language = "en",
            },
          },
        },
        tclsp = {},
        tinymist = {
          keys = {
            {
              "<leader>cP",
              function()
                local buf_name = vim.api.nvim_buf_get_name(0)
                local file_name = vim.fn.fnamemodify(buf_name, ":t")
                LazyVim.lsp.execute({
                  command = "tinymist.pinMain",
                  arguments = { buf_name },
                })
                LazyVim.info("Tinymist: Pinned " .. file_name)
              end,
              desc = "Pin main file",
            },
          },
          signle_file_support = true,
          settings = {
            exportPdf = "onSave",
            formatterMode = "typstyle",
          },
        },
      },
    },
  },
}
