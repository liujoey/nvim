require("core"):init()

require("config"):load()

local plugins = require "plugins"
require("plugin-loader").load { plugins }

local Log = require "core.log"
Log:debug "Starting Neovim"

local commands = require "core.commands"
commands.load(commands.defaults)

require("lsp").setup()
