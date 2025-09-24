return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = {
			enabled = false,
		},
		servers = {
			rubocop = {
				settings = {
					-- your rubocop LSP settings (if any)
				},
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			},
		},
	},
}
