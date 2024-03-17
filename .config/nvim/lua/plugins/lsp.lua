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
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
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

            require("lspconfig")["sourcekit"].setup {
                capabilities = capabilities,
                cmd = { "xcrun", "sourcekit-lsp" },
                on_attach = function(client, bufnr)
                    require("mason-lspconfig").common_on_attach(client, bufnr)
                end,
                root_dir = function(filename, _)
                    local util = require("lspconfig.util")
                    return util.root_pattern("buildServer.json")(filename)
                    or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
                    or util.find_git_ancestor(filename)
                    or util.root_pattern("Package.swift")(filename)
                end,
            }

            local cmp = require("cmp")
            require("cmp_git").setup()
            local luasnip = require("luasnip")

            vim.keymap.set({ "s", "i" }, "<c-k>", function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-k>", true, true, true), "n", true)
                end
            end,
            { desc = "Expand or jump luasnip", silent = true})

            vim.keymap.set({ "s", "i" }, "<c-j>", function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-j>", true, true, true), "n", true)
                end
            end,
            { desc = "Jump back luasnip", silent = true})

            vim.keymap.set("i", "<c-l>", function()
                if luasnip.choice_active() then
                    luasnip.change_choice(1)
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-l>", true, true, true), "n", true)
                end
            end,
            { desc = "Change choice luasnip", silent = true}
            )

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "git" },
                    -- { name = "vsnip" }, -- For vsnip users.
                    { name = "luasnip" }, -- For luasnip users.
                    -- { name = "ultisnips" }, -- For ultisnips users.
                    -- { name = "snippy" }, -- For snippy users.
                }, {
                    { name = "buffer" },
                }),
            })
        end
    }
