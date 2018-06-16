#!/bin/sh

SESSION_NAME="cot"

tmux has-session -t ${SESSION_NAME}

if [ $? != 0 ]
then
 # Create the session
 tmux new-session -s ${SESSION_NAME} -n generator -d

 #Pane 0
 #First Window cot generator
 tmux send-keys -t ${SESSION_NAME} 'ares && aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'cd lib/generator/cot_generator' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run main.go -outIp 234.1.2.3:1234 -num 250' C-m

 #Pane 2
 tmux split-window -h -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'ares && aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'cd lib/geosub/geosubscriptions' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run main.go' C-m

 #Pane 3
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'ares && aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'cd lib/recorder' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run recorder.go' C-m

 #Pane 1
 tmux select-pane -L -t ${SESSION_NAME}
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'nov && cd executor/distexecutorservice' C-m
 tmux send-keys -t ${SESSION_NAME} 'aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run main.go' C-m

 tmux attach -t ${SESSION_NAME}
else
 tmux attach -t ${SESSION_NAME}

 tmux kill-pane -t ${SESSION_NAME}
 tmux kill-pane -t ${SESSION_NAME}
 tmux kill-pane -t ${SESSION_NAME}
 tmux kill-pane -t ${SESSION_NAME}

 # Create the session
 tmux new-session -s ${SESSION_NAME} -n generator -d

 #Pane 0
 #First Window cot generator
 tmux send-keys -t ${SESSION_NAME} 'ares && aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'cd lib/generator/cot_generator' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run main.go -outIp 234.1.2.3:1234 -num 250' C-m

 #Pane 2
 tmux split-window -h -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'ares && aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'cd lib/geosub/geosubscriptions' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run main.go' C-m

 #Pane 3
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'ares && aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'cd lib/recorder' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run recorder.go' C-m

 #Pane 1
 tmux select-pane -L -t ${SESSION_NAME}
 tmux split-window -v -t ${SESSION_NAME}
 tmux send-keys -t ${SESSION_NAME} 'nov && cd executor/distexecutorservice' C-m
 tmux send-keys -t ${SESSION_NAME} 'aresdev' C-m
 tmux send-keys -t ${SESSION_NAME} 'go run main.go' C-m

fi
