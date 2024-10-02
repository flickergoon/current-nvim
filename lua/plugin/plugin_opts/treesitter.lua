---@diagnostic disable: missing-fields
require("nvim-treesitter.configs").setup({
	sync_install = true,
	auto_install = true,

	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>aa",
			node_incremental = "<leader>ai",
			scope_incremental = "<leader>ac",
			node_decremental = "<leader>ad",
		},
	},
	textobjects = {
		enable = true,
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			selection_modes = {
				["@parameter.outer"] = "v",
				["@function.outer"] = "v",
				["@class.outer"] = "<c-v>",
			},
			include_surrounding_whitespace = true,
		},
	},
	refactor = {
		enable = true,
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
			smart_rename = {
				enable = true,
				keymaps = {
					goto_definition = "gnd",
					list_definitions = "gnD",
					list_definitions_toc = "gO",
					goto_next_usage = "<a-w>",
					goto_previous_usage = "<a-q>",
				},
			},
		},
	},
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
