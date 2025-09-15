# My Neovim Configuration

A modern, portable Neovim configuration powered by lazy.nvim for blazingly fast startup and plugin management. Includes modern development features like fuzzy finding, syntax highlighting, auto-completion, and AI-powered assistance.

## Features

- **Plugin Management**: Lazy.nvim for blazingly fast plugin management and lazy loading
- **Modern Search**: FZF integration for fuzzy file/buffer finding
- **AI Assistant**: GitHub Copilot integration with chat functionality
- **PHP Development**: Laravel-specific shortcuts and PHP namespace support
- **Syntax Highlighting**: Support for PHP, JavaScript, Vue, TypeScript, Twig
- **Code Quality**: ALE linting, trailing whitespace removal, PHP CS Fixer
- **File Navigation**: NERDTree, buffer navigation, split management
- **Portable**: Uses AppImage for consistent Neovim across systems

## Quick Install

```bash
# Clone this repo to your Neovim config directory
git clone https://github.com/sdavis1902/neovim-config ~/.config/nvim

# Install Neovim AppImage (portable)
wget -O ~/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x ~/nvim.appimage
sudo ln -s ~/nvim.appimage /usr/local/bin/nvim

# Open Neovim - lazy.nvim will auto-install and setup plugins
nvim
```

## Dependencies

### Required
- **Git** - For lazy.nvim plugin management
- **Node.js** - For some plugins (Copilot, TreeSitter)

### Optional (Recommended)
- **fzf** - Fuzzy finder for modern search
- **ag (The Silver Searcher)** - Fast text search
- **ctags** - Code navigation

### Install Dependencies (Ubuntu/Debian)
```bash
# Essential tools
sudo apt update
sudo apt install git curl

# Install NVM for Node.js version management
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# Restart terminal or source your profile:
source ~/.bashrc

# Install latest LTS Node.js via NVM
nvm install --lts
nvm use --lts

# FZF setup
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Silver Searcher for fast search
sudo apt install silversearcher-ag

# CTags for code navigation
sudo apt install universal-ctags
```

### Alternative: Direct Node.js Install
If you prefer not to use NVM:
```bash
# Direct Node.js installation
sudo apt install nodejs npm
```

### FZF + AG Configuration
Add to your `~/.bashrc`:
```bash
# fzf + ag configuration
if command -v fzf >/dev/null && command -v ag >/dev/null; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi
```

## Key Mappings

### Leader Key: `,`

### File Navigation
- `Ctrl+p` - Open files (FZF)
- `Ctrl+t` - Search tags
- `Ctrl+o` - Buffer tags
- `Ctrl+b` - Toggle NERDTree
- `Tab` - Next buffer
- `Backspace` - Previous buffer

### Window Management
- `vs` - Vertical split
- `sp` - Horizontal split
- `Ctrl+h/j/k/l` - Navigate between splits
- `,Up/Down/Left/Right` - Navigate splits with arrows

### Search & Replace
- `,<space>` - Clear search highlighting
- `,l` - Toggle line numbers
- `,w` - Remove trailing whitespace

### Development
- `,t` - Generate ctags
- `,pf` - PHP CS Fixer on current file
- `,d` - Generate PHP docblock
- `,n` - Insert PHP use statement
- `,cv` - Copilot Chat with visual selection

### Laravel Shortcuts
- `,lr` - Open routes/web.php
- `,lca` - Open config/app.php

### Convenience
- `jj` - Escape to normal mode
- `;` - Command mode (instead of `:`)
- `,1` - Toggle visible tabs/newlines
- `,ev` - Edit vimrc

## Usage Notes

- **Modern Plugin Management**: Uses lazy.nvim for automatic plugin installation and lazy loading
- **Fast Startup**: Plugins load on-demand for significantly faster startup times
- **Automatic Setup**: First run automatically installs all plugins
- **Plugin UI**: Access with `:Lazy` command for beautiful plugin management interface
- **Performance**: Built-in profiler available with `:Lazy profile`
- Uses onehalflight colorscheme by default
- PHP development optimized with namespace insertion and CS fixing
- Includes helpful vim tips and commands in comments at bottom of init.vim

## Lazy.nvim Features

- **Automatic Installation**: Plugins install automatically on first startup
- **Lazy Loading**: Plugins load only when needed (on file type, command, or key mapping)
- **Beautiful UI**: Modern interface for managing plugins (`:Lazy`)
- **Performance Profiling**: Built-in profiler to identify slow plugins (`:Lazy profile`)
- **Smart Updates**: Only updates when needed
- **Lockfile**: Reproducible plugin versions

## Troubleshooting

### Plugin Issues
```bash
# Open lazy.nvim plugin manager
nvim
# Then in Neovim run: :Lazy
# Or reinstall all plugins with: :Lazy sync
```

### FZF Not Working
```bash
# Ensure FZF is in PATH
which fzf
# If not found, run ~/.fzf/install again
```

### Copilot Setup
```vim
" In Neovim, authenticate with GitHub
:Copilot setup
```

---

*This configuration is designed to be immediately productive on any machine while maintaining portability and ease of setup.*
