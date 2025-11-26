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

# REPL loop
while true; do

    read -p "Enter your request (or 'exit'/'quit'): " user_request

    if [[ "$user_request" == "exit" || "$user_request" == "quit" ]]; then
        break
    fi

    # Use aider to modify the script
    aider --no-git "$temp_script" -m "$user_request"

    echo "=================================================="
    echo "Current script ($temp_script):"
    echo "--------------------------------------------------"
    cat "$temp_script"
    echo "--------------------------------------------------"
    
    echo "Running script:"
    echo "--------------------------------------------------"
    "$temp_script"
    echo "--------------------------------------------------"
done

echo "Exiting."
