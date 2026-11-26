# nvim-dotfiles

My Neovim config. Plugins are managed with `vim.pack` and pinned in `nvim-pack-lock.json`.

## New machine setup

### 1. Install the required tools

You need Neovim 0.12 or newer, git, ripgrep, fzf, the tree-sitter CLI, Node.js and npm, a JDK (21 or newer, for jdtls and kotlin-lsp), and a Nerd Font set as your terminal font.

Arch / CachyOS:

```sh
sudo pacman -S neovim git ripgrep fzf tree-sitter-cli nodejs npm jdk-openjdk ttf-jetbrains-mono-nerd
```

macOS:

```sh
brew install neovim git ripgrep fzf tree-sitter-cli node openjdk
brew install --cask font-jetbrains-mono-nerd-font
```

Install the Claude CLI:

```sh
curl -fsSL https://claude.ai/install.sh | bash
```

### 2. Clone the config

```sh
git clone git@github.com:victorprocure/nvim-dotfiles.git ~/.config/nvim
```

Use the SSH URL. The HTTPS URL asks for a username and password when you push.

### 3. First launch

Open `nvim` and accept the prompt to install plugins. After that, two things happen in the background:

- Mason installs the language servers and formatters (`:Mason` shows progress).
- Treesitter downloads and builds the parsers.

Restart nvim once both finish.

### 4. Optional SDKs

These languages need their SDK on your `PATH`. Mason can't install it.

| Language | Install |
| --- | --- |
| Dart / Flutter | Flutter SDK from https://flutter.dev |
| Swift | Xcode on macOS, or the toolchain from https://swift.org on Linux |

Without the SDK, opening a file of that language may show a "failed to start" message. It's harmless.

### 5. Check it works

Run `:checkhealth vim.lsp` in a file of a language you use to confirm the server is attached.
