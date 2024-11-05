if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursors to an underscore
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    # Set the external cursor to a line. The external cursor appears when a command is started.
    # The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
    set fish_cursor_external line
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block
    zoxide init fish | source
    set -U fish_greeting

end

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# Load aliases and shortcuts if existent.
alias ls='eza'
alias ll='eza -l'
alias cd='z'
alias r='cd $(pwd)'
alias ..='cd ..'
alias uvim='nvim --listen ~/.cache/nvim/com.unity.server.pipe'

alias gitui='gitui -t mocha.ron'

function fish_prompt
    # Get the current working directory and process it
    set cwd (pwd)
    
    # Replace home directory with ~/ if present
    set cwd (string replace -r "^$HOME" "~" $cwd)
    
    set cwd_components (string split '/' $cwd)
    set num_components (count $cwd_components)
    set max_dirs 3

    # Calculate the starting index
    set start_index (math "$num_components - $max_dirs + 1")
    if test $start_index -lt 1
        set start_index 1
    end

    # Get the relevant components
    set display_components $cwd_components[$start_index..$num_components]

    # Prepare the display path
    if test $start_index -gt 1
        # Subtle dark gray for ellipsis
        set_color 484f58     # GitHub dark dimmed text
        printf "..."
        printf "/"
    end

    # Print each directory component with a separator
    set --local last_index (count $display_components)
    for i in (seq (count $display_components))
        set component $display_components[$i]
        if test $i -eq $last_index
            # Current directory slightly brighter
            set_color white  # GitHub dark text
        else
            # Parent directories slightly dimmer
            set_color 7d8590  # GitHub dark secondary text
        end
        printf "%s" $component
        
        if test $i -ne $last_index
            set_color 484f58  # GitHub dark muted
            printf "/"
        end
    end

    # Add space and prompt symbol
    printf " "
    set_color 58a6ff        # GitHub dark blue
    printf "❯ "

    set_color normal
end
