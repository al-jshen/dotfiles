return {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"giuxtaposition/blink-cmp-copilot",
				dependencies = {
					"zbirenbaum/copilot.lua",
				},
			},
		},

		-- use a release tag to download pre-built binaries
		-- version = '1.*',
		-- branch = "main",
		build = "cargo build --release",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			signature = {
				enabled = true,
				window = {
					show_documentation = true,
				},
			},

			keymap = {
				preset = "enter",
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = {
					"select_prev",
					"snippet_backward",
					"fallback",
				},
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				accept = {
					-- experimental auto-brackets support
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					auto_show = true,
					draw = {
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
				},
				ghost_text = {
					enabled = true,
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = true,
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"neovim/nvim-lspconfig",
		},
	},
	-- {
	--   "CopilotC-Nvim/CopilotChat.nvim",
	--   dependencies = {
	--     { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
	--     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	--   },
	--   build = "make tiktoken", -- Only on MacOS or Linux
	--   opts = {
	--     -- See Configuration section for options
	--     mappings = {
	--       accept_diff = {
	--         normal = "<C-y>",
	--         insert = "<C-y>",
	--       },
	--       submit_prompt = {
	--         normal = "<CR>",
	--         insert = "<C-CR>",
	--       },
	--       show_help = {
	--         normal = "g?",
	--       },
	--     }
	--   },
	--   -- See Commands section for default commands if you want to lazy load on them
	-- },
	{
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		-- build = "make BUILD_FROM_SOURCE=true",
		build = "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			-- add any opts here
			-- for example
			provider = "copilot",
			behavior = {
				auto_suggestions = false,
			},
		},
		input = {
			provider = "snacks",
			provider_opts = {
				-- Additional snacks.input options
				title = "Avante Input",
				icon = " ",
			},
		},
		selector = {
			provider = "fzf",
			provider_opts = {},
		},
		mappings = {
			--- @class AvanteConflictMappings
			diff = {
				ours = "co",
				theirs = "ct",
				all_theirs = "ca",
				both = "cb",
				cursor = "cc",
				next = "]x",
				prev = "[x",
			},
			suggestion = {
				accept = "<M-l>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			cancel = {
				normal = { "<C-c>", "<Esc>", "q" },
				insert = { "<C-c>" },
			},
			sidebar = {
				apply_all = "A",
				apply_cursor = "a",
				retry_user_request = "r",
				edit_user_request = "e",
				switch_windows = "<Tab>",
				reverse_switch_windows = "<S-Tab>",
				remove_file = "d",
				add_file = "@",
				close = { "<Esc>", "q" },
				close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "BufReadPost",
		opts = {
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
				},
			},
			filetypes = {
				markdown = true,
				help = true,
				yaml = true,
				gitcommit = true,
				gitrebase = true,
			},
		},
	},
}
