-- n, v, i, t = mode names

local Util = require("core.utils")
local M = {}

M.general = {
  i = {
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },

    -- move lines
    ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi" },
    ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi" },

    -- Add undo break-points
    [","] = { ",<c-g>u" },
    ["."] = { ".<c-g>u" },
    [";"] = { ";<c-g>u" },
  },
  n = {
    ["<leader>`"] = { "<cmd>e #<cr>", "Switch to Other Buffer" },

    ["<BS>"] = { ":noh <CR>", "clear highlights" },
    ["<Up>"] = { ":tabprev<CR>" },
    ["<Down>"] = { ":tabnext<CR>" },
    ["H"] = {"^"},
    ["L"] = {"$"},
    ["<tab>"] = {"%"},

    -- resize windows
    ["<C-Up>"] = { "<cmd>resize +2<cr>"},
    ["<C-Down>"] = { "<cmd>resize -2<cr>"},
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>"},
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>"},

    -- move lines
    ["<A-j>"] = { "<cmd>m .+1<cr>==" },
    ["<A-k>"] = { "<cmd>m .-2<cr>==" },

    ["n"] = { "'Nn'[v:searchforward]", "Next search result", opts = { expr = true } },
    ["N"] = { "'nN'[v:searchforward]", "Prev search result", opts = { expr = true } },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "window left" },
    ["<C-l>"] = { "<C-w>l", "window right" },
    ["<C-j>"] = { "<C-w>j", "window down" },
    ["<C-k>"] = { "<C-w>k", "window up" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },

    ["<leader>hc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" },
  },

  v = {
    ["H"] = {"^"},
    ["L"] = {"$"},
    ["<tab>"] = {"%"},
    -- move lines
    ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv" },

    -- better indenting
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  },
  o = {
    ["H"] = {"^"},
    ["L"] = {"$"},
    ["<tab>"] = {"%"},
    ["n"] = { "'Nn'[v:searchforward]", "Next search result", opts = { expr = true } },
    ["N"] = { "'nN'[v:searchforward]", "Prev search result", opts = { expr = true } },
  },
  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "dont copy replaced text", opts = { silent = true } },
    ["n"] = { "'Nn'[v:searchforward]", "Next search result", opts = { expr = true } },
    ["N"] = { "'nN'[v:searchforward]", "Prev search result", opts = { expr = true } },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    ["<Left>"] = { function ()
      require("nvchad_ui.tabufline").tabuflinePrev()
    end, "Previous Buffer" },
    ["<Right>"] = { function ()
      require("nvchad_ui.tabufline").tabuflineNext()
    end, "Next Buffer" },
    -- cycle through buffers
    -- close buffer + hide terminal buffer
    ["Q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gI"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>cr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>xf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle Nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader><space>"] = { Util.telescope("files"), "Find Files (root dir)" },
    ["<leader>,"] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
    ["<leader>/"] = { Util.telescope("live_grep"), "Find in Files (Grep)" },
    ["<leader>:"] = { "<cmd>Telescope command_history<cr>", "Command History" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>b/"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },

    ["<leader>hh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    -- search
    ["<leader>sc"] = { "<cmd>Telescope commands<cr>", "Commands" },
    ["<leader>sd"] = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    ["<leader>sw"] = { Util.telescope("grep_string"), "Word (root dir)" },
    ["<leader>ss"] = {
      Util.telescope("lsp_document_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      "Goto Symbol",
    },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>ut"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>uC"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.cmd [[normal! m']]
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current_context",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>ph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

return M
