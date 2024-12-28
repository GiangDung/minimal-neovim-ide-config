# Minimal Neovim Configuration with Packer

This repository contains my Neovim configuration managed with [Packer](https://github.com/wbthomason/packer.nvim), a plugin manager for Neovim.

## Table of Contents

1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Plugins](#plugins)
4. [Contributing](#contributing)

---

## Requirements

Ensure you have the following installed:

- **Neovim**: Version 0.10 or higher.
- **Git**: To clone repositories.
- **Packer.nvim**: Plugin manager for Neovim.

## Installation

1. Clone this repository:

    ```bash
    cd ~/.config/
    git clone https://github.com/GiangDung/minimal-neovim-ide-config nvim
    ```

2. Install Packer if not already installed:

    ```bash
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

3. Open Neovim and install plugins:

    ```bash
    nvim ~/.config/nvim/lua/custom-neovim/packer.lua
    ```

    ```vim
    :so
    :PackerSync
    ```
## Plugins

1. **`wbthomason/packer.nvim`**  
   - **Purpose**: Manages Neovim plugins, including itself.

2. **`nvim-telescope/telescope.nvim`**  
   - **Purpose**: A powerful fuzzy finder for files, buffers, and more. It is used for searching and navigating within Neovim.
   - **Dependencies**: `nvim-lua/plenary.nvim` (utility library for Lua-based plugins).

3. **`rose-pine/neovim`**  
   - **Purpose**: A Neovim colorscheme that provides a pleasant, soft color palette.

4. **`nvim-treesitter/nvim-treesitter`**  
   - **Purpose**: Provides enhanced syntax highlighting and code understanding through Tree-sitter parsing.
   - **Post-installation**: Runs `:TSUpdate` to update Treesitter parsers.

5. **`nvim-treesitter/playground`**  
   - **Purpose**: A plugin to visualize and interact with the syntax tree generated by Treesitter.

6. **`ThePrimeagen/harpoon`**  
   - **Purpose**: Provides a way to quickly navigate between files with a list of favorite files (e.g., for fast switching between important files).

7. **`mbbill/undotree`**  
   - **Purpose**: A plugin to visualize and manage the undo history of a file.

8. **`tpope/vim-fugitive`**  
   - **Purpose**: A Git wrapper for Vim/Neovim, offering a variety of Git commands and integration.

9. **`neovim/nvim-lspconfig`**  
   - **Purpose**: A collection of configurations for setting up LSP (Language Server Protocol) servers in Neovim.

10. **`hrsh7th/nvim-cmp`**  
    - **Purpose**: A completion plugin for Neovim that provides autocompletion support for various sources (LSP, buffers, snippets, etc.).

11. **`hrsh7th/cmp-nvim-lsp`**  
    - **Purpose**: Adds LSP support to `nvim-cmp`, enabling LSP-based autocompletion.

12. **`williamboman/mason.nvim`**  
    - **Purpose**: Manages external tools, such as LSP servers, linters, and formatters, directly from within Neovim.

13. **`williamboman/mason-lspconfig.nvim`**  
    - **Purpose**: Integrates `mason.nvim` with `nvim-lspconfig`, making it easier to manage LSP servers.

14. **`windwp/nvim-autopairs`**  
    - **Purpose**: Automatically inserts matching pairs of characters (like parentheses, quotes, etc.) when typing.
    - **Event**: Activated when entering Insert mode.

15. **`numToStr/Comment.nvim`**  
    - **Purpose**: Simplifies commenting and uncommenting lines of code, supporting multiple programming languages.

16. **`David-Kunz/gen.nvim`**  
    - **Purpose**: Local AI support using Ollama.

## Contributing

Feel free to open issues or submit pull requests to improve this configuration.
