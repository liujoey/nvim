return {
  -- Packer can manage itself as an optional plugin
  { 'wbthomason/packer.nvim' },

  -- utils
  { 'nathom/filetype.nvim' },
  { 'stevearc/dressing.nvim' },
  { 'Tastyep/structlog.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'tmhedberg/matchit' },
  { 'kshenoy/vim-signature' },
  { 'machakann/vim-swap' },

  -- tpope
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-rsi' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },

  -- git
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('core.gitsigns').setup()
    end,
    event = 'BufRead',
  },

  -- lsp
  { 'neovim/nvim-lspconfig' },
  { 'tamago324/nlsp-settings.nvim' },
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'williamboman/nvim-lsp-installer' },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('core.notify').setup()
    end,
    event = 'BufRead',
  },

  -- move in buffer
  { 'ggandor/lightspeed.nvim' },
  { 'wellle/targets.vim' },
  { 'simrat39/symbols-outline.nvim' },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('core.telescope').setup()
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  },
  -- Install nvim-cmp, and buffer source as a dependency
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('core.cmp').setup()
    end,
    requires = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  },
  { 'rafamadriz/friendly-snippets' },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip/loaders/from_vscode').lazy_load()
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  {
    'folke/lua-dev.nvim',
    module = 'lua-dev',
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('core.autopairs').setup()
    end,
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter' },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('core.treesitter').setup()
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'BufReadPost',
  },

  -- NvimTree
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('core.nvimtree').setup()
    end,
  },

  -- Whichkey
  {
    'folke/which-key.nvim',
    config = function()
      require('core.which-key').setup()
    end,
    event = 'BufWinEnter',
  },

  -- Comments
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = function()
      require('core.comment').setup()
    end,
  },
  -- Icons
  { 'kyazdani42/nvim-web-devicons' },
  -- Status Line and Bufferline
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('core.lualine').setup()
    end,
  },
  {
    'romgrk/barbar.nvim',
    config = function()
      require('core.bufferline').setup()
    end,
    event = 'BufWinEnter',
  },
  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    event = 'BufWinEnter',
    config = function()
      require('core.terminal').setup()
    end,
  },
  -- Trouble
  {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end
  },

  -- Color Scheme
  { 'sainnhe/edge' },
}
