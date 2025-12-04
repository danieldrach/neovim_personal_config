return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        -- Configure PowerShell as the default shell on Windows
        if vim.fn.has("win32") == 1 then
            local powershell_options = {
                shell = vim.fn.executable('pwsh') == 1 and 'pwsh' or 'powershell',
                shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
                shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
                shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
                shellquote = '',
                shellxquote = '',
            }
            
            -- Apply the PowerShell options
            for option, value in pairs(powershell_options) do
                vim.opt[option] = value
            end
        end
        
        require("toggleterm").setup({
            size = 90,  -- 90% of screen height for regular terminals
            open_mapping = [[<F12>]],
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = math.floor(vim.o.columns * 0.9),
                height = math.floor(vim.o.lines * 0.8),
            },
        })
    end,
}
