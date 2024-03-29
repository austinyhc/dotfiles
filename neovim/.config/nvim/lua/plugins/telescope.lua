-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<M-k>"] = actions.move_selection_previous, -- move to prev result
				["<M-j>"] = actions.move_selection_next, -- move to next result
				["<M-q>"] = actions.close, -- close the telescope
				["<M-Q>"] = actions.close, -- close the telescope
				["<C-q>"] = actions.close, -- close the telescope
				["<C-Q>"] = actions.close, -- close the telescope
			},
		},
	},
})

telescope.load_extension("fzf")
