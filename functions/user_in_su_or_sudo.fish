function user_in_su_or_sudo
    set -l current_pid $fish_pid
    # Traverse up the process tree
    while true
        # Get the parent PID (PPID) and the command used to start the process
        set -l parent_info (ps -o ppid=,comm= -p $current_pid)
        # Break the loop if we've reached the PID 1 or no parent is found
        if test "$current_pid" = "1" -o -z "$parent_info"
            break
        end
        # Check if the command is su or sudo
        set -l command (echo $parent_info | awk '{print $2}')
        switch $command
            case 'su' 'sudo'
                # Su or sudo session detected
                return 0
        end
        # Update current_pid to the parent PID for the next iteration
        set current_pid (echo $parent_info | awk '{print $1}')
    end

    # If the loop completes without finding su or sudo, no such session was detected
    return 1
end