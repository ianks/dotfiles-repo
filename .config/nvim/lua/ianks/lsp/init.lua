local nls = require "null-ls"
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)
local lspflags = { debounce_text_changes = 150 }
local nmap = require("ianks.keymap").nmap
local telescope = require "telescope.builtin"

local default_on_attach = function(client)
  local opts = {}
  nmap { "K", vim.lsp.buf.hover, opts }
  nmap { "gd", vim.lsp.buf.definition, opts }
  nmap { "gD", vim.lsp.buf.declaration, opts }
  nmap { "gr", telescope.lsp_references, opts }
  nmap { "gI", telescope.lsp_implementations, opts }
  nmap { "gT", vim.lsp.buf.type_definition, opts }
  nmap { "<c-s>", vim.lsp.buf.signature_help, opts }
  nmap { "<leader>ca", require("ianks.lsp.helpers").lsp_code_actions, opts }
  nmap { "<leader>cr", vim.lsp.buf.rename, opts }
end

require("rust-tools").setup({
  capabilities = capabilities,
  on_attach = default_on_attach,
  flags = lsp_flags,
	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					enable = true,
					command = "check",
					extraArgs = {
						{ "--target-dir", "/tmp/rust-analyzer-check" },
					},
				},
			},
		},
	},
})

require("lspconfig").sorbet.setup {
  cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
  capabilities = capabilities,
  on_attach = default_on_attach,
  flags = lsp_flags,
}

require("lspconfig").tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    default_on_attach(client)
  end,
  flags = lsp_flags,
}

require("lspconfig").graphql.setup {
  cmd = { "npx", "graphql-language-service-cli", "server", "-m", "stream", "-s", "app/graphql/schema.graphql" },
  capabilities = capabilities,
  on_attach = default_on_attach,
  flags = lsp_flags,
}

require("null-ls").setup {
  sources = {
    nls.builtins.formatting.prettierd.with {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
      },
    },
    nls.builtins.formatting.rustfmt,
    nls.builtins.formatting.rubocop,
    nls.builtins.formatting.stylua,
    nls.builtins.diagnostics.eslint,
    nls.builtins.diagnostics.rubocop,
    nls.builtins.diagnostics.shellcheck,
    -- nls.builtins.diagnostics.misspell,
    nls.builtins.hover.dictionary,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]]
    end
    default_on_attach(client)
  end,
  flags = lsp_flags,
  diagnostics_format = "[#{c}] #{m} (#{s})",
}

