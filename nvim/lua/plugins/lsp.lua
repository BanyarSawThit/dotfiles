return {

  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.config('clangd', {
        cmd = {
          '/opt/homebrew/opt/llvm/bin/clangd', -- adjust if brew installs elsewhere
          '--query-driver=/usr/bin/cc',        -- let clangd borrow Apple clang's system header paths
        },
      })
      vim.lsp.enable('clangd')

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end,
      })
    end,
  },

}
