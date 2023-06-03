return {
   -- You can also add new plugins here as well:
   -- Add plugins, the lazy syntax
   -- "andweeb/presence.nvim",
   -- {
   --   "ray-x/lsp_signature.nvim",
   --   event = "BufRead",
   --   config = function()
   --     require("lsp_signature").setup()
   --   end,
   -- },
   "ziontee113/syntax-tree-surfer",
   {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function()
         require("lsp_signature").on_attach {
            hint_enable = true, -- virtual hint enable
            hint_prefix = "<<<>>>", --  NOTE: for the terminal not support emoji, might crash
            hint_scheme = "String",
         }
      end,
   },
   {
      "max397574/better-escape.nvim",
      config = function() require("better_escape").setup() end,
   },
   {
      "NvChad/nvim-colorizer.lua",
      config = function()
         require("colorizer").setup {
            filetypes = { "css", "scss", "html", "typescript", "javascript", "lua" },
            user_default_options = {
               RGB = true,     -- #RGB hex codes
               RRGGBB = true,  -- #RRGGBB hex codes
               names = true,   -- "Name" codes like Blue or blue
               RRGGBBAA = false, -- #RRGGBBAA hex codes
               AARRGGBB = false, -- 0xAARRGGBB hex codes
               rgb_fn = false, -- CSS rgb() and rgba() functions
               hsl_fn = false, -- CSS hsl() and hsla() functions
               css = false,    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
               css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
               -- Available modes for `mode`: foreground, background,  virtualtext
               mode = "foreground", -- Set the display mode.
               -- Available methods are false / true / "normal" / "lsp" / "both"
               -- True is same as normal
               tailwind = true,                         -- Enable tailwind colors
               -- parsers can contain values used in |user_default_options|
               sass = { enable = false, parsers = { css } }, -- Enable sass colors
               virtualtext = "■",
            },
         }
      end,
   },
   -- {
   --    "editorconfig/editorconfig-vim",
   --    config = function()
   --       vim.cmd [[ let g:EditorConfig_exclude_patterns = ['fugitive://.*'] ]]
   --    end,
   -- },
   {
      "p00f/nvim-ts-rainbow",
   },
   {
      "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup() end,
   },
   {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
         -- TODO:
         -- FIX:
         -- HACK:
         -- PERF:
         -- WARN:
         -- NOTE:
         -- TEST:
         require("todo-comments").setup()
      end,
   },
   {
      "antosha417/nvim-lsp-file-operations",
      requires = {
         { "nvim-lua/plenary.nvim" },
         { "kyazdani42/nvim-tree.lua" },
      },
      config = function() require("lsp-file-operations").setup() end,
   },
   {
      "nvim-lua/plenary.nvim",
   },
   {
      "nvim-lua/popup.nvim",
   },
   {
      "ThePrimeagen/harpoon",
      requires = {
         { "nvim-lua/plenary.nvim" },
         { "nvim-lua/popup.nvim" },
      },
      config = function() require("harpoon").setup() end,
   },
   {
      "tpope/vim-surround",
      keys = { "c", "d", "y" },
      -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
      -- setup = function()
      --  vim.o.timeoutlen = 500
      -- end
   },
   {
      "tpope/vim-repeat",
   },
   {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      run = ":call mkdp#util#install()",
      config = function() vim.g.mkdp_auto_start = 1 end,
   },
   {
      "phaazon/hop.nvim",
      branch = "v2", -- optional but strongly recommended
      event = "BufRead",
      config = function() require("hop").setup() end,
   },
   {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
         require("spectre").setup {
            mapping = {
               ["run_replace"] = {
                  map = "<leader>ra",
                  cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                  desc = "replace all",
               },
               ["show_option_menu"] = {
                  map = "<leader>rb",
                  cmd = "<cmd>lua require('spectre').show_options()<CR>",
                  desc = "show option",
               },
            },
         }
      end,
   },
}
