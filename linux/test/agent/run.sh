#!/bin/bash

endlessh -p 2222 &
ENDLESSH_JOB=$!

# Chạy agent
./agent

# Khi agent kết thúc, dừng endlessh
kill %$ENDLESSH_JOB
