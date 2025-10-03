toggle_spies() {
    local SPIES=("kesl.service" "wazuh-agent.service")
    if [[ -z $1 || ( $1 != "start" && $1 != "stop" ) ]]; then
        echo "Usage: toggle_spies <start|stop>"
        return 1
    fi
    local service
    for service in "${SPIES[@]}"; do
        echo "Executing: sudo systemctl $1 $service"
        sudo systemctl "$1" "$service"
    done
}

disable_spies() { toggle_spies "stop"; }
enable_spies()  { toggle_spies "start"; }
