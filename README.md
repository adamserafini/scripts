# Aider Shell

A simple REPL to interactively build and run shell commands using `aider`.

## Installation (macOS/zsh)

1.  Make the script executable:
    ```sh
    chmod +x aider-shell.sh
    ```
2.  Move it to a directory in your `$PATH`, for example:
    ```sh
    mv aider-shell.sh /usr/local/bin/aider-shell
    ```

## Usage

Start with an initial request:
```sh
aider-shell "list files in this directory"
```

Or start interactively:
```sh
aider-shell
```

---

*Note: This script has been developed for macOS with zsh and has not been tested on other platforms.*
