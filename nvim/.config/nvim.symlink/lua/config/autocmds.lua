-- FileType autocommands
local augroup = vim.api.nvim_create_augroup('FTCmds', { clear = true })

local autocmds = {
  {
    event = 'FileType',
    pattern = 'sh',
    callback = function()
      local opts = { 
        tabstop = 4, 
        shiftwidth = 4, 
        softtabstop = 4, 
      }
      for k, v in pairs(opts) do
        vim.opt_local[k] = v
      end
    end,
  },
  {
    event = 'FileType',
    pattern = 'crontab',
    callback = function()
      vim.opt_local.backup = false
      vim.opt_local.writebackup = false
    end,
  },
  {
    event = 'FileType',
    pattern = 'quickfix',
    callback = function()
      vim.opt_local.cursorline = true
    end,
  },
  {
    event = { 'BufNewFile', 'BufReadPost' },
    pattern = { '.tmux.conf*' },
    callback = function()
      vim.bo.filetype = 'tmux'
    end,
  },
  {
    event = { 'BufNewFile', 'BufReadPost' },
    pattern = { '*.md' },
    callback = function()
      vim.opt_local.spell = true
    end,
  },
  {
    event = { 'BufNewFile', 'BufReadPost' },
    pattern = { '*.keymap' },
    callback = function()
      vim.bo.filetype = 'dts'
      local opts = { 
        tabstop = 4, 
        shiftwidth = 4, 
        softtabstop = 4, 
      }
      for k, v in pairs(opts) do
        vim.opt_local[k] = v
      end
    end,
  },
}

-- Apply all autocommands
for _, cmd in ipairs(autocmds) do
  vim.api.nvim_create_autocmd(cmd.event, {
    group = augroup,
    pattern = cmd.pattern,
    callback = cmd.callback,
  })
end
