local overrides = require "configs.overrides"

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "mhartington/formatter.nvim",
        config = function()
          require "configs.formatter"
        end,
      },
      {
        "mfussenegger/nvim-lint",
        config = function()
          require "configs.nvim-lint"
        end,
      },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup {
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 5000,
        top_down = false,
      }
      --      vim.notify = require "notify"
    end,
  },

  -- Neovim plugin for a code outline window
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- A completion plugin for neovim coded in Lua
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
            show_prediction_strength = true,
          }
        end,
      },
      {
        "Exafunction/codeium.nvim",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "configs.indent-blankline"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = true,
    event = "VimEnter",
    keys = {},
    config = function()
      require "configs.whichkey"
    end,
  },

  {
    "echasnovski/mini.icons",
    version = "*",
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          require("telescope").load_extension "ui-select"
        end,
      },
    },
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup {}
    end,
    event = "BufWinEnter",
  },
  {
    "phaazon/hop.nvim",
    cmd = { "HopChar1", "HopWord" },
    config = function()
      require("hop").setup()
    end,
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    config = function()
      require("custom.configs.dap").setup()
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
        config = function()
          require("custom.configs.dapui").setup()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("custom.configs.dapvirtualtext").setup()
        end,
      },
    },
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },
  { "mg979/vim-visual-multi" },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
  },
  {
    "akinsho/toggleterm.nvim",
    config = true,
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    config = function()
      require("auto-dark-mode").setup {
        update_interval = 1000,
        set_dark_mode = function()
          vim.g.nvchad_theme = "gruvbox"
          vim.g.transparency = false
          require("nvchad.utils").replace_word('theme = "gruvbox_light"', 'theme = "gruvbox"')
          require("base46").load_all_highlights()
        end,
        set_light_mode = function()
          vim.g.nvchad_theme = "gruvbox_light"
          require("nvchad.utils").replace_word('theme = "gruvbox"', 'theme = "gruvbox_light"')
          vim.g.transparency = true
          require("base46").load_all_highlights()
        end,
      }
    end,
  },
}
