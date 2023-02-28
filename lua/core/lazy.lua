require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "navarasu/onedark.nvim",
  'tomasiser/vim-code-dark',


  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  "rcarriga/nvim-notify",
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.1'
  },
  "stevearc/dressing.nvim",
  "norcalli/nvim-colorizer.lua",
  "steelsojka/pears.nvim",
  "tpope/vim-surround",

  "folke/trouble.nvim",
  "nvim-treesitter/nvim-treesitter",

})
