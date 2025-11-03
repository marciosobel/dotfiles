local opt = vim.opt
local o = vim.o

o.laststatus = 3
o.showmode = false

o.cursorline = true
o.cursorlineopt = "number"

o.ignorecase = true
o.smartcase = true

o.mouse = "a"

o.signcolumn = "yes"

o.nu = true
o.relativenumber = true
o.numberwidth = 2

opt.fillchars = { eob = " " }

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8

opt.updatetime = 50
-- opt.colorcolumn = { "80", "120" }
opt.colorcolumn = { "120" }
opt.wrap = false
opt.termguicolors = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.winborder = "rounded"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- add binaries installed by mason.nvim to path
local sep = "/" -- change to "\" if on windows
local delim = ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- add icons to LSP diagnostics
local severity_icons = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.INFO] = "  ",
	[vim.diagnostic.severity.HINT] = "󰌵 ",
}

local get_icon_from_diagnostic = function(diagnostic)
	return severity_icons[diagnostic.severity] or "●"
end

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = true,
	float = {
		format = function(diagnostic)
			local MAX_MESSAGE_LENGTH = 240
			local message = diagnostic.message
			if #message > MAX_MESSAGE_LENGTH then
				message = message:sub(1, MAX_MESSAGE_LENGTH - 3) .. "..."
			end
			return string.format("%s %s", get_icon_from_diagnostic(diagnostic), message)
		end,
	},
	virtual_text = {
		prefix = get_icon_from_diagnostic,
		spacing = 2,
		align = "eol",
	},
})

-- add fold methods
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 4
