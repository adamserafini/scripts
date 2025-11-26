#!/bin/bash

# Check for initial command argument
if [ -z "$1" ]; then
    echo "Usage: $0 <initial command>"
    exit 1
fi

# Create a unique temporary file and make it executable
temp_script=$(mktemp)
chmod +x "$temp_script"

# Write the initial command to the temp file, with a shebang
echo "#!/bin/bash" > "$temp_script"
echo "$@" >> "$temp_script"

# Cleanup function to remove the temporary file on exit
cleanup() {
    echo "Cleaning up..."
    rm -f "$temp_script"
}
trap cleanup EXIT

# REPL loop
while true; do
    echo "=================================================="
    echo "Current script ($temp_script):"
    echo "--------------------------------------------------"
    cat "$temp_script"
    echo "--------------------------------------------------"
    
    echo "Running script:"
    echo "--------------------------------------------------"
    "$temp_script"
    echo "--------------------------------------------------"

    read -p "Enter your request (or 'exit'/'quit'): " user_request

    if [[ "$user_request" == "exit" || "$user_request" == "quit" ]]; then
        break
    fi

    # Use aider to modify the script
    aider --no-git "$temp_script" -m "$user_request"
done

echo "Exiting."
