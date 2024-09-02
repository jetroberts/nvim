return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dap.adapters.ruby = {
      type = 'server',
      host = '127.0.0.1',
      port = 12345,
      options = {
        source_filetype = "ruby",
      },
    }

    dap.configurations.ruby = {
      {
        type = 'ruby',
        request = 'attach',
        name = 'Attach to rdbg',
        remoteHost = '127.0.0.1',
        remotePort = 12345,
        remoteWorkspaceRoot = '/myapp',
        localWorkspaceRoot = vim.fn.getcwd(),
      }
    }

    dapui.setup()

    vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
    vim.keymap.set('n', '<Leader>ds', function() require('dap').step_over() end)
    vim.keymap.set('n', '<Leader>di', function() require('dap').step_into() end)
    vim.keymap.set('n', '<Leader>do', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp',
      function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    --vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    --vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    --    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    --      require('dap.ui.widgets').hover()
    --    end)
    --    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    --      require('dap.ui.widgets').preview()
    --    end)
    --    vim.keymap.set('n', '<Leader>df', function()
    --      local widgets = require('dap.ui.widgets')
    --      widgets.centered_float(widgets.frames)
    --    end)
    --    vim.keymap.set('n', '<Leader>ds', function()
    --      local widgets = require('dap.ui.widgets')
    --      widgets.centered_float(widgets.scopes)
    --    end)

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
