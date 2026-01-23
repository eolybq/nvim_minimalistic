vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.smarttab = true

vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.relativenumber = true
vim.o.number = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.shell = "/opt/homebrew/bin/fish"

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}")

-- Term mode no numbers
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Stop comment newline after commenting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
