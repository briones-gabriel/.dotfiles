require "globals"
require "settings"

local async

async = vim.loop.new_async(
  vim.schedule_wrap(
    function ()
      require "maps"
      require "pluginsList"
      require "packerInit"

      async:close()
    end
  )
)

async:send()
