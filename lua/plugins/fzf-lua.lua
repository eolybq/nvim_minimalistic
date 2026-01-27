return {
    "ibhagwan/fzf-lua",
    -- volitelně závislost na ikonách
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({
            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                },
            },
        })

        -- Klávesové zkratky
        vim.keymap.set("n", "<leader><leader>", fzf.files, { desc = "Najít soubory" })
        vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Hledat text v souborech" })
        vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Přepnout buffer" })
        vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Nápověda" })

        vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "LSP chyby (aktuální soubor)" })
        vim.keymap.set("n", "<leader>fD", fzf.diagnostics_workspace, { desc = "LSP chyby (projekt)" })
    end,
}
