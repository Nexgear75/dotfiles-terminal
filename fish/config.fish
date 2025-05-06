fish_config theme choose "Dracula Official"

set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

# Unbinding command for fzf commands
bind -e \cf
bind -e \ct
bind -e \cp


# Adding compatibility with sdkman

# Setting up new hotkey for fzf command
fzf_configure_bindings --directory=\cf --history=\ct --processes=\cp

# Unbinding command for vi switching pane
bind -e \cl

# Changing color of syntax highliting
set -g fish_color_command green

# Adding a new ls display with eza
alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"

function lazydocker-bind
	lazydocker
end

bind \cd lazydocker-bind

# Starting a tmux sessions when fish launches
if status is-interactive
    if test -z "$TMUX"
        tmux attach -t default || tmux new -s default
    end
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
