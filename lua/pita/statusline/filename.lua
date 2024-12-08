local M = {}

-- Default configuration
local config = {
    enabled = true,
    path_type = "relative", -- Default path type
}

-- Function to set up the module with user configuration
function M.setup(user_config)
    config = vim.tbl_deep_extend("force", config, user_config or {})
end

-- Function to get the filename based on the configured path type
function M.get_filename()
    if not config.enabled then return '' end  -- Check if the module is enabled

    local filename

    -- Get the filename based on the configured path type
    if config.path_type == "relative" then
        filename = vim.fn.expand('%:f') -- Relative path
    elseif config.path_type == "tail" then
        filename = vim.fn.expand('%:t') -- Filename only
    elseif config.path_type == "full" then
        filename = vim.fn.expand('%:F') -- Full path
    else
        filename = vim.fn.expand('%:f') -- Default to relative if unknown type
    end

    local filetype = vim.bo.filetype

    if filename == '' then
        return '[No Name]'
    elseif filetype == 'help' then
        return 'Help: ' .. filename
    elseif filetype == 'qf' then
        return 'Quickfix List'
    else
        return filename
    end
end

-- Function to return a custom filename for statusline with LuaEval for dynamic updates.
function M.custom_filename()
  return [[ %{luaeval("require('pita.statusline.filename').get_filename()")} ]]

end

return M

