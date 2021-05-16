Use docker in wsl (Version 1):
Configure docker:
Go to docker settings and check "Expose docker daemon on tcp://localhost2375 without TLS"

Configure WSL to connect to docker for windows:
export DOCKER\_HOST=tcp://127.0.0.1:2375