return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      if client.name == "html" then
        client.server_capabilities.renameProvider = false
      end

      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      opts.desc = "Apply formatting"
      keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
      end)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.lsp.config("gopls", {
      capabilities = capabilities,
    })

    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
    })

    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = function(client)
        on_attach(client)
        client.server_capabilities.document_formatting = false
      end,
      filetypes = { "gohtml", "gohtmltmpl", "html", "markdown", "mdx", "templ", "typescriptreact", "javascriptreact" },
    })

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      filetypes = { "c", "cpp", "cc", "h", "hpp", "hxx", "arduino" },
    })

    -- configure typescript server with plugin
    vim.lsp.config("ts_ls", {
      root_dir = function(bufnr, on_dir)
        local root_files = {
          "package.json",
          ".git",
          "tsconfig.json",
          "jsconfig.json",
        }

        -- get the full path of the buf file
        local filename = vim.api.nvim_buf_get_name(bufnr)
        -- try to find the nearest ancestor directory containing one of the markers
        local root = require("lspconfig.util").root_pattern(root_files)(filename)
        if root then
          on_dir(root)
        end
        -- if you’d rather always fall back to cwd when no marker is found, you could do:
        -- else
        --   on_dir(vim.fn.getcwd())
        -- end
      end,
    })

    vim.lsp.config("cssls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
      filetypes = { "gohtml", "gohtmltmpl", "html", "markdown", "mdx", "css", "less", "postcss", "sass", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "templ" },
    })

    vim.lsp.config("templ", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })


    vim.lsp.config("ruby_lsp", {
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
