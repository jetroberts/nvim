return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".git",
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		"selene.toml",
	},
	diagnostics = {
		globals = { "vim" },
	},
	workspace = {
		library = {
			[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			[vim.fn.stdpath("config") .. "/lua"] = true,
		},
	},
}
