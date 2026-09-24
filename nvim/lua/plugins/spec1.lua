return {

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'lua', 'vim', 'bash' },
        highlight = { enable = true },
      })
    end,
  },

  -- Telescope (Search like Ctrl+P / Ctrl+Shift+F)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      require('telescope').setup({
		  defaults = {
			file_ignore_patterns = { "%.git/", "%.o$" },
		  },
        pickers = {
          find_files = { hidden = true },
          live_grep = { additional_args = { '--hidden' } },
        },
      })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
    end,
  },

  -- Neo-tree (Sidebar file explorer)
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Explorer' })
    end,
  },

  -- Status bar at the bottom
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({ options = { theme = 'auto' } })
    end,
  },

  -- Integrated Terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = 'horizontal',
      })
    end,
  },

  -- Auto-save and restore open tabs/buffers on restart
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    config = function()
      require("persistence").setup()
      -- Restore last session on startup or with keybinds
      vim.keymap.set("n", "<leader>ls", function() require("persistence").load() end, { desc = "Restore Session" })
      vim.keymap.set("n", "<leader>ll", function() require("persistence").load({ last = true }) end, { desc = "Restore Last Session" })
    end,
  },
}
