set allow-duplicate-recipes

# Update system, flatpaks, and uv tools all at once
update VERB_LEVEL="full":
    #!/usr/bin/bash
    if [ {{ VERB_LEVEL }} = "help" ]; then
        echo "Usage: just update <level>"
        echo "  <level>: Specify the verbosity level - 'full', 'minimal', or 'prompt'"
        echo "  Use 'full' to show full output of each command."
        echo "  Use 'minimal' to show minimal output and indicate success or failure."
        echo "  Use 'prompt' to prompt the user before running each command."
        exit 0
    fi

    # Function to run commands with appropriate verbosity and approval check
    update_command() {
        command=$1
        case "{{ VERB_LEVEL }}" in
            full)
                echo "Running $command..."
                $command
                echo "Completed $command"
                ;;
            minimal)
                echo "Running $command..."
                $command > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                    echo "Completed $command"
                else
                    echo "Failed to complete $command"
                    exit 1
                fi
                ;;
            prompt)
                printf "Do you want to run %s? [Y/n]: " "$command"
                read user_input
                user_input=${user_input:-Y}  # Default to Y if Enter is pressed
                if [ "$user_input" = "Y" ] || [ "$user_input" = "y" ]; then
                    echo "Running $command..."
                    $command
                    echo "Completed $command"
                else
                    echo "Skipped $command"
                fi
                ;;
            *)
                echo "Invalid level: {{ VERB_LEVEL }}. Please use 'full', 'minimal', 'prompt' or 'help' for usage."
                exit 1
                ;;
        esac
    }

    # Run bootc upgrade
    if ! ps aux | grep -v grep | grep -E -q " /sbin/bootc | /bin/bootc | /usr/sbin/bootc | /usr/bin/bootc | bootc "; then
        update_command "pkexec bootc upgrade"
    else
        echo "Bootc update or other related bootc process is already running in the background, skipping."
    fi

    # Run flatpak update
    update_command "flatpak update -y"

    # Run uv tool upgrade
    update_command "uv tool upgrade --all"
