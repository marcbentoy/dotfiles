# My dotfiles

This will serve as my remote backup for all my app configs.

These dotfiles are leveraging the concept of `symlink`s. 
With the help of GNU's `stow`, it can be easily mounted managed for version control and backups.

---

## How to setup

### Prerequisites

> [!NOTE]
> If `stow` is not yet installed, run `brew install stow`.

### Example

Example configuration symlink using `stow`:
```shell
stow --no-folding -vt ~ nvim
```
This symlinks the `/nvim` config directory to the root folder. 

---

## Git Guide

### Prerequisites

When stowing the `git` config, you need to setup your SSH Keys first.

You can do this by running the `ssh-keygen` tool:
```shell
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
```

---

## Tmux Guide

My tmux configuration is located in [tmux.conf](file:///Users/marcvbentoy/projects/dotfiles/tmux/.config/tmux/tmux.conf).

### Prerequisites

1. Install tmux
```shell
brew install tmux
```

2. Clone tmux plugin manager
```shell
git clone git@github.com-personal:tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Core Features
- **Default Shell**: `zsh`
- **Mouse Support**: Enabled (allows clicking to select panes/windows, resizing, and scrolling)
- **Window/Pane Indexing**: Starts at `1` instead of `0`. Windows are automatically renumbered when one is closed.

### Keybindings & Controls

| Command / Action | Keybinding | Description |
| --- | --- | --- |
| **Prefix Key** | `Ctrl + Space` | The base key sequence prefix for most tmux commands (rebound from `Ctrl + b`). |
| **Split Pane (Horizontal)** | `Prefix` + `\` | Splits the current pane horizontally (side-by-side) in the current working directory. |
| **Split Pane (Vertical)** | `Prefix` + `-` | Splits the current pane vertically (top-to-bottom) in the current working directory. |
| **Switch Window (Next)** | `Alt + Shift + L` | Switch to the next window. |
| **Switch Window (Prev)** | `Alt + Shift + H` | Switch to the previous window. |
| **Navigate Panes** | `Ctrl + h/j/k/l` | Navigate between tmux panes and Vim splits seamlessly via `vim-tmux-navigator`. |

On macOS, the `alt` key must be set as `option` for it to work.
Specifically for ghostty, it must be set to: `macos-option-as-alt = left`, which already exist on the ghostty config file.


### Copy Mode
Vi-style keybindings are enabled for copy mode (`setw -g mode-keys vi`).
- Enter copy mode: `Prefix` + `[`
- Navigate using standard vim movements (`h`, `j`, `k`, `l`, `w`, `b`, etc.)
- Exit copy mode: `q`

### Plugins
Managed via **TPM (Tmux Plugin Manager)**:
- `tmux-plugins/tpm` — Plugin manager.
- `tmux-plugins/tmux-sensible` — Standard options everyone can agree on.
- `christoomey/vim-tmux-navigator` — Vim/Tmux split integration.
- `egel/tmux-gruvbox` — Gruvbox theme (dark mode).
- **Auto-Restore**: Continuum restore is set to `'on'` (`set -g @continuum-restore 'on'`).

> [!TIP] Installing Plugins
> If plugins are not yet installed, open tmux and press `Prefix` + `I` (Shift + i) to fetch and install the configured plugins using TPM.

---

## Configured Keybindings

### Wezterm

| Keybindings | Description |
| ---------- | ---------- |
| SUPER + r | Rename current wezterm tab title |

### Neovim

For neovim, I just recently used NvChad to have all the important plugins setup. Avoiding the hassle of manually updating my own configuration since I'm mostly using IntelliJ IDEA IDE mostly for editing source codes.

You can use: `<leader> ch` for viewing the cheatsheet for most used commands in NvChad.

---

## Updating dotfiles

> [!IMPORTANT] When Updating dotfiles
> Remember to stow the dotfile directory whenever you add or remove files.

