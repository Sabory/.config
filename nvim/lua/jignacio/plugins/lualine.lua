local function shorter_work_git_branch()
	local branch = vim.fn["FugitiveHead"]()

	if branch:find("^jignacio/stocks") then
		branch = branch:gsub("^jignacio/stocks", "j/s")
	elseif branch:find("^jignacio/reception") then
		branch = branch:gsub("^jignacio/reception", "j/r")
	end

	return branch
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { shorter_work_git_branch },
				lualine_c = {
					{ "filename", path = 1, file_status = false },
				},
				lualine_x = {
					"diagnostics",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
