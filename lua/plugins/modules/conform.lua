return {

  'stevearc/conform.nvim',

  config = function()
    local conform = require 'conform'

    local format_opts = {

      timeout_ms = 5000,

      lsp_fallback = true,
    }

    local format = function() conform.format(format_opts) end

    conform.setup {
      --- These options will be passed to conform.format()
      ---
      format_on_save = format_opts,

      formatters_by_ft = {

        json = { 'prettierd' },

        javascript = { 'prettierd' },

        jsx = { 'prettierd' },

        typescript = { 'prettierd' },

        tsx = { 'prettierd' },

        html = { 'prettierd' },

        css = { 'prettierd' },

        yaml = { 'prettierd' },
      },
    }

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    vim.keymap.set('n', '<leader>c', format, {
      noremap = true,
      silent = true,
      desc = 'Format current buffer with conform.nvim'
    })
  end
}
