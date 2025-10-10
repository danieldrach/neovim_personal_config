return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            
            require("dapui").setup({})
            require("nvim-dap-virtual-text").setup({commented = true})

            -- Cross-platform Python executable path
            local function get_python_executable()
                local mason_path = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv'
                if vim.loop.os_uname().sysname == "Windows_NT" then
                    return mason_path .. '/Scripts/python.exe'
                else
                    return mason_path .. '/bin/python'
                end
            end

            -- Setup Python debugging using Mason-installed debugpy
            dap.adapters.python = {
                type = 'executable';
                command = get_python_executable();
                args = { '-m', 'debugpy.adapter' };
            }

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
                    type = 'python',
                    request = 'launch',
                    name = "Launch current file",
                    program = "${file}",
                    python = get_python_executable(),
                },
            }

            -- Automatically open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
            end

        end,
    },
}
