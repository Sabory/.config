local M = {}

local ls = require("luasnip")

local snippets_folder = vim.fn.stdpath("config") .. "/lua/jignacio/snip/snippets/"

function _G.edit_ft()
	-- returns table like {"lua", "all"}
	local fts = require("luasnip.util.util").get_snippet_filetypes()

	vim.ui.select(fts, {
		prompt = "Select which filetype to edit:",
	}, function(item, idx)
		-- selection aborted -> idx == nil
		if idx then
			vim.cmd("edit " .. snippets_folder .. item .. ".json")
		end
	end)
end

function M.setup()
	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
	})

	vim.cmd([[command! LuaSnipEdit :lua _G.edit_ft()]])

  require("luasnip.loaders.from_vscode").lazy_load({ paths = snippets_folder })
end

return M
