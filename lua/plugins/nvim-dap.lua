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

            -- Cross-platform Python executable path for debugpy adapter
            local function get_debugpy_executable()
                local mason_path = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv'
                if vim.loop.os_uname().sysname == "Windows_NT" then
                    return mason_path .. '/Scripts/python.exe'
                else
                    return mason_path .. '/bin/python'
                end
            end

            -- Function to get the current venv Python executable
            local function get_venv_python()
                -- Check if VIRTUAL_ENV environment variable is set (by venv-selector)
                local venv_path = os.getenv('VIRTUAL_ENV')
                if venv_path then
                    if vim.loop.os_uname().sysname == "Windows_NT" then
                        return venv_path .. '/Scripts/python.exe'
                    else
                        return venv_path .. '/bin/python'
                    end
                end
                
                -- Fallback to system Python
                return vim.loop.os_uname().sysname == "Windows_NT" and "python" or "python3"
            end

            -- Setup Python debugging using Mason-installed debugpy
            dap.adapters.python = {
                type = 'executable';
                command = get_debugpy_executable();
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
                    python = function() return get_venv_python() end, -- Make this a function that evaluates at runtime
                },
            }

            -- Automatically open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
            end

        end,
    },
}
