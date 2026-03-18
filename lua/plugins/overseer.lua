return {
  {
    "stevearc/overseer.nvim",
    opts = {},
    config = function(_, opts)
      local overseer = require("overseer")
      overseer.setup(opts)

      vim.api.nvim_create_user_command("OverseerRestartLast", function()
        local task_list = require("overseer.task_list")
        local tasks = overseer.list_tasks({
          status = { overseer.STATUS.SUCCESS, overseer.STATUS.FAILURE, overseer.STATUS.CANCELED },
          sort = task_list.sort_finished_recently,
        })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], "restart")
          overseer.open({ enter = false })
        end
      end, {})
    end,
    keys = {
      {
        "<leader>os",
        function()
          require("overseer").run_task({}, function(task)
            if task then
              require("overseer").open({ enter = true })
            end
          end)
        end,
        desc = "Run task",
      },
      { "<leader>ol", "<cmd>OverseerToggle<cr>", desc = "Task list" },
      { "<leader>or", "<cmd>OverseerRestartLast<cr>", desc = "Re-run last task" },
      {
        "<leader>oc",
        function()
          local root = LazyVim.root.git()
          local path = root .. "/.vscode/tasks.json"
          if vim.fn.filereadable(path) == 0 then
            vim.fn.mkdir(root .. "/.vscode", "p")
            local f = io.open(path, "w")
            if f then
              f:write('{\n  "version": "2.0.0",\n  "tasks": []\n}\n')
              f:close()
            end
          end
          vim.cmd("edit " .. vim.fn.fnameescape(path))
        end,
        desc = "Open .vscode/tasks.json",
      },
    },
  },
}
