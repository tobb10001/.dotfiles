return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'mfussenegger/nvim-dap-python',
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set('n', '<leader>ds', dap.continue, { desc = '[D]ebug: [S]tart/Continue' })
        vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug: [S]tep Into' })
        vim.keymap.set('n', '<leader>dj', dap.step_over, { desc = '[D]ebug: [S]tep Over' })
        vim.keymap.set('n', '<leader>do', dap.step_out, { desc = '[D]ebug: [S]tep Out' })
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug: Toggle [B]reakpoint' })
        vim.keymap.set('n', '<leader>dB', function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end, { desc = '[D]ebug: Set [B]reakpoint' })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = 'Debug: See last session result.' })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Initialize adapters
        require('dap-python').setup('~/.local/share/nvim/debugpy_venv/bin/python')
        dap.configurations.python[3].justMyCode = false -- FIXME: Find a better way to handle this stuff.
    end,
}
