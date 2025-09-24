vim.lsp.enable({
  "rust_analyzer",
  "html",
  "ts_ls",
  "cssls",
  "lua_ls",
  "ruby_lsp",
  "rubocop",
  "eslint",
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
