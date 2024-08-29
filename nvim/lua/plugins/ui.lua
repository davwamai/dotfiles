return {

	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				-- globalstatus = false,
				theme = "gruvbox-material",
			},
		},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local logo = [[
	       ██╗   ██╗ ██╗ ███╗   ███╗
	       ██║   ██║ ██║ ████╗ ████║
	       ██║   ██║ ██║ ██╔████╔██║
	       ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
	        ╚████╔╝  ██║ ██║ ╚═╝ ██║
	         ╚═══╝   ╚═╝ ╚═╝     ╚═╝
	     ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},
}
