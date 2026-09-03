return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  keys = {
    { '<leader>gsj', '<cmd>GoTagAdd json<cr>', desc = '[G]o [S]truct tags: add json', ft = 'go' },
    { '<leader>gsy', '<cmd>GoTagAdd yaml<cr>', desc = '[G]o [S]truct tags: add yaml', ft = 'go' },
    { '<leader>gsr', '<cmd>GoTagRm<cr>', desc = '[G]o [S]truct tags: remove', ft = 'go' },
    { '<leader>ge', '<cmd>GoIfErr<cr>', desc = '[G]o if [E]rr stub', ft = 'go' },
    {
      '<leader>gi',
      function()
        vim.ui.input({ prompt = 'Interface (e.g. io.Reader): ' }, function(iface)
          if iface and iface ~= '' then
            vim.cmd('GoImpl ' .. iface)
          end
        end)
      end,
      desc = '[G]o [I]mplement interface',
      ft = 'go',
    },
    { '<leader>gc', '<cmd>GoCmt<cr>', desc = '[G]o [C]omment stub', ft = 'go' },
  },
  config = function()
    require('gopher').setup {}
  end,
}
