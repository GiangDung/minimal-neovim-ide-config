local gen = require('gen')

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
