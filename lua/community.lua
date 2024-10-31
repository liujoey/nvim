-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- colorscheme
  { import = "astrocommunity.colorscheme.rose-pine" },

  -- git
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.blame-nvim" },

  -- UI
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },

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
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.lua" },

  -- note taking
  { import = "astrocommunity.note-taking.neorg" },

  -- terminal
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
}
