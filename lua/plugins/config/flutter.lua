return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },

		--- optional for vim.ui.select
		---
		{ "stevearc/dressing.nvim" },
	},
	config = function()
		local flutter = require("flutter-tools")

		flutter.setup({
			flutter_path = "/home/jmsrsd/fvm/default/bin/flutter",

			ui = {
				border = "rounded",
			},

			dev_log = {
				notify_errors = true,
			},

			decorations = {
				statusline = {
					app_version = true,
					device = true,
					project_config = true,
				},
			},
			lsp = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
		})
	end,
}
