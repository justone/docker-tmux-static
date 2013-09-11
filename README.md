docker-tmux-static
==================

Build static tmux using docker

    docker build -t tmux .
    docker run tmux cat /tmux/tmux > tmux && chmod +x tmux
    docker rmi tmux
