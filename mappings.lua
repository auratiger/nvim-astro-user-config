-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("", "<C-Z>", "ZZ", opts) -- Force Exit

keymap("", "S", [[<Cmd>HopWord<CR>]], { silent = true })

return {
  -- first key is the mode
  n = {
    -- ====================== CONTROL KEYS ======================
    ["<C-d>"] = { "<C-d>zz", desc = "center on move down" },
    ["<C-u>"] = { "<C-u>zz", desc = "center on move up" },
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

    -- ====================== BASE KEYS ======================

    ["n"] = { "nzzzv", desc = "center on next match" },
    ["N"] = { "Nzzzv", desc = "center on previous match" },
    ["J"] = { "mzJ`z" },
    ["x"] = { '"xx', desc = "Character delete uses specific register" },
    -- ["p"] = { '"_dP', desc = "This setting makes it so pasting over selected text doesn't override the top register" },
    ["Q"] = { "@q", desc = "Run macro bound to q with Q" },

    ["y"] = { '"+y', desc = "Yank and paste to clipboard" },
    ["Y"] = { '"+y$', desc = "Yank and paste to clipboard" },
    ["p"] = { '"+p', desc = "Yank and paste to clipboard" },
    ["P"] = { '"+P', desc = "Yank and paste to clipboard" },

    ["ge"] = {
      "<cmd>lua vim.diagnostic.goto_next({float = {border = 'rounded', focusable = false, source = 'always'}, severity = {min = vim.diagnostic.severity.ERROR}})<cr>",
      desc = "Go to next error",
    },
    ["gE"] = {
      "<cmd>lua vim.diagnostic.goto_prev({float = {border = 'rounded', focusable = false, source = 'always'}, severity = {min = vim.diagnostic.severity.ERROR}})<cr>",
      desc = "Go to prev error",
    },

    ["zn"] = { "zj" },
    ["zN"] = { "zk" },
    ["zj"] = { "zo", desc = "close fold under cursor" },
    ["zk"] = { "zc", desc = "open fold under cursor" },
    ["zJ"] = { "zR", desc = "close all folds under cursor" },
    ["zK"] = { "zM", desc = "open all folds under cursor" },

    ["s"] = { ":HopChar2<cr>", desc = "Hop 1 Char Current Line" },

    -- Navigate merge conflict markers
    ["]n"] = { "[[:call search('^(@@ .* @@|[<=>|]{7}[<=>|]@!)', 'W')<cr>]]", desc = "next merge conflict" },
    ["[n"] = { "[[:call search('^(@@ .* @@|[<=>|]{7}[<=>|]@!)', 'bW')<cr>]]", desc = "prev merge conflict" },

    -- ====================== LEADER KEYS ======================

    ["<leader>h"] = { ":nohlsearch<cr>", desc = "No highlight" },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },

    ["<leader>ur"] = {
      ":set relativenumber!<CR>",
      desc = "Toggle relativenumber",
    },

    -- Harpoon
    ["<leader>a"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = " Add Mark" },
    ["<leader><leader>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon" },
    ["<leader>1"] = { "<CMD>lua require('harpoon.ui').nav_file(1)<CR>", desc = "goto1" },
    ["<leader>2"] = { "<CMD>lua require('harpoon.ui').nav_file(2)<CR>", desc = "goto2" },
    ["<leader>3"] = { "<CMD>lua require('harpoon.ui').nav_file(3)<CR>", desc = "goto3" },
    ["<leader>4"] = { "<CMD>lua require('harpoon.ui').nav_file(4)<CR>", desc = "goto4" },

    ["<leader>r"] = { name = "Replace" },
    ["<leader>ro"] = { function() require("spectre").open() end, desc = "Replace in project" },
    ["<leader>rw"] = {
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Replace word",
    },
    ["<leader>rf"] = { function() require("spectre").open_file_search() end, desc = "Replace in file" },

    -- ====================== FUNCTION KEYS ======================

    ["<F9>"] = {
      ":MarkdownPreviewToggle<CR>",
      desc = "Toggle Markdonw Preview",
    },

    -- ====================== UNMAPPED ======================

    ["<leader>o"] = false,
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv" },
    J = {
      function() require("syntax-tree-surfer").surf("next", "visual") end,
      desc = "Next",
    },
    K = {
      function() require("syntax-tree-surfer").surf("prev", "visual") end,
      desc = "Prev",
    },
    H = {
      function() require("syntax-tree-surfer").surf("parent", "visual") end,
      desc = "Parent",
    },
    L = {
      function() require("syntax-tree-surfer").surf("child", "visual") end,
      desc = "Child",
    },
    ["<C-j>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
      desc = "Swap Next",
    },
    ["<C-k>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
      desc = "Swap Prev",
    },

    [">"] = { ">gv", desc = "Don't leave visual mode" },
    ["<"] = { "<gv", desc = "Don't leave visual mode" },
  },
}
