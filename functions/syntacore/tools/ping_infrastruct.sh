ping_infrastruct() {
    local GREEN='\033[0;32m' RED='\033[0;31m' NC='\033[0m'
    local sites=(
        "c.yadro.com" "j.yadro.com" "chat.yadro.com" "drive.yadro.com"
        "exchange.yadro.com" "team.yadro.com" "artifactory.dev.syntacore.com"
        "hwrs.dev.syntacore.com" "gitlab.dev.syntacore.com" "jenkins.dev.syntacore.com"
    )
    local w=30 s
    for s in "${sites[@]}"; do
        if ping -c 1 -W 2 "$s" >/dev/null 2>&1; then
            printf "%-${w}s %b\n" "$s" "${GREEN}ok${NC}"
        else
            printf "%-${w}s %b\n" "$s" "${RED}not ok${NC}"
        fi
    done
}

export my_help="${my_help}ping_infrastruct() - check access to the most relevant sites\n\n"
