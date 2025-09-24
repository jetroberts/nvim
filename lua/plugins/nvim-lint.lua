return {
	"mfussenegger/nvim-lint",
	opts = {
		events = {
			"BufWritePost",
			"BufReadPost",
			"InsertLeave",
		},
		linters_by_ft = {
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
		},
		-- skip writing changes for rubocop
		skip_filetypes = { "ruby" },
	},
}
