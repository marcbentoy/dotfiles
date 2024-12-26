# My dotfiles

This will serve as my remote backup of all my dotfiles

Use GNU's `stow` to easily symlink the packages/configurations:
```shell
stow --no-folding -vt ~ nvim
```

Remember to stow the dotfile directory whenever you add or remove files.

---

## Keybindings

### Wezterm

| Keybindings | Description |
| ---------- | ---------- |
| SUPER + r | Rename current wezterm tab title |

### nvim

| Keybindings | Description |
| ---------- | ---------- |
| CTRL + k | Show current file in yazi file manager |
| LEADER + cw | Show current working directory in yazi file manager |

