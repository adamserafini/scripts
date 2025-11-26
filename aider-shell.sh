#!/bin/bash


# Create a unique temporary file and make it executable
temp_script=$(mktemp)
chmod +x "$temp_script"

# Write a shebang to the temp file
echo "#!/bin/bash" > "$temp_script"

# Cleanup function to remove the temporary file on exit
cleanup() {
    echo "Cleaning up..."
    rm -f "$temp_script"
}
trap cleanup EXIT

# Check for initial command argument
if [ -z "$1" ]; then
    echo "Usage: $0 <initial request>"
    exit 1
fi

user_request="$@"

# REPL loop
while [[ "$user_request" != "exit" && "$user_request" != "quit" ]]; do

    echo -n "Generating command"
    # Use aider to modify the script, silently
    aider --yes --no-git "$temp_script" -m "$user_request" >/dev/null 2>&1 &
    pid=$!
    while kill -0 $pid 2>/dev/null; do
        echo -n "."
        sleep 1
    done
    wait $pid
    echo ""

    # Inner loop for Run/Refine/Quit prompt
    while true; do
        echo ""
        echo "Proposed command:"
        tail -n +2 "$temp_script"
        echo ""

        read -p "(r)un, re(f)ine, or (q)uit? " action

        case "$action" in
            r|R)
                echo "Running command..."
                command_to_run=$(tail -n +2 "$temp_script")
                print -s "$command_to_run"
                eval "$command_to_run"
                ;;
            f|F)
                read -p "Enter your refinement: " user_request
                break # break inner loop
                ;;
            q|Q)
                user_request="quit"
                break # break inner loop
                ;;
            *)
                echo "Invalid option."
                # inner loop continues, re-displaying command and prompt
                ;;
        esac
    done
done

echo "Exiting."
