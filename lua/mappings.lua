local map = vim.keymap.set
local tabline = require "nvchad.tabufline"
local term = require "nvchad.term"
local cmds = {
    lazygit = { pos = "float", cmd = "lazygit", size = 1, id = "lazygit term" },
    reg_term = { pos = "float", size = 0.7, id = "regular term" },
}

local function opts(desc)
    return { desc = desc, noremap = true, silent = true }
end

-- Mappings

-- Normal mode

map("n", ";", ":", opts "CMD enter command mode")

map("n", "<C>", "ESC", opts "switch window up")

map("n", "<C-h>", "<C-w>h", opts "switch window left")
map("n", "<C-l>", "<C-w>l", opts "switch window right")
map("n", "<C-j>", "<C-w>j", opts "switch window down")
map("n", "<C-k>", "<C-w>k", opts "switch window up")

map("n", "<leader>sv", "<cmd>vsplit<CR>", opts "window: split vertically")
map("n", "<leader>sh", "<cmd>split<CR>", opts "window: split horizontally")
map("n", "<leader>sx", "<cmd>close<CR>", opts "window: close split")

-- tabufline
map("n", "<A-o>", function()
    tabline.next()
end, opts "buffer: next buffer")
map("n", "<A-i>", function()
    tabline.prev()
end, opts "buffer: previous buffer")
map("n", "<A-q>", "<cmd>bdelete<CR>", opts "buffer: close buffer")

map("n", "<Esc>", "<cmd>noh<CR>", opts "General Clear highlights")

map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", opts "Toggle nvcheatsheet")

map("n", "<leader>lf", function()
    require("conform").format { lsp_fallback = true }
end, opts "General Format file")

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, opts "LSP Diagnostic loclist")

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts "nvim-tree: toggle window")

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts "telescope find files")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts "telescope live grep")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts "telescope find buffers")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts "telescope help page")
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", opts "telescope find marks")
map("n", "<leader>fe", "<cmd>Telescope oldfiles<CR>", opts "telescope find oldfiles")
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts "telescope find in current buffer")
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", opts "telescope git commits")
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts "telescope git status")
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", opts "telescope pick hidden term")
map("n", "<leader>fc", "<cmd>Telescope themes<CR>", opts "telescope nvchad themes")
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    opts "telescope find all files"
)

-- debugging
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts "debug: Toggle DAP Breakpoint")
map("n", "<leader>ds", "<cmd>DapContinue<CR>", opts "debug: Start or continue DAP")
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", opts "debug: Toggle DAP UI")

-- terminal
map({ "n", "t" }, "<A-t>", function()
    term.toggle(cmds.reg_term)
end, opts "terminal: toggleable float terminal")

map({ "n", "t" }, "<leader>tg", function()
    term.toggle(cmds.lazygit)
end, opts "terminal: toggleable lazygit terminal")

-- Insert mode

map("i", "<C-b>", "<ESC>^i", opts "move beginning of line")
map("i", "<C-e>", "<End>", opts "move end of line")
map("i", "<C-h>", "<Left>", opts "move left")
map("i", "<C-l>", "<Right>", opts "move right")
map("i", "<C-j>", "<Down>", opts "move down")
map("i", "<C-k>", "<Up>", opts "move up")

-- Visual mode

map("v", "<", "<gv", opts "indent: increment")
map("v", ">", ">gv", opts "indent: decrement")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts "move line down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts "move line up")
