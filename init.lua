require("jetr")

local previous_path = nil

function RunTmuxTests()
  local input = vim.fn.input("Enter test file location (leave empty for last): ")

  local file_path = input ~= "" and input or previous_path

  if not file_path then
    print("Missing previous path")
    return
  end

  previous_path = file_path

  local tmux_command = string.format("tmux send-keys -t 2 './krspec %s' Enter", file_path)

  vim.fn.system(tmux_command)

  print(string.format("Running tests for %s", file_path))
end

-- vim.api.nvim_set_keymap("n", "<leader>it", ":lua RunTmuxTests()<CR>", { noremap = true, silent = true })
