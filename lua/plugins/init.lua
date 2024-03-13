return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"html-lsp",
				"prettier",
				"stylua",
				"gopls",
			},
		},
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Show Indentlines
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
	},
	{
		"smoka7/hop.nvim",
		opts = {
			multi_windows = true,
			keys = "etovxqpdygfblzhckisuran",
			uppercase_labels = false,
		},
		keys = {
			{

				"<leader>fj",
				function()
					require("hop").hint_words()
				end,
				mode = { "n", "x", "o" },
			},
		},
	},
}
