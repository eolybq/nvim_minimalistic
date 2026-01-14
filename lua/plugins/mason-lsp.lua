return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" }, -- Lazy loading: načte se až při otevření souboru
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup()

            -- 1. Mason Handlers (Automatická konfigurace serverů)
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright", -- Python
                    "clangd",  -- C/C++
                    "lua_ls",  -- Neovim Config
                },
                handlers = {
                    function(server_name)
                        local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                },
            })

            -- 2. LspAttach (Keymapy jen když běží LSP)
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    -- Helper funkce pro přehlednost
                    local map = function(mode, lhs, rhs, desc)
                        opts.desc = desc
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
                    map("n", "K", vim.lsp.buf.hover, "Show Documentation")
                    map("n", "gl", vim.diagnostic.open_float, "Show Error Details")
                    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Variable")
                    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action") -- Velmi užitečné, doporučuji přidat
                    map("n", "<leader>fr", function()
                        vim.lsp.buf.format({ async = true })
                    end, "Format Code")
                end,
            })
        end,
    },
}
