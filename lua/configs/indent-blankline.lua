return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufRead", -- 或者根据需要调整加载时机
  config = function()
    -- 插件配置
    require("indent_blankline").setup {
      char = "│", -- 显示缩进字符
      char_highlight = "IndentBlanklineChar", -- 设置缩进字符的高亮
      show_trailing_blankline_indent = false, -- 不显示尾部空白行的缩进线
      show_first_indent_level = true, -- 显示第一层缩进
      filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
        "NvimTree",
        "packer",
        "lua",
        "gitcommit",
      }, -- 排除某些文件类型
      use_treesitter = true, -- 使用 Treesitter 支持更好的缩进处理
      context_highlight_list = { "IndentBlanklineContextChar" }, -- 高亮当前缩进级别
    }
  end,
}
