return {
  -- Buffer tabs
  {
    'akinsho/bufferline.nvim',
    version = '*',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      local bufferline = require('bufferline')
      bufferline.setup({
        options = {
          -- Show open buffers rather than Vim tab pages.
          mode = 'buffers',

          -- Simple separators between buffers.
          separator_style = 'slant',
          numbers = "ordinal",

          -- Show LSP diagnostics in the buffer tabs.
          diagnostics = 'nvim_lsp',
          indicator = { style = 'none' },
          show_buffer_close_icons = false,
          show_close_icon = false,

          -- Keeps icons colorful, but forces their background to match the buffer tab!
          color_icons = true,

          -- Make Neo-tree occupy a proper section on the left.
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'Explorer',
              text_align = 'left',
              separator = true,
            },
          },
        },

        highlights = {
          fill = {
            fg = '#171717',
          },
          -- Inactive buffers
          background = {
            bg = '#171717',
            fg = '#6A9CF8',
          },

          -- Active buffer
          buffer_selected = {
            bg = '#171717',
            fg = '#C0C0C0',
            bold = true,
            italic = true,
          },

          numbers = {
            bg = '#171717',
            fg = '#6A9CF8',
          },

          numbers_selected = {
            bg = '#171717',
            fg = '#C0C0C0',
          },

          -- Separators
          separator = {
            bg = '#171717',
            fg = '#6A9CF8',
          },
          separator_selected = {
            bg = '#171717',
            fg = '#C0C0C0',
          },
        },
      })

      -- Go to the previous buffer.
      vim.keymap.set(
        'n',
        '<S-h>',
        '<cmd>BufferLineCyclePrev<CR>',
        { desc = 'Previous buffer' }
      )

      -- Go to the next buffer.
      vim.keymap.set(
        'n',
        '<S-l>',
        '<cmd>BufferLineCycleNext<CR>',
        { desc = 'Next buffer' }
      )

      -- Move the current buffer to the left.
      vim.keymap.set(
        'n',
        '<leader>mp',
        '<cmd>BufferLineMovePrev<CR>',
        { desc = 'Move buffer left' }
      )

      -- Move the current buffer to the right.
      vim.keymap.set(
        'n',
        '<leader>mn',
        '<cmd>BufferLineMoveNext<CR>',
        { desc = 'Move buffer right' }
      )

      -- Close the current buffer.
      vim.keymap.set(
        'n',
        '<leader>w',
        '<cmd>bdelete!<CR>',
        { desc = 'Close buffer' }
      )

      -- Jump directly to buffers 1 through 9.
      for i = 1, 9 do
        vim.keymap.set(
          'n',
          '<leader>' .. i,
          function()
            bufferline.go_to(i, true)
          end,
          { desc = 'Go to buffer ' .. i }
        )
      end
    end,
  },
}
