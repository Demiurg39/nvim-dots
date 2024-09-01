-- local keymap = vim.keymap.set

local M = {}

-- M.on_attach = function(_, bufnr)
--   local opts = function (desc)
--     return {desc = "LSP: " .. desc, buffer = bufnr}
--   end
--
--
-- 	if client.name == "pyright" then
-- 		keymap("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts("organize imports"))
-- 	end
-- end
--
-- return M

M.on_attach = function(_, bufnr)
    local map = vim.keymap.set
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP: " .. desc }
    end

    -- map("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts "go to definition")
    -- map("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts "peak definition")
    -- map("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts "go to definition")
    -- map("n", "<leader>gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", opts "go to definition")
    map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts "see available code actions")
    -- map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts "smart rename")
    -- map("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts "show  diagnostics for line")
    -- map("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts "show diagnostics for cursor")
    -- map("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts "jump to prev diagnostic in buffer")
    -- map("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts "jump to next diagnostic in buffer")
    -- map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts "show documentation for what is under cursor")

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    -- map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "List workspace folders")

    map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

    map("n", "<leader>ra", function()
        require "nvchad.lsp.renamer"()
    end, opts "NvRenamer")

    -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
    map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

return M
