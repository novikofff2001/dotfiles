3x-ui() {
    if [[ ! $# -eq 1 ]]; then
        echo "Usage: $0 <ssh_hostname>"
        return
    fi
    local REMOTE="$1"
    local LOCAL_PORT=2053
    local REMOTE_PORT=2053
    local REMOTE_POSTFIX="strekozel0000"

    ssh -L ${LOCAL_PORT}:localhost:${REMOTE_PORT} -N "${REMOTE}" &
    SSH_PID=$!
    sleep 1

    google-chrome-stable \
     --incognito \
     "http://localhost:${LOCAL_PORT}/${REMOTE_POSTFIX}/" &

    BROWSER_PID=$!
    wait $BROWSER_PID
    kill $SSH_PID 2>/dev/null
    echo "SSH connection closed"
}

export my_help="${my_help}3x-ui() - connect to VPS 3X-UI session\n\n"
