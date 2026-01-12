return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")
		config.setup({
			auto_install = false,
			ensure_installed = {
                "lua",
                "python",
            },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
