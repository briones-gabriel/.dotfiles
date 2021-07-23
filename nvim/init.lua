require "globals"
require "settings"
require "theme"

local async

async = vim.loop.new_async(
  vim.schedule_wrap(
    function ()
      require "packerInit"
      require "pluginsList"
      require "maps"

      async:close()
    end
  )
)

async:send()
