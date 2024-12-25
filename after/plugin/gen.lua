local gen = require('gen')

gen.setup({
    model = 'mistral', -- The default model to use.
    -- model = 'llama3.2:1b', -- The default model to use.
    quit_map = 'q', -- Set keymap to close the response window
    retry_map = '<c-r>', -- Set keymap to re-send the current prompt
    accept_map = '<c-cr>', -- Set keymap to replace the previous selection with the last result
    -- host = 'localhost', -- The host running the Ollama service.
    host = '192.168.1.7', -- The host running the Ollama service.
    port = '11434', -- The port on which the Ollama service is listening.
    display_mode = 'split', -- The display mode. Can be 'float', 'split', or 'horizontal-split'.
    show_prompt = true, -- Show the prompt submitted to Ollama.
    show_model = true, -- Display the model used at the beginning of the chat session.
    no_auto_close = false, -- Never close the window automatically.
    file = false, -- Write the payload to a temporary file to keep the command short.
    hidden = false, -- Hide the generation window (requires Neovim >= 0.10).
    init = function(options)
        pcall(io.popen, 'ollama serve > /dev/null 2>&1 &')
    end, -- Initialize Ollama
    command = function(options)
        local body = {model = options.model, stream = true}
        return 'curl --silent --no-buffer -X POST http://' .. options.host .. ':' .. options.port .. '/api/chat -d $body'
    end, -- Command to interact with Ollama service
    debug = false -- Print errors and the executed command
})

gen.prompts['Fix_Code'] = {
  prompt = "Fix the following code. Only output the result in format ```$filetype\n\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}

gen.prompts['Explain_Code'] = {
  prompt = "Explain the following code: \n$text\n$filetype",
  replace = false,
}

vim.keymap.set('v', '<leader>[', ':Gen Explain_Code<CR>')
vim.keymap.set('v', '<leader>]', ':Gen Fix_Code<CR>')
vim.keymap.set('n', '<leader>ge', ':Gen Chat<CR>')
