return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "petertriho/cmp-git",
    },
    config = function()
        -- require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tsserver",
            }
        })
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require("lspconfig")["sourcekit"].setup {}

        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {}
                capabilities = capabilities
            end,
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                })
            end

            }

            -- vim.diagnostic.config({
            --     update_in_insert = true,
            --     virtual_text = true,
            --     float = {
            --         focusable = false,
            --         border = "rounded",
            --         source = "always",
            --         header = "",
            --         prefix = "",
            --     }
            -- })

            local cmp = require"cmp"
            require("cmp_git").setup()

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "git" },
                    -- { name = "vsnip" }, -- For vsnip users.
                    -- { name = "luasnip" }, -- For luasnip users.
                    -- { name = "ultisnips" }, -- For ultisnips users.
                    -- { name = "snippy" }, -- For snippy users.
                }, {
                    { name = "buffer" },
                }),
            })
        end
    }
