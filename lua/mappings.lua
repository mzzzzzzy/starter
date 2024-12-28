local map = vim.keymap.set

map({ "i", "n" }, "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map({ "i", "n" }, "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<leader>w", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-a>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit" })
map("n", "<leader>n", "<cmd>enew <CR>", { desc = "New File" })
map("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "AerialToggle" })
map("n", "s", "<cmd>HopChar1<cr>", { desc = "Search Char" })
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find File" })

map("n", "K", "<cmd> lua vim.lsp.buf.hover()<cr>", { desc = "LSP Hover" })
map("n", "S", "<cmd>HopWord<cr>", { desc = "Search Word" })

map("n", "[d", function()
  vim.diagnostic.goto_prev { float = { border = "rounded" } }
end, { desc = "Goto prev" })
map("n", "]d", function()
  vim.diagnostic.goto_next { float = { border = "rounded" } }
end, { desc = "Goto next" })

map("n", "[g", function()
  if vim.wo.diff then
    return "[g"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to prev hunk" })
map("n", "]g", function()
  if vim.wo.diff then
    return "]g"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk" })

map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

map("n", "<leader>c", "", { desc = "nvcheat help" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>l", "", { desc = "LSP" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>lD", "<cmd> Telescope diagnostics <cr>", { desc = "Workspace Diagnostics" })
map("n", "<leader>lI", "<cmd>LspInfo<cr>", { desc = "Info" })
map("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "Restart" })
map(
  "n",
  "<leader>lS",
  "<cmd> Telescope lsp_dynamic_workspace_symbols symbol_width=0.9<cr>",
  { desc = "Workspace Symbols" }
)
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "<leader>ld", "<cmd> Telescope diagnostics bufnr=0 theme=dropdown<cr>", { desc = "Document Diagnostics" })
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format() <cr>", { desc = "Format" })
map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
map("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", { desc = "Quickfix" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
map("n", "<leader>ls", "<cmd> Telescope lsp_document_symbols symbol_width=0.9<cr>", { desc = "Document Symbols" })
map("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add Wrokspace Folder" })
map("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", { desc = "Remove Wrokspace Folder" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "LSP Definition" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "LSP Implementations" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "LSP References" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
-- map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

-- git
map("n", "<leader>g", "", { desc = "Git" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

map("n", "<leader>t", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

map("n", "<leader>s", "", { desc = "Search" })
map("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
map("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man pages" })
map("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers" })
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>sm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
map("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>ss", "<cmd>Telescope live_grep<cr>", { desc = "Search" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
-- map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
--
-- map("n", "<leader>wk", function()
--   vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
-- end, { desc = "whichkey query lookup" })
