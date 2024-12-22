-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 
        "rose-pine/neovim", 
        as = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use ({
        "David-Kunz/gen.nvim",
        config = function()
            local opts = {
                model = "mistral", -- The default model to use.
                quit_map = "q", -- set keymap to close the response window
                retry_map = "<c-r>", -- set keymap to re-send the current prompt
                accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
                host = "192.168.1.7", -- The host running the Ollama service.
                port = "11434", -- The port on which the Ollama service is listening.
                display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
                show_prompt = false, -- Shows the prompt submitted to Ollama.
                show_model = false, -- Displays which model you are using at the beginning of your chat session.
                no_auto_close = false, -- Never closes the window automatically.
                file = false, -- Write the payload to a temporary file to keep the command short.
                hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
                init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
                -- Function to initialize Ollama
                command = function(options)
                    local body = {model = options.model, stream = true}
                    return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
                end,
                -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
                -- This can also be a command string.
                -- The executed command must return a JSON object with { response, context }
                -- (context property is optional).
                -- list_models = '<omitted lua function>', -- Retrieves a list of model names
                debug = false -- Prints errors and the command which is run.
            }
            require('gen').setup({opts = opts})
        end
    })
end)
