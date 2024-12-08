-- pita/statusline/components.lua
local M = {}

M.git = require("pita.statusline.git")
M.scroll = require("pita.statusline.scrollbar")
M.words = require("pita.statusline.words")
M.mode = require("pita.statusline.mode")
M.filename = require("pita.statusline.filename")

return M

