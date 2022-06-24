local map = vim.api.nvim_set_keymap
map('i', 'jk', '', {})
map('n', 'n', [[:NvimTreeToggle]], {})
map('n', 'l', [[:IndentLinesToggle]], {})
map('n', 't', [[:TagbarToggle]], {})
map('n', 'ff', [[:Telescope find_files]], {})
map('n', 'fw', [[:Telescope openbrowser list]], {})
map('n', 'fwcpp', [[:Telescope open browser cpp]], {})
local opts = { noremap=true, silent=true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, bufnr = bufnr}
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.keymap.set{'n', 'gD', vim.lsp.buf.declaration, bufopts}
	vim.keymap.set{'n', 'gd', vim.lsp.buf.definition, bufopts}
	vim.keymap.set{'n', 'K', vim.lsp.buf.hover, bufopts}
	vim.keymap.set{'n', 'gi', vim.lsp.buf.implementation, bufopts}
	vim.keymap.set{'n', '<C-k>', vim.lsp.buf.signature_help, bufopts}
	vim.keymap.set{'n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts}
	vim.keymap.set{'n', '<space>wr', vim.lsp.buf_remove_workspace_folder, bufopts}
	vim.keymap.set{'n', '<space>wl', function() 
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts}
	vim.keymap.set{'n', '<space>D', vim.lsp.buf.type_definition, bufopts}
	vim.keymap.set{'n', '<space>rn', vim.lsp.buf.rename, bufopts}
	vim.keymap.set{'n', '<space>ca', vim.lsp.buf.code_action, bufopts}
	vim.keymap.set{'n', 'gr', vim.lsp.buf.references, bufopts}
	vim.keymap.set{'n', '<space>f', vim.lsp.buf.formatting, bufopts}
end


local lsp_flags = { 
	debounce_text_changes = 150
}

require('lspconfig')['clangd'].setup{ 
	on_attach = on_attach,
	flags = lsp_flags
}
require('lspconfig')['jedi_language_server'].setup{ 
	on_attach = on_attach,
	flags = lsp_flags
}
