return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			animate = { enabled = true },
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
			explorer = { enabled = true },
			git = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			notify = { enabled = true },
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true }, -- in options.lua
			toggle = {
				enabled = true,
				which_key = true,
				notify = true,
			},
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>n",
				function()
					if Snacks.config.picker and Snacks.config.picker.enabled then
						Snacks.picker.notifications()
					else
						Snacks.notifier.show_history()
					end
				end,
				desc = "Notification History",
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
		},
		keys = {
			-- Top Pickers & Explorer
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>,",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			-- find
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- git
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			-- Grep
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			-- search
			{
				'<leader>s"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>s/",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>sa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>sD",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>sH",
				function()
					Snacks.picker.highlights()
				end,
				desc = "Highlights",
			},
			{
				"<leader>si",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons",
			},
			{
				"<leader>sj",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Jumps",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>sl",
				function()
					Snacks.picker.loclist()
				end,
				desc = "Location List",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>sM",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
			},
			{
				"<leader>sp",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Search for Plugin Spec",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>sR",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<leader>su",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},
			{
				"<leader>uC",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
			-- Other
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
			},
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>n",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>cR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"<c-/>",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"<c-_>",
				function()
					Snacks.terminal()
				end,
				desc = "which_key_ignore",
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
			{
				"<leader>N",
				desc = "Neovim News",
				function()
					Snacks.win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					})
				end,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>uT")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ub")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.indent():map("<leader>ug")
					Snacks.toggle.dim():map("<leader>uD")
				end,
			})
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
		},
		opts = {
			options = {
        -- stylua: ignore
        close_command = function(n) Snacks.bufdelete(n) end,
        -- stylua: ignore
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
					{
						filetype = "snacks_layout_box",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		opts = function()
			-- PERF: we don't need this lualine require madness 🤷
			local lualine_require = require("lualine_require")
			lualine_require.require = require

			vim.o.laststatus = vim.g.lualine_laststatus

			local opts = {
				options = {
					theme = "auto",
					globalstatus = vim.o.laststatus == 3,
					disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_x = {
						Snacks.profiler.status(),
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = function() return { fg = Snacks.util.color("Statement") } end,
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return { fg = Snacks.util.color("Constant") } end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special") } end,
            },
						{
							"diff",
							source = function()
								local gitsigns = vim.b.gitsigns_status_dict
								if gitsigns then
									return {
										added = gitsigns.added,
										modified = gitsigns.changed,
										removed = gitsigns.removed,
									}
								end
							end,
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree", "lazy", "fzf" },
			}

			-- do not add trouble symbols if aerial is enabled
			-- And allow it to be overriden for some buffer types (see autocmds)
			if vim.g.trouble_lualine then
				local trouble = require("trouble")
				local symbols = trouble.statusline({
					mode = "symbols",
					groups = {},
					title = false,
					filter = { range = true },
					format = "{kind_icon}{symbol.name:Normal}",
					hl_group = "lualine_c_normal",
				})
				table.insert(opts.sections.lualine_c, {
					symbols and symbols.get,
					cond = function()
						return vim.b.trouble_lualine ~= false and symbols.has()
					end,
				})
			end

			return opts
		end,
	},

	-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = "VeryLazy",
		opts = {
			{
				cmdline = {
					enabled = true, -- enables the Noice cmdline UI
					view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
					opts = {}, -- global options for the cmdline. See section on views
					---@type table<string, CmdlineFormat>
					format = {
						-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
						-- view: (default is cmdline view)
						-- opts: any options passed to the view
						-- icon_hl_group: optional hl_group for the icon
						-- title: set to anything or empty string to hide
						cmdline = { pattern = "^:", icon = "", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
						filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
						lua = {
							pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
							icon = "",
							lang = "lua",
						},
						help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
						input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
						-- lua = false, -- to disable a format, set to `false`
					},
				},
				messages = {
					-- NOTE: If you enable messages, then the cmdline is enabled automatically.
					-- This is a current Neovim limitation.
					enabled = true, -- enables the Noice messages UI
					view = "notify", -- default view for messages
					view_error = "notify", -- view for errors
					view_warn = "notify", -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
				},
				popupmenu = {
					enabled = true, -- enables the Noice popupmenu UI
					---@type 'nui'|'cmp'
					backend = "nui", -- backend to use to show regular cmdline completions
					---@type NoicePopupmenuItemKind|false
					-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
					kind_icons = {}, -- set to `false` to disable icons
				},
				-- default options for require('noice').redirect
				-- see the section on Command Redirection
				---@type NoiceRouteConfig
				redirect = {
					view = "popup",
					filter = { event = "msg_show" },
				},
				-- You can add any custom commands below that will be available with `:Noice command`
				---@type table<string, NoiceCommand>
				commands = {
					history = {
						-- options for the message history that you get with `:Noice`
						view = "split",
						opts = { enter = true, format = "details" },
						filter = {
							any = {
								{ event = "notify" },
								{ error = true },
								{ warning = true },
								{ event = "msg_show", kind = { "" } },
								{ event = "lsp", kind = "message" },
							},
						},
					},
					-- :Noice last
					last = {
						view = "popup",
						opts = { enter = true, format = "details" },
						filter = {
							any = {
								{ event = "notify" },
								{ error = true },
								{ warning = true },
								{ event = "msg_show", kind = { "" } },
								{ event = "lsp", kind = "message" },
							},
						},
						filter_opts = { count = 1 },
					},
					-- :Noice errors
					errors = {
						-- options for the message history that you get with `:Noice`
						view = "popup",
						opts = { enter = true, format = "details" },
						filter = { error = true },
						filter_opts = { reverse = true },
					},
					all = {
						-- options for the message history that you get with `:Noice`
						view = "split",
						opts = { enter = true, format = "details" },
						filter = {},
					},
				},
				notify = {
					-- Noice can be used as `vim.notify` so you can route any notification like other messages
					-- Notification messages have their level and other properties set.
					-- event is always "notify" and kind can be any log level as a string
					-- The default routes will forward notifications to nvim-notify
					-- Benefit of using Noice for this is the routing and consistent history view
					enabled = true,
					view = "notify",
				},
				lsp = {
					progress = {
						enabled = true,
						-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
						-- See the section on formatting for more details on how to customize.
						--- @type NoiceFormat|string
						format = "lsp_progress",
						--- @type NoiceFormat|string
						format_done = "lsp_progress_done",
						throttle = 1000 / 30, -- frequency to update lsp progress message
						view = "mini",
					},
					override = {
						-- override the default lsp markdown formatter with Noice
						["vim.lsp.util.convert_input_to_markdown_lines"] = false,
						-- override the lsp markdown formatter with Noice
						["vim.lsp.util.stylize_markdown"] = false,
						-- override cmp documentation with Noice (needs the other options to work)
						["cmp.entry.get_documentation"] = false,
					},
					hover = {
						enabled = true,
						silent = false, -- set to true to not show a message if hover is not available
						view = nil, -- when nil, use defaults from documentation
						---@type NoiceViewOptions
						opts = {}, -- merged with defaults from documentation
					},
					signature = {
						enabled = true,
						auto_open = {
							enabled = true,
							trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
							luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
							throttle = 50, -- Debounce lsp signature help request by 50ms
						},
						view = nil, -- when nil, use defaults from documentation
						---@type NoiceViewOptions
						opts = {}, -- merged with defaults from documentation
					},
					message = {
						-- Messages shown by lsp servers
						enabled = true,
						view = "notify",
						opts = {},
					},
					-- defaults for hover and signature help
					documentation = {
						view = "hover",
						---@type NoiceViewOptions
						opts = {
							lang = "markdown",
							replace = true,
							render = "plain",
							format = { "{message}" },
							win_options = { concealcursor = "n", conceallevel = 3 },
						},
					},
				},
				markdown = {
					hover = {
						["|(%S-)|"] = vim.cmd.help, -- vim help links
						["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
					},
					highlights = {
						["|%S-|"] = "@text.reference",
						["@%S+"] = "@parameter",
						["^%s*(Parameters:)"] = "@text.title",
						["^%s*(Return:)"] = "@text.title",
						["^%s*(See also:)"] = "@text.title",
						["{%S-}"] = "@parameter",
					},
				},
				health = {
					checker = true, -- Disable if you don't want health checks to run
				},
				---@type NoicePresets
				presets = {
					-- you can enable a preset by setting it to true, or a table that will override the preset config
					-- you can also add custom presets that you can enable/disable with enabled=true
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = false, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
				---@type NoiceConfigViews
				views = {}, ---@see section on views
				---@type NoiceRouteConfig[]
				routes = {}, --- @see section on routes
				---@type table<string, NoiceFilter>
				status = {}, --- @see section on statusline components
				---@type NoiceFormatOptions
				format = {}, --- @see section on formatting
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
    -- stylua: ignore
    keys = {
      { "<leader>sn", "", desc = "+noice"},
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
		config = function(_, opts)
			-- HACK: noice shows messages from before it was enabled,
			-- but this is not ideal when Lazy is installing plugins,
			-- so clear the messages in this case.
			if vim.o.filetype == "lazy" then
				vim.cmd([[messages clear]])
			end
			require("noice").setup(opts)
		end,
	},

	-- icons
	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
}
