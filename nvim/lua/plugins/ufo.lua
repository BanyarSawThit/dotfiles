return {

  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup({
        -- use treesitter first (you already have it for c/lua/vim/bash),
        -- fall back to indent-based folding if treesitter has no parser for a filetype
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end,
      })

      -- za: toggle fold under cursor (works with normal vim folding too)
      -- zR: open all folds
      -- zM: close all folds
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

      -- peek fold contents without opening it
      vim.keymap.set('n', 'zK', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = 'Peek fold' })
    end,
  },

}