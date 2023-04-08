require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-neorg/neorg',
    run = ':Neorg sync-parsers'
  }
end)

require('nvim-treesitter.install').compilers = {'gcc-12', 'gcc', 'cc', 'clang', 'cl', 'zig'}
require('nvim-treesitter.configs').setup {
  ensure_installed = { "norg" },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          test = vim.fn.getcwd()
        }
      }
    },
    ['core.norg.esupports.metagen'] = {
      config = {
        type = 'empty',
        template = {
          { "title", "please use this title" },
        }
      }
    },
    ['core.norg.journal'] = {
      config = {
        journal_folder = 'notes',
        strategy = 'flat',
        workspace = 'test',
      }
    }
  }
}
