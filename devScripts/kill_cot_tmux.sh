#!/bin/sh

SESSION_NAME="cot"

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
	echo "Cot session does not exist"
else

tmux attach -t ${SESSION_NAME}
 tmux select-pane -t :.+
 tmux send-keys -t ${SESSION_NAME} C-c

 tmux select-pane -t :.+
tmux send-keys -t ${SESSION_NAME} C-c

 tmux select-pane -t :.+
tmux send-keys -t ${SESSION_NAME} C-c

 tmux select-pane -t :.+
 tmux send-keys -t ${SESSION_NAME} C-c

fi

