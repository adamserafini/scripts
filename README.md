# Aider Shell

A simple REPL to interactively build and run shell commands using `aider`.

## Installation (macOS/zsh)

1.  Add the following function to your `~/.zshrc` file.
    Make sure to replace `/path/to/your/aider-shell.sh` with the actual absolute path to where you've cloned this repository.
    ```sh
    aider-shell() {
        source /path/to/your/aider-shell.sh "$@"
    }
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
