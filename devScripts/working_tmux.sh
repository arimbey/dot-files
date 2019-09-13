#!/bin/sh

SESSION_NAME="working"

tmux set -g pane-border-status top

 # Create the session
 tmux new-session -s ${SESSION_NAME} -n working -d

 #Pane 0
 #First Window ares client
 tmux send-keys -t ${SESSION_NAME} 'runaresclient' C-m
 tmux select-pane -T ares-client
 tmux resize-pane -L 250

 #Pane 2
 tmux split-window -h -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'debugares' C-m
 tmux select-pane -T ares-server
 tmux resize-pane -L 90

 #Pane 3
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'debugsettings' C-m
 tmux select-pane -T aide-settings
 tmux resize-pane -L 90

 #Pane 3
 tmux split-window -h -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'debuglogcop' C-m
 tmux select-pane -T logcop-server

 #Pane 3
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'logcopclient' C-m
 tmux select-pane -T logcop-client

 #Pane 1
 tmux select-pane -U -t ${SESSION_NAME}
 tmux select-pane -U -t ${SESSION_NAME}
 tmux split-window -h -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'debuggeolayers' C-m
 tmux select-pane -T geolayers

 #For easy command line stuff
 tmux select-pane -L -t ${SESSION_NAME}
 tmux select-pane -L -t ${SESSION_NAME}
 tmux split-window -v -t ${SESSION_NAME}
 tmux select-pane -T cli

 #Fms server log
 tmux select-pane -R -t ${SESSION_NAME}
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'sudo tail -f /var/log/fms/fms.log' C-m
 tmux select-pane -T fms-server


 tmux attach -t ${SESSION_NAME}
