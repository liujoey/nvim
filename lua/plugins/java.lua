return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "java" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "jdtls" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "javadbg", "javatest" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "jdtls", "java-debug-adapter", "java-test" })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = "Lspsaga",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["]d"] = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic" }
          maps.n["[d"] = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic" }
        end,
      },
      {
        "AstroNvim/astrolsp",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["K"] = { "<Cmd>Lspsaga hover_doc<CR>", desc = "Hover symbol details", cond = "textDocument/hover" }

          -- call hierarchy
          maps.n["<Leader>lc"] =
          { "<Cmd>Lspsaga incoming_calls<CR>", desc = "Incoming calls", cond = "callHierarchy/incomingCalls" }
          maps.n["<Leader>lC"] =
          { "<Cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing calls", cond = "callHierarchy/outgoingCalls" }

          -- code action
          maps.n["<Leader>la"] =
          { "<Cmd>Lspsaga code_action<CR>", desc = "LSP code action", cond = "textDocument/codeAction" }
          maps.x["<Leader>la"] =
          { ":<C-U>Lspsaga code_action<CR>", desc = "LSP code action", cond = "textDocument/codeAction" }

          -- definition
          maps.n["<Leader>lp"] =
          { "<Cmd>Lspsaga peek_definition<CR>", desc = "Peek definition", cond = "textDocument/definition" }

          -- references
          maps.n["<Leader>lR"] = {
            "<Cmd>Lspsaga finder<CR>",
            desc = "Search references",
            cond = function(client)
              return client.supports_method "textDocument/references"
                or client.supports_method "textDocument/implementation"
            end,
          }

          -- rename
          maps.n["<Leader>lr"] =
          { "<Cmd>Lspsaga rename<CR>", desc = "Rename current symbol", cond = "textDocument/rename" }
        end,
      },
    },
    opts = function()
      local astroui = require "astroui"
      local get_icon = function(icon) return astroui.get_icon(icon, 0, true) end
      return {
        code_action = { extend_gitsigns = require("astrocore").is_available "gitsigns.nvim" },
        lightbulb = { enable = false },
        callhierarchy = {
          keys = {
            toggle_or_req = 'o',
          },
        },
        typeheirarchy = {
          keys = {
            toggle_or_req = 'o',
          },
        },
        rename = {
          keys = {
            quit = '<C-c>',
          },
        },
        ui = {
          code_action = get_icon "DiagnosticHint",
          expand = get_icon "FoldClosed",
          collapse = get_icon "FoldOpened",
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          handlers = { jdtls = false },
          features = { signature_help = true },
          mappings = {
            n = {
              ["<leader>lo"] = {
                function() require'jdtls'.organize_imports() end,
                desc = "Organize Imports"
              },
            },
          },
        },
      },
    },
    opts = function(_, opts)
      local utils = require "astrocore"
      -- use this function notation to build some variables
      local root_markers = { ".git", "mvnw", "gradlew", "build.gradle" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      vim.fn.mkdir(workspace_dir, "p")

      -- validate operating system
      if not (vim.fn.has "mac" == 1 or vim.fn.has "unix" == 1 or vim.fn.has "win32" == 1) then
        utils.notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
      end

      return utils.extend_tbl({
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          -- "-javaagent:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
          "-Xms512m",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.expand "$MASON/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
          "-configuration",
          vim.fn.expand "$MASON/share/jdtls/config",
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {
            eclipse = { downloadSources = true },
            configuration = { updateBuildConfiguration = "interactive" },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = false },
            referencesCodeLens = { enabled = false },
            -- inlayHints = { parameterNames = { enabled = "all" } },
            signatureHelp = { enabled = true },
            completion = {
              importOrder = {
                "#",
                "java",
                "javax",
                "oracle.kv",
                "oracle.nosql",
                "com",
                "org",
              },
              favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
          },
        },
        init_options = {
          bundles = {
            vim.fn.expand "$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
            -- unpack remaining bundles
            (table.unpack or unpack)(vim.split(vim.fn.glob "$MASON/share/java-test/*.jar", "\n", {})),
          },
        },
        handlers = {
          ["$/progress"] = function() end, -- disable progress updates.
        },
        filetypes = { "java" },
        on_attach = function(...)
          require("jdtls").setup_dap { hotcodereplace = "auto" }
          local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
          if astrolsp_avail then astrolsp.on_attach(...) end
        end,
      }, opts)
    end,
    config = function(_, opts)
      -- setup autocmd on filetype detect java
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "java", -- autocmd to start jdtls
        callback = function()
          if opts.root_dir and opts.root_dir ~= "" then
            require("jdtls").start_or_attach(opts)
          else
            require("astrocore").notify("jdtls: root_dir not found. Please specify a root marker", vim.log.levels.ERROR)
          end
        end,
      })
      -- create autocmd to load main class configs on LspAttach.
      -- This ensures that the LSP is fully attached.
      -- See https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration
    end,
  },
}
