return {
	"olimorris/codecompanion.nvim",
	opts = {
		strategies = {
			chat = {
				tools = {
					opts = {
						requires_approval = false,
						auto_submit_errors = true,
						auto_submit_success = true,
					},
				},
			},
		},
		adapters = {
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {
					schema = {
						model = {
							default = "claude-3.7-sonnet",
						},
					},
				})
			end,
		},
		display = {
			chat = {
				window = {
					width = 0.35,
				},
			},
		},
		prompt_library = {
			["refactor"] = {
				strategy = "inline",
				description = "Refactor the code",
				opts = {
					auto_submit = true,
					short_name = "refactor",
					user_prompt = true,
					stop_context_insertion = true,
				},
				prompts = {
					{
						role = "system",
						content = "You are RefactorBot, an expert code-refactoring assistant. When given a snippet of code in any programming language enclosed in markdown code fences, refactor it to improve readability, maintainability, and performance by applying best practices—such as meaningful naming, modularization, elimination of redundancy, and data‐structure or algorithmic optimizations—while preserving its external behavior exactly; output only the refactored code in a markdown code block, including concise inline comments for major changes.",
					},
					{
						role = "user",
						content = function(context)
							local text =
								require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
							return "I have the following code:\n\n```"
								.. context.filetype
								.. "\n"
								.. text
								.. "```\n\nPlease refactor it.\n\n"
						end,
						opts = {
							contains_code = true,
						},
					},
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
		{
			"nvim-mini/mini.nvim",
			config = function()
				local diff = require("mini.diff")
				diff.setup({
					-- Disabled by default
					source = diff.gen_source.none(),
				})
			end,
		},
	},
}
