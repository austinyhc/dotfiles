local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.scrolloff = 8

-- long running undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		opt.shiftwidth = 2
		opt.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml",
	callback = function()
		opt.tabstop = 2
		opt.softtabstop = 2
		opt.shiftwidth = 2
		opt.expandtab = true
	end,
})

vim.api.nvim_create_autocmd({
	"BufWritePre",
	"FileWritePre",
	"FileAppendPre",
	"FilterWritePre",
}, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipped
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
