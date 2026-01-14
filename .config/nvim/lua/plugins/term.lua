return {
	{
		"numToStr/FTerm.nvim",
		opts = {
			dimensions = {
				height = 0.8, -- Height of the terminal window
				width = 0.8, -- Width of the terminal window
				x = 0.5, -- X axis of the terminal window
				y = 0.5, -- Y axis of the terminal window
			},
		},
		keys = {
			{
				"<C-t>",
				function()
					require("FTerm").toggle()
				end,
				mode = "n",
				desc = "Toggle FTerm",
			},
			{
				"<C-t>",
				function()
					require("FTerm").toggle()
				end,
				mode = "t",
				desc = "Toggle FTerm",
			},
		},
	},
}
