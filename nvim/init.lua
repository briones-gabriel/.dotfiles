require "globals"
require "settings"

local async

async = vim.loop.new_async(
  vim.schedule_wrap(
    function ()
      require "theme"
      require "maps"
      require "packerInit"
      require "pluginsList"

      async:close()
    end
  )
)

async:send()
