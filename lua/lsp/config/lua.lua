local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local common = require("lsp.common-config")

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, _)
    common.disableFormat(client)
  end,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = runtime_path, },
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global.
      globals = { "vim" },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      libray = vim.api.nvim_get_runtime_file("", true),
      checkThirdParty = false,
    },
    -- Do not send telemetry data containing a randomized out unique identifier.
    telemetry = {
      enable = false,
    },
  },
}

return {
  on_setup = function(server)
    require("neodev").setup()
    server.setup(opts)
  end,
}
