#!/bin/bash
# var for session name (to avoid repeated occurences)
sn=aprendiendoacorrer
BASE="$HOME/paginas_web/aprendiendoacorrer"

# Start the session and window 0 
#   This will also be the default cwd for new windows created
#   via a binding unless overridden with default-path.
cd $BASE
tmux new-session -s "$sn" -n 'vim' -d

# Create a bunch of windows 
cd .
tmux new-window -t "$sn:1" -n 'build'  -d
tmux new-window -t "$sn:2" -n 'serve'  -d

#tmux send-keys -t "$sn:0" "source env/bin/activate; vim" C-m
tmux send-keys -t "$sn:1" "workon aprendiendoacorrer; nikola build" C-m
tmux send-keys -t "$sn:2" "workon aprendiendoacorrer; nikola serve" C-m


#for i in {1..6}; do
    #tmux new-window -t "$sn:$i" -n "var$i"
#done

# Set the default cwd for new windows (optional, otherwise defaults to session cwd)
#tmux set-option default-path /

# Select window #0 and attach to the session
tmux select-window -t "$sn:0"
tmux -2 attach-session -t "$sn"
