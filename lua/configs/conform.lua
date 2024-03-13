local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },        -- Форматировщик для Go
    javascript = { "prettier" }, -- Добавлен форматировщик для JavaScript
    typescript = { "prettier" }, -- Добавлен форматировщик для TypeScript
    javascriptreact = { "prettier" }, -- Для JSX
    typescriptreact = { "prettier" }, -- Для TSX
  },
}

require("conform").setup(options)

