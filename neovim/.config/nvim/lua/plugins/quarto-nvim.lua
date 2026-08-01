-- import quarto-nvim plugin
local status, quarto = pcall(require, "quarto")
if not status then
	return
end

-- configure quarto-nvim
quarto.setup({
  lspFeatures = {
    enabled = true,
    languages = { 'r', 'python', 'julia' },
    completion = {
      enabled = true
    }
  }
})
