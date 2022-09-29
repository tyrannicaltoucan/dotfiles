local signs = { Error = "", Warn = "", Info = "", Hint = "" }

for type, icon in pairs(signs) do
  local hl_name = "DiagnosticSign" .. type
  vim.fn.sign_define(hl_name, { texthl = hl_name, text = icon, numhl = "" })
end

vim.diagnostic.config {
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
  update_in_insert = true,
  float = { source = "always" },
}
