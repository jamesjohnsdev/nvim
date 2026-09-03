return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'fredrikaverpil/neotest-golang',
  },
  keys = {
    {
      '<leader>rt',
      function()
        require('neotest').run.run()
      end,
      desc = '[R]un [T]est nearest',
    },
    {
      '<leader>rf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = '[R]un [F]ile tests',
    },
    {
      '<leader>ro',
      function()
        require('neotest').output.open { enter = true }
      end,
      desc = '[R]un [O]utput',
    },
    {
      '<leader>rs',
      function()
        require('neotest').summary.toggle()
      end,
      desc = '[R]un [S]ummary',
    },
    {
      '<leader>rd',
      function()
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = '[R]un [D]ebug nearest',
    },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-golang' {},
      },
    }
  end,
}
