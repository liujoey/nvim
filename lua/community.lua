-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- lsp
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },

  -- git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.blame-nvim" },

  -- UI
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },

  -- motion
  { import = "astrocommunity.motion.before-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.tabout-nvim" },
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.motion.harpoon" },

  -- programming language
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.java" },

  -- note taking
  { import = "astrocommunity.note-taking.neorg" },
}
