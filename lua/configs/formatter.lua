vim.cmd [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]]

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = false,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,
    },
    go = {
      require("formatter.filetypes.go").goimports,
      {
        exe = "golines",
        stdin = true,
        args = {
          "-m",
          "80",
        },
      },
    },
    graphql = {
      require("formatter.filetypes.graphql").prettierd,
    },
    json = {
      require("formatter.filetypes.json").prettierd,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettierd,
    },
    vue = {
      require("formatter.filetypes.vue").prettier,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}
