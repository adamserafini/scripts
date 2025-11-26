# Aider Shell

A simple REPL to interactively build and run shell commands using `aider`.

## Installation (macOS/zsh)

1.  From the repository directory, run this command to add the `aider-shell` function to your `~/.zshrc`:
    ```sh
    printf '\naider-shell() { source "%s/aider-shell.sh" "$@"; }\n' "$(pwd)" >> ~/.zshrc
    ```
2.  Reload your shell configuration for the changes to take effect:
    ```sh
    source ~/.zshrc
    ```

## Usage

Start with an initial request:
```sh
aider-shell "list files in this directory"
```

---

*Note: This script has been developed for macOS with zsh and has not been tested on other platforms.*
