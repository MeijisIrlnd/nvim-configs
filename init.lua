local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

require('vars')
require('opts')
require('keys')
require('plug')
require('nvim-tree').setup{}
require('lualine').setup { 
	options = { 
		theme = 'dracula-nvim'
	}
}
require('nvim-autopairs').setup{}
require('nvim-treesitter.configs').setup { 
	ensure_installed = { "c", "cpp", "lua", "python"},
	sync_install = false,
	highlight = { 
		enable = true
	}
}
require 'nvim-treesitter.install'.compilers = {"clang"}
require('nvim-lsp-installer').setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.jedi_language_server.setup{}
require 'telescope'.setup { 
	extensions = { 
		openbrowser = { 
			bookmarks = { 
				['cpp ref'] = 'https://en.cppreference.com/w/'
			}
		}
	}
}
