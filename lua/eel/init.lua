-- eel.nvim
vim.cmd("startinsert")
vim.cmd("set iskeyword-=_")

eel = {}

-- autocommand
vim.api.nvim_create_autocmd({'ModeChanged'}, {
      pattern = {'*:n*'},
      callback = function(ev)
	 vim.cmd('startinsert')
      end
})

-- define functions.
function eel__goto()
   local opts = { prompt = 'Goto line: ', scope = 'buffer' }

   vim.ui.input(opts, function(input)
		   local count = tonumber(input)
		   vim.cmd(':'..count)
   end)
end
function eel__query_replace()
   local opts = { prompt = 'Query replace: ', scope = 'buffer' }
   local to = ""
   local replace = ""

   vim.ui.input(opts, function(input)
		   to = input
   end)

   opts = { prompt = 'Query replace '..to..' with: ', scope = 'buffer' }
   vim.ui.input(opts, function(input)
		   replace = input
   end)

   vim.cmd(',$s/'..to..'/'..replace..'/g')
end

function eel__kill_to_end()
   local buffer = vim.api.nvim_get_current_buf()
   local r,c = unpack(vim.api.nvim_win_get_cursor(0))
   local line_len = string.len(vim.api.nvim_get_current_line())
   if line_len == 0 then
      vim.cmd('call feedkeys("\\<Del>")')
   end
   vim.api.nvim_buf_set_text(buffer, r - 1, c, r - 1, line_len, {})
end

function eel.add_key(lhs, rhs)
   assert(type(lhs) == "string")
   assert(type(rhs) == "string")

   vim.keymap.set({'i', 'v', 'n'}, '<C-c>'..lhs, rhs)
end

function eel.add_CX_key(lhs, rhs)
   assert(type(lhs) == "string")
   assert(type(rhs) == "string")

   vim.keymap.set({'i', 'v', 'n'}, '<C-x>'..lhs, rhs)
end

-- define basic emacs keys.
vim.o.ttimeoutlen = 50

vim.keymap.set({'i', 'v', 'c', 'n'}, '<C-n>', '<Down>')
vim.keymap.set({'i', 'v', 'c', 'n'}, '<C-p>', '<Up>')
vim.keymap.set({'i', 'v', 'c', 'n'}, '<C-f>', '<Right>')
vim.keymap.set({'i', 'v', 'c', 'n'}, '<C-b>', '<Left>')
vim.keymap.set({'i', 'v', 'c', 'n'}, '<C-a>', '<Home>')
vim.keymap.set({'i', 'v', 'c', 'n'}, '<C-e>', '<End>')
vim.keymap.set({'i', 'v', 'c'}, '<C-l>', '<C-o>zz')
vim.keymap.set('n', '<C-l>', 'zz')
vim.keymap.set({'i', 'v', 'c'}, '<M-x>', '<C-o>:')
vim.keymap.set({'i', 'v', 'c'}, '<M-f>', '<C-Right>')
vim.keymap.set({'i', 'v', 'c'}, '<M-b>', '<C-Left>')
vim.keymap.set({'i', 'v', 'c'}, '<C-v>', '<PageDown>')
vim.keymap.set({'i', 'v', 'c'}, '<M-v>', '<PageUp>')
vim.keymap.set({'i', 'v', 'c'}, '<C-d>', '<Del>')
vim.keymap.set({'i', 'c'}, '<M-d>', "<C-o>dw")
vim.keymap.set({'i', 'c'}, '<M-BS>', "<C-w>")
vim.keymap.set('i', '<M-LT>', "<C-o>gg")
vim.keymap.set('i', '<Esc>>', "<C-o>G<C-o>$")

-- define advanced emacs keys.
vim.keymap.set('i', '<C-k>', eel__kill_to_end)
vim.keymap.set('i', '<C-x><C-s>', "<C-o>:w<CR>")
vim.keymap.set('i', '<C-x>s', "<C-o>:wa<CR>")
vim.keymap.set('i', '<C-s>', "<C-o>/")
vim.keymap.set('i', '<C-c>', "<Nop>")
vim.keymap.set('i', '<C-x><C-c>', "<C-o>:qa<CR>")
vim.keymap.set({'i', 'v', 'c'}, '<C-Space>', '<Esc>v')
vim.keymap.set('i', '<C-y>', '<C-o>p')
vim.keymap.set('i', '<C-x><C-f>', '<C-o>:find ')
vim.keymap.set('i', '<C-x>', '<Nop>')
vim.keymap.set('i', '<C-x>d', '<C-o>:Ex ')
vim.keymap.set('i', '<C-x>o', '<C-o><C-w>w')
vim.keymap.set('i', '<C-x>u', '<C-o>u')
vim.keymap.set('i', '<C-x>h', '<C-o>gg<C-o>0<C-o>vG$')
vim.keymap.set('i', '<C-x>k', '<C-o>:bd ')
vim.keymap.set('i', '<C-x>b', '<C-o>:b ')
vim.keymap.set('i', '<C-m>_', '<C-o><C-r>')
vim.keymap.set('i', '<M-%>', eel__query_replace)
vim.keymap.set('v', '<M-w>', 'y')
vim.keymap.set('v', '<C-w>', 'd')
vim.keymap.set('v', '<C-g>', '<Esc>')
vim.keymap.set({'i', 'v', 'n'}, '<M-g><M-g>', eel__goto)
vim.o.ttimeoutlen = 0
vim.o.timeoutlen = 250
vim.cmd("set clipboard+=unnamedplus")
return eel
