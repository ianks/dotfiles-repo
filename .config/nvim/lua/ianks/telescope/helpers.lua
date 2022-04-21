local M = {}

function M.file_explorer()
  require("telescope").extensions.file_browser.file_browser {
    path = "%:p:h",
    path_to_cwd = true,
    on_complete = {
      function()
        vim.cmd "stopinsert"
      end,
    },
  }
end

return M
