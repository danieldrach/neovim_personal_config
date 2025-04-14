return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()

            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")

            require("dapui").setup({})
            require("nvim-dap-virtual-text").setup({commented = true,}) -- Show virtual text alongside comment

            local python_bin = vim.loop.os_uname().sysname == "Windows_NT" and "python" or "python3"
            dap_python.setup(python_bin)

            vim.fn.sign_define("DapBreakpoint", {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapBreakpointRejected", {
                text = "", -- or "❌"
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapStopped", {
                text = "", -- or "→"
                texthl = "DiagnosticSignWarn",
                linehl = "Visual",
                numhl = "DiagnosticSignWarn",
            })

            -- Add Python configurations
            dap.configurations.python = {
                {
                    type = 'python', -- Connects to dap-python
                    request = 'launch',
                    name = "Launch current file",
                    program = "${file}", -- Debug the currently open file
                },
            }

            -- Automatically open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
            end

        end,
    },
}
