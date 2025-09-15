return {
  -- File management and navigation
  {
    "tpope/vim-vinegar",
    event = "VeryLazy"
  },

  -- Syntax and language support
  {
    "lumiliet/vim-twig",
    ft = "twig"
  },
  {
    "isruslan/vim-es6",
    ft = {"javascript", "js"}
  },
  {
    "xsbeats/vim-blade",
    ft = "blade"
  },
  {
    "StanAngeloff/php.vim",
    ft = "php"
  },
  {
    "posva/vim-vue",
    ft = "vue"
  },
  {
    "leafgarland/typescript-vim",
    ft = {"typescript", "ts"}
  },

  -- UI and appearance
  {
    "vim-airline/vim-airline",
    dependencies = { "vim-airline/vim-airline-themes" },
    config = function()
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
      vim.g["airline#extensions#tabline#left_sep"] = "||"
      vim.g["airline#extensions#tabline#left_alt_sep"] = "||"
      vim.g.airline_theme = "papercolor"
      vim.g.airline_powerline_fonts = 1
      vim.g.Powerline_symbols = "fancy"
    end
  },
  {
    "vim-airline/vim-airline-themes",
    lazy = true
  },
  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
    priority = 1000
  },
  {
    "altercation/vim-colors-solarized",
    lazy = true
  },
  {
    "sonph/onehalf",
    config = function()
      vim.cmd("colorscheme onehalflight")
      vim.g.airline_theme = "onehalfdark"
    end,
    lazy = false,
    priority = 1000
  },

  -- Code quality and formatting
  {
    "bronson/vim-trailing-whitespace",
    event = "VeryLazy"
  },
  {
    "nathanaelkane/vim-indent-guides",
    event = "VeryLazy"
  },
  {
    "w0rp/ale",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.ale_lint_on_save = 1
      vim.g.ale_pattern_options = {
        ["\\.LeaseApplicationController\\.php$"] = {
          ale_linters = {},
          ale_fixers = {}
        }
      }
    end
  },
  {
    "stephpy/vim-php-cs-fixer",
    ft = "php"
  },

  -- File and buffer navigation
  {
    "scrooloose/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle" },
    keys = {
      { "<C-b>", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" }
    },
    config = function()
      vim.g.nerdtree_tabs_open_on_console_startup = 0
    end
  },
  {
    "junegunn/fzf.vim",
    dependencies = {
      {
        "junegunn/fzf",
        build = function()
          vim.fn["fzf#install"]()
        end
      }
    },
    event = "VeryLazy",
    keys = {
      { "<C-p>", ":Files<CR>", desc = "Find files" },
      { "<C-t>", ":Tags<CR>", desc = "Find tags" },
      { "<C-o>", ":BTags<CR>", desc = "Buffer tags" }
    }
  },

  -- Code navigation and tags
  {
    "majutsushi/tagbar",
    cmd = { "TagbarToggle", "TagbarOpenAutoClose" },
    keys = {
      { "<leader>to", ":TagbarOpenAutoClose<CR>", desc = "Tagbar open auto close" },
      { "<leader>tt", ":TagbarToggle<CR>", desc = "Toggle tagbar" }
    }
  },

  -- Text manipulation
  {
    "godlygeek/tabular",
    cmd = "Tabularize"
  },
  {
    "scrooloose/nerdcommenter",
    event = "VeryLazy"
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy"
  },

  -- Completion and snippets
  {
    "ervandew/supertab",
    event = "InsertEnter"
  },

  -- AI assistance
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      -- Copilot configuration can go here
    end
  },
  {
    "danbradbury/copilot-chat.vim",
    dependencies = { "github/copilot.vim" },
    event = "VeryLazy"
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim"
    },
    config = function()
      require("codecompanion").setup()
    end,
    event = "VeryLazy"
  },

  -- Search and replace
  {
    "rking/ag.vim",
    cmd = "Ag",
    config = function()
      vim.g.ag_working_path_mode = "r"
    end
  },
  {
    "skwp/greplace.vim",
    cmd = { "Gsearch", "Greplace" }
  },

  -- Utility dependencies
  {
    "MarcWeber/vim-addon-mw-utils",
    lazy = true
  },
  {
    "tomtom/tlib_vim",
    lazy = true
  },

  -- PHP specific tools
  {
    "arnaud-lb/vim-php-namespace",
    ft = "php",
    keys = {
      { "<leader>n", function() vim.cmd("call PhpInsertUse()") end, mode = { "n", "i" }, ft = "php", desc = "Insert PHP use statement" }
    }
  },
  {
    "tobyS/vmustache",
    lazy = true
  },
  {
    "tobyS/pdv",
    ft = "php",
    dependencies = { "tobyS/vmustache" },
    keys = {
      { "<leader>d", function() vim.cmd("call pdv#DocumentWithSnip()") end, ft = "php", desc = "Generate PHP docblock" }
    },
    config = function()
      vim.g.pdv_template_dir = vim.fn.expand("~/.config/nvim/bundle/pdv/templates_snip")
    end
  },

  -- Web development
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "vue", "blade" },
    config = function()
      vim.g.user_emmet_leader_key = "<leader>e"
    end
  },

  -- Core Neovim enhancements
  {
    "nvim-lua/plenary.nvim",
    lazy = true
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "php", "javascript", "typescript", "vue", "html", "css", "lua", "vim" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true
  },
  {
    "stevearc/dressing.nvim",
    lazy = true
  }
}