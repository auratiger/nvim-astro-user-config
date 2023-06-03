-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "astro",
        "bashls",
        "cssls",
        "cssmodules_ls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "gradle_ls",
        "graphql",
        "html",
        "jdtls",
        "jsonls",
        "kotlin_language_server",
        "pyright",
        "tailwindcss",
        "tsserver",
        "vimls",
        "yamlls",
        "groovyls",
        "marksman",
        "prosemd_lsp",
        "remark_ls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- Bash
        "beutysh",
        -- Python
        -- "pylint",
        "autopep8",
        -- Rust
        "rustfmt",
        -- Git
        "gitlint",
        -- Lua
        "stylua",
        "luacheck",
        -- Other
        "prettier",
        "prettierd",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "python",
      })
    end,
  },
}
