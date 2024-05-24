-- [[ Basic Keymaps ]]

--  See `:help vim.keymap.set()`
--
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Exit terminal mode in the builtin terminal ith  shortcut hat is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
keymap("n", "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })
keymap("n", "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

-- Resize windows
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })
keymap(
  "n",
  "<C-Right>",
  "<cmd>vertical resize +2<CR>",
  { desc = "General | Add size at the left", silent = true }
)
keymap(
  "n",
  "<C-Left>",
  "<cmd>vertical resize -2<CR>",
  { desc = "General | Add size at the right", silent = true }
)

-- Easier Indenting
keymap("n", "<", "<<", { desc = "General | Indent backward", silent = true })
 keymap("n", ">", ">>", { desc = "General | Indent forward", silent = true })


-- Move lines up and down
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "General | Move the line up", silent = true })
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "General | Move the line down", silent = true })
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "General | Move the line up", silent = true })
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "General | Move the line down", silent = true })
keymap("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "General | Move the selected text up", silent = true })
keymap("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "General | Move the selected text down", silent = true })


-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "General | Clear search highlights", silent = true })

-- Window management
keymap("n", "<leader>pv", "<C-w>v", { desc = "[P]ane split [V]erticallyleade" })
keymap("n", "<leader>ph", "<C-w>s", { desc = "[P]ane split [H]orizontally" })
keymap("n", "<leader>pe", "<C-w>=", { desc = "[P]ane [E]qualize sizes" })
keymap("n", "<leader>pc", "<C-w>q", { desc = "[P]ane [C]lose" })

-- Tabs management
keymap("n", "<leader>to", ":tabnew<CR>", { desc = "[T]ab [O]pen new" })
keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "[T]ab [C]lose" })
keymap("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab [N]ext" })
keymap("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab [P]revious" })
keymap("n", "<leader>tb", ":tabnew %<CR>", { desc = "[T]ab open new with current [B]uffer" })

-- Keybinds to make tab navigation easier.
keymap("n", "<TAB>", "gt", { desc = "Go to next tab" })
keymap("n", "<S-TAB>", "gT", { desc = "Go to previous tab" })

-- {{{ Folding commands.
-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
keymap("n", "zv", "zMzvzz", {
  desc = "Close all folds except the current one",
})

-- Close current fold when open. Always open next fold.
keymap("n", "zj", "zcjzOzz", {
  desc = "Close current and open next fold.",
})

-- Close current fold when open. Always open previous fold.
keymap("n", "zk", "zckzOzz", {
  desc = "Close current fold and open previous fold.",
})


-- Better paste
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
keymap("v", "p", '"_dP', opts)

-- Hotfix: something is interfiring with pasting in normal mode. This fix it.
keymap("n", "p", "p")


-- Copy whole file content to clipboard with C-c
keymap("n", "<C-c>", ":%y+<CR>", opts)

-- Select all text in buffer with Alt-a
keymap("n", "<A-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- Easier access to beginning and end of lines
keymap("n", "<A-h>", "^", {
  desc = "Go to start of line",
  silent = true,
})
keymap("n", "<A-l>", "$", {
  desc = "Go to end of line",
  silent = true,
})
