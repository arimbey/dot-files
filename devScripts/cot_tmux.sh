#!/bin/sh

SESSION_NAME="cot"

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
 # Create the session
 tmux new-session -s ${SESSION_NAME} -n generator -d

 #Pane 0
 #First Window cot generator
 tmux send-keys -t ${SESSION_NAME} 'rungen' C-m

 #Pane 2
 tmux split-window -h -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'rungeosub' C-m

 #Pane 3
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'runrecorder' C-m

 #Pane 1
 tmux select-pane -L -t ${SESSION_NAME}
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'runexec' C-m

else
 tmux kill-pane -t ${SESSION_NAME}
 tmux kill-pane -t ${SESSION_NAME}
 tmux kill-pane -t ${SESSION_NAME}
 tmux kill-pane -t ${SESSION_NAME}

 # Create the session
 tmux new-session -s ${SESSION_NAME} -n generator -d
#Pane 0
 #First Window cot generator
 tmux send-keys -t ${SESSION_NAME} 'rungen' C-m

 #Pane 2
 tmux split-window -h -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'rungeosub' C-m

 #Pane 3
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'runrecorder' C-m

 #Pane 1
 tmux select-pane -L -t ${SESSION_NAME}
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'runexec' C-m
fi

tmux attach -t ${SESSION_NAME}
