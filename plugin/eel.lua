-- emacs.nvim
vim.cmd("startinsert")

-- autocommand
vim.api.nvim_create_autocmd({'ModeChanged'}, {
      pattern = {'*:n*'},
      callback = function(ev)
	 vim.cmd('startinsert')
      end
})

-- define functions.
function eel__kill_to_end()
   local buffer = vim.api.nvim_get_current_buf()
   local r,c = unpack(vim.api.nvim_win_get_cursor(0))
   local line_len = string.len(vim.api.nvim_get_current_line())
   vim.api.nvim_buf_set_text(buffer, r - 1, c, r - 1, line_len, {})
end

-- define basic emacs keys.
vim.keymap.set({'i', 'v', 'c'}, '<C-n>', '<Down>')
vim.keymap.set({'i', 'v', 'c'}, '<C-p>', '<Up>')
vim.keymap.set({'i', 'v', 'c'}, '<C-f>', '<Right>')
vim.keymap.set({'i', 'v', 'c'}, '<C-b>', '<Left>')
vim.keymap.set({'i', 'v', 'c'}, '<C-a>', '<Home>')
vim.keymap.set({'i', 'v', 'c'}, '<C-e>', '<End>')
vim.keymap.set({'i', 'v', 'c'}, '<C-l>', '<C-o>zz')
vim.keymap.set({'i', 'v', 'c'}, '<M-x>', '<C-o>:')
vim.keymap.set({'i', 'v', 'c'}, '<M-f>', '<C-Right>')
vim.keymap.set({'i', 'v', 'c'}, '<M-b>', '<C-Left>')
vim.keymap.set({'i', 'v', 'c'}, '<C-v>', '<PageDown>')
vim.keymap.set({'i', 'v', 'c'}, '<M-v>', '<PageUp>')
vim.keymap.set({'i', 'v', 'c'}, '<C-d>', '<Del>')

-- define advanced emacs keys.
vim.keymap.set('i', '<C-k>', eel__kill_to_end)
--vim.keymap.set({'i', 'v', 'c'}, '<C-Space>', '<Esc>v')
--vim.keymap.set('i', '<C-y>', '<Esc>pi')
--vim.keymap.set('i', '<M-d>', '<Esc>dwi')
--vim.keymap.set('n', '<lt>', 'ggi')
--vim.keymap.set('n', '<gt>', 'Gi')
--vim.keymap.set('v', '<M-w>', 'y')
--vim.keymap.set('v', '<C-w>', 'd')
