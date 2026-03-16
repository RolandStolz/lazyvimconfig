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
        end
      end, {})
    end,
    keys = {
      { "<leader>os", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>ol", "<cmd>OverseerToggle<cr>", desc = "Task list" },
      { "<leader>or", "<cmd>OverseerRestartLast<cr>", desc = "Re-run last task" },
    },
  },
}
