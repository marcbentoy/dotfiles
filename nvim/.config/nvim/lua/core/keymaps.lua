local map = require("utils.keymaps")

vim.g.mapleader = " "

local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>da', ":lua vim.diagnostic.open_float()<CR>", bufopts)

-- File Tree
map("n", "<leader>eo", ":Neotree left focus<CR>", { desc = "Open neo-tree" })
map("n", "<leader>ep", ":Neotree left dir=. reveal_file=%:p<CR>", { desc = "Point current file in neo-tree" })
map("n", "<leader>ef", ":Neotree float dir=. reveal_file=%:p<CR>", { desc = "Point current file in neo-tree in float" })
map("n", "<leader>ew", ":Neotree close<CR>", { desc = "Close neo-tree" })

-- obsidian-nvim
map("n", "<leader>obd", ":ObsidianToday<CR>", { desc = "Open obsidian daily journal" })
map("n", "<leader>oby", ":ObsidianYesterday<CR>", { desc = "Open obsidian daily journal" })
map("n", "<leader>obp", ":ObsidianPasteImg<CR>", { desc = "Paste last copied image" })
map("n", "<leader>ob[", ":ObsidianYesterday<CR>", { desc = "Go to previous journal" })
map("n", "<leader>ob]", ":ObsidianTomorrow<CR>", { desc = "Go to next journal" })
map("n", "<leader>obn", ":ObsidianNew<CR>", { desc = "Go to next journal" })
map("n", "<leader>obs", ":ObsidianSearch<CR>", { desc = "Search keywords inside obsidian workspace" })
map("n", "<leader>obq", ":ObsidianQuickSwitch<CR>", { desc = "Search files inside obsidian workspace" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", noremap = true, silent = true })

-- File
map("n", "<leader>wf", ":w<CR>", { desc = "Save file" })
map("n", "<leader>w.", ":wa<CR>", { desc = "Save all files" })

-- Soft line wrapping navigation
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "0", "g0", { noremap = true })
vim.api.nvim_set_keymap("n", "$", "g$", { noremap = true })

-- fzf
map("n", "<leader>ff", ":Files<CR>", { noremap = true, silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
map('n', '<leader>fg', ':Rg<Space>', { noremap = true, silent = true })

-- lazygit-nvim
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Buffers
map("n", "<leader>bx", ":lua safe_bdelete()<CR>", { noremap = true, silent = true })
map("n", "<leader>vq", ":%bd<CR>:q<CR>", { desc = "Close neovim" })
-- map("n", "<leader>qq", ":bd<CR>", { desc = "Close buffer and window" })
map("n", "<leader>[", "<C-o>zz", { desc = "jump back", noremap = true, silent = true })
map("n", "<leader>]", "<C-i>", { desc = "jump forward", noremap = true, silent = true })

-- Navigate to the next buffer
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Navigate to the previous buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Map the function to a key (e.g., <leader>c)
vim.api.nvim_set_keymap("n", "<leader>x", ":lua CloseCurrentBuffer()<CR>", { noremap = true, silent = true })

-- Close the current buffer without closing the window
map("n", "<leader>C", ":bd!<CR>", { noremap = true, silent = true })

-- Close all other buffers except the current one
map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

-- tmux
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "window up" })

-- Clear search highlighting
map("n", "<leader>sq", ":nohl<CR>", { desc = "Clear search highlighting" })

-- Reload configuration without restart nvim
map("n", "<leader>r", ":source<CR>")

-- Window splits
map("n", "<leader>ww", "<C-w>w")
map("n", "<leader>wh", ":wincmd h<CR>", { desc = "Jump to left window" })
map("n", "<leader>wj", ":wincmd j<CR>", { desc = "Jump to down window" })
map("n", "<leader>wk", ":wincmd k<CR>", { desc = "Jump to up window" })
map("n", "<leader>wl", ":wincmd l<CR>", { desc = "Jump to right window" })

for i = 1, 9, 1 do
    -- Move between windows by leader + window number
    map("n", "<leader>" .. i, ":" .. i .. "wincmd w<CR>")
    -- Close a window by leader + d + window number
    map("n", "<leader>d" .. i, ":" .. i .. "wincmd c<CR>")
end

map("n", "=", "<cmd>vertical resize +5<cr>", { desc = "Make window wider (horizontally)" })      -- make the window biger vertically
map("n", "-", [[<cmd>vertical resize -5<cr>]], { desc = "Make window narrower (horizontally)" }) -- make the window smaller vertically
map("n", "+", [[<cmd>horizontal resize +2<cr>]], { desc = "Make window taller (vertically)" })   -- make the window bigger horizontally by pressing shift and =
map("n", "_", [[<cmd>horizontal resize -2<cr>]], { desc = "Make window shorter (vertically)" })  -- make the window smaller horizontally by pressing shift and -

-- Tabs
map("n", "<leader>tt", ":tabnew<CR>")
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")

-- Copy+paste from/to system clip board
map("v", "<leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

-- Paste without yanking in visual mode
map("x", "p", "P")

-- Close all buffers
map("n", "<leader>bda", ":%bd<CR>", { desc = "Close all buffers" })

-- todo-comment plugin
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>", { desc = "Toggle Comment" })
vim.keymap.set("v", "<leader>/", ":CommentToggle<CR>", { desc = "Toggle Comment" })

map("n", "<leader>m", ":Format<CR>", { desc = "Format file" })
map("v", "<leader>m", ":Format<CR>", { desc = "Format file" })

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })
