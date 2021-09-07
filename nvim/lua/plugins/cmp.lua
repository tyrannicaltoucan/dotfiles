local cmp = require("cmp")

cmp.setup {
    completion = { keyword_length = 2 },
    documentation = false,
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu =({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                path = "[Path]",
            })[entry.source.name]

            return vim_item
        end
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        })
    },
    sources = {
        { name = "buffer" },
        { name = "nvim_lsp" },
    }
}
