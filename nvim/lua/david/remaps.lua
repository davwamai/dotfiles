local Remap = require("david.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap

local silent = { silent = true }

-- easier to enter normal mode
inoremap("jk", "<Esc>")

-- Movement
-- remaps movement keys in normal mode to nav 
-- between split windows 
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-J>", "<C-W><C-J>")

-- remaps ctrl d in normal mode to jump half page and recenter cursor
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- search 'next' and 'Before'
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- not sure how it works but really old way of doing the last two above 
-- keymaps
xnoremap(
  "n",
  [[:<c-u>let temp_variable=@"<CR>gvy:<c-u>let @/='\V<C-R>=escape(@",'/\')<CR>'<CR>:let @"=temp_variable<CR>]],
  silent
)

-- Copy Paste to sys clipboard
xnoremap("<leader>y", "\"+y", silent)

-- built in terminal
nnoremap("<leader>t", "<Cmd>vsp<CR> <Cmd>term<CR> <Cmd>resize 20N<CR> i", silent)
tnoremap("<C-c><C-c>", "<C-\\><C-n>", silent)
--Alt v to paste sys clipboard into terminal
tnoremap("<D-v>", function()
  local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>\"+pi", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, silent)

-- misc
-- search and replace
nnoremap("<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- write shortcut 
nnoremap("<leader>w", "<Cmd>w<CR>")
--quit shortcut
nnoremap("<leader>q", "<Cmd>q<CR>")
-- join lines
nnoremap("J", "mzJ`z")
xnoremap("J", "mzJ`z")
