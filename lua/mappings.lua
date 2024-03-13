require "nvchad.mappings"

local function auto_format_and_eslint_fix()
  -- Запускается форматирование через conform для всех файлов
  require("conform").format()

  -- Определение, нужно ли запускать EslintFixAll в зависимости от типа файла
  local file_ext = vim.fn.expand("%:e")
  if file_ext == "js" or file_ext == "jsx" or file_ext == "ts" or file_ext == "tsx" then
    -- Запуск EslintFixAll только для JavaScript и TypeScript файлов
    vim.cmd("EslintFixAll")
  end
end

-- Настройка автоматической команды на вызов функции для всех типов файлов
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",  -- Эта настройка применяет функцию ко всем файлам
  callback = auto_format_and_eslint_fix,
  desc = "Run conform format and EslintFixAll before file save",
})

-- Существующие маппинги
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fm", function() require("conform").format() end, { desc = "File Format with conform" })
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Codeium 
map('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map('i', '<C-e>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
map('i', '<C-w>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
map('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })


-- Lazygit
map('n', '<leader>gg', ':LazyGit<CR>', { silent = true })
