local keymap = vim.keymap.set

-- Key mappings using a more concise approach
local keymaps = {
  -- Movement
  { 'n', ';', ':', 'Command mode' },
  { 'v', ';', ':', 'Command mode' },
  { 'n', 'j', 'gj', 'Move down by display line' },
  { 'n', 'k', 'gk', 'Move up by display line' },
  { 'v', 'j', 'gj', 'Move down by display line' },
  { 'v', 'k', 'gk', 'Move up by display line' },
  
  -- Fast buffer navigation
  { '', '<C-h>', '<C-w>h', 'Move to left window' },
  { '', '<C-j>', '<C-w>j', 'Move to lower window' },
  { '', '<C-k>', '<C-w>k', 'Move to upper window' },
  { '', '<C-l>', '<C-w>l', 'Move to right window' },
  
  -- Jump to matching pairs
  { 'n', '<Space>', '%', 'Jump to matching pair' },
  { 'v', '<Space>', '%', 'Jump to matching pair' },
  
  -- Increment and decrement
  { 'n', '+', '<C-a>', 'Increment number' },
  { 'n', '-', '<C-x>', 'Decrement number' },
  
  -- Copy/Paste
  { 'n', '<leader>gp', '`[v`]', 'Select last yanked/pasted text' },
  
  -- Config editing
  { 'n', '<leader>ev', ':e ~/.config/nvim/init.lua<CR>', 'Edit Neovim config', { silent = true } },
  { 'n', '<leader>sv', ':luafile ~/.config/nvim/init.lua<CR>', 'Source Neovim config', { silent = true } },
  
  -- Clear search highlights
  { 'n', '<leader>/', ':nohlsearch<CR>', 'Clear search highlights', { silent = true } },
}

-- Apply all keymaps
for _, map in ipairs(keymaps) do
  local mode, lhs, rhs, desc = map[1], map[2], map[3], map[4]
  local opts = map[5] or {}
  opts.desc = desc
  keymap(mode, lhs, rhs, opts)
end
