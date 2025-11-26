# Aider Shell

A simple REPL to interactively build and run shell commands using `aider`.

## Installation (macOS/zsh)

1.  Make the script executable:
    ```sh
    chmod +x aider-shell.sh
    ```
2.  Symlink it to a directory in your `$PATH`. This allows you to edit the script in place.
    ```sh
    ln -s "$(pwd)/aider-shell.sh" /usr/local/bin/aider-shell
    ```

## Usage

Start with an initial request:
```sh
aider-shell "list files in this directory"
```

---

*Note: This script has been developed for macOS with zsh and has not been tested on other platforms.*
