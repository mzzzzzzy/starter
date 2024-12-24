local wk = require "which-key"

-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new {
--   cmd = "lazygit",
--   hidden = true,
--   direction = "float",
--   float_opts = {
--     border = "double",
--   },
-- }
--
-- function _lazygit_toggle()
--   lazygit:toggle()
-- end
--
-- function _float_console()
--   require("dapui").float_element(
--     "console",
--     { position = "center", height = math.floor(vim.o.lines * 0.9), width = math.floor(vim.o.columns * 0.8) }
--   )
-- end

wk.add {
  { "K", "<cmd> lua vim.lsp.buf.hover()<cr>", desc = "LSP Hover" },
  { "S", "<cmd>HopWord<cr>", desc = "Search Word" },
  {
    "[d",
    function()
      vim.diagnostic.goto_prev { float = { border = "rounded" } }
    end,
    desc = "Goto prev",
  },
  {
    "[g",
    function()
      if vim.wo.diff then
        return "[g"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
    desc = "Jump to prev hunk",
  },
  {
    "]d",
    function()
      vim.diagnostic.goto_next { float = { border = "rounded" } }
    end,
    desc = "Goto next",
  },
  {
    "]g",
    function()
      if vim.wo.diff then
        return "]g"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    desc = "Jump to next hunk",
  },
  { "gd", "<cmd> Telescope lsp_definitions<cr>", desc = "LSP Definition" },
  { "gi", "<cmd> Telescope lsp_implementations<cr>", desc = "LSP Implementations" },
  { "gr", "<cmd> Telescope lsp_references<cr>", desc = "LSP References" },
  { "<leader>L", "<cmd>Lazy<CR>", desc = "Lazy" },
  { "<leader>T", group = "Treesitter" },
  { "<leader>Ti", ":TSConfigInfo<cr>", desc = "Info" },
  { "<leader>a", "<cmd> %y+ <CR>", desc = "Copy whole file" },
  { "<leader>b", group = "Buffers" },
  { "<leader>bD", "<cmd>BufferOrderByDirectory<cr>", desc = "Sort by directory" },
  { "<leader>bL", "<cmd>BufferOrderByLanguage<cr>", desc = "Sort by language" },
  { "<leader>bb", "<cmd>b#<cr>", desc = "Previous" },
  { "<leader>be", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close all but current" },
  { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
  { "<leader>bh", "<cmd>BufferCloseBuffersLeft<cr>", desc = "Close all to the left" },
  { "<leader>bj", "<cmd>BufferPick<cr>", desc = "Jump" },
  { "<leader>bl", "<cmd>BufferCloseBuffersRight<cr>", desc = "Close all to the right" },
  { "<leader>bw", "<cmd>BufferWipeout<cr>", desc = "Wipeout" },
  { "<leader>c", group = "ChatGPT" },
  { "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
  { "<leader>d", group = "Debug" },
  { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
  { "<leader>dQ", "<cmd>lua require'dap'.terminate()<cr>", desc = "Quit" },
  { "<leader>dR", "<cmd>lua require'dap'.restart()<cr>", desc = "Restart" },
  { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
  { "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Eval" },
  { "<leader>dg", "<cmd>lua require'dapui'.toggle()<cr>", desc = "UI Toggle" },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
  { "<leader>dl", "<cmd>lua _float_console()<cr>", desc = "Float Console" },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
  { "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause" },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle({height=1})<cr>", desc = "Toggle Repl" },
  { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
  { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
  { "<leader>e", "<cmd> NvimTreeToggle <CR>", desc = "toggle nvimtree" },
  { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>g", group = "Git" },
  { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
  { "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>", desc = "Git" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>l", group = "LSP" },
  { "<leader>lD", "<cmd> Telescope diagnostics <cr>", desc = "Workspace Diagnostics" },
  { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart" },
  { "<leader>lS", "<cmd> Telescope lsp_dynamic_workspace_symbols symbol_width=0.9<cr>", desc = "Workspace Symbols" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>ld", "<cmd> Telescope diagnostics bufnr=0 theme=dropdown<cr>", desc = "Document Diagnostics" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format() <cr>", desc = "Format" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
  { "<leader>lr", "<cmd>lua require 'nvchad.renamer'.open()<cr>", desc = "Rename" },
  { "<leader>ls", "<cmd> Telescope lsp_document_symbols symbol_width=0.9<cr>", desc = "Document Symbols" },
  { "<leader>lw", group = "Workspace" },
  { "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", desc = "Add Wrokspace Folder" },
  { "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", desc = "Remove Wrokspace Folder" },
  { "<leader>n", "<cmd>enew <CR>", desc = "New File" },
  { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "AerialToggle" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Exit" },
  { "<leader>s", group = "Search" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Bookmarks" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Text" },
  { "<leader>st", "<cmd>Telescope themes enable_preview=true<cr>", desc = "Theme" },
  { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
  { "<leader>t", group = "Toggle" },
  { "<leader>tn", "<cmd> set nu! <CR>", desc = "toggle line number" },
  { "<leader>tr", "<cmd> set rnu! <CR>", desc = "toggle relative number" },
  { "<leader>tt", "<cmd> lua require('base46').toggle_theme() <CR>", desc = "toggle theme" },
  { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "UndotreeToggle" },
  { "<leader>w", "<cmd>w<CR>", desc = "Save File" },
  {
    mode = { "n", "v" },
    { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "添加测试" },
    { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "文档" },
    { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "编辑并添加说明" },
    { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "修复Bug" },
    { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "语法纠正" },
    { "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "提取关键词" },
    { "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis lang=中文 <CR>", desc = "Code Readability Analysis" },
    { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "优化代码" },
    { "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "总结" },
    { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "翻译" },
    { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "解释代码" },
  },
  { "s", "<cmd>HopChar1<cr>", desc = "Search Char" },
}
