require("toggleterm").setup {
    size = 15,
    shading_factor = 0,
    open_mapping = "<C-t>",
    direction = "horizontal",
}

local M = {}

M.launch_debugger = function(debugger)
    local Terminal = require("toggleterm.terminal").Terminal
    local debugger = Terminal:new({ cmd = debugger, close_on_exit = true, hidden = true })
    debugger:toggle()
end

return M
