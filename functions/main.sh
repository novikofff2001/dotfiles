### Useful aliases
if [ -f "/etc/arch-release" ]; then
    # Arch-based distros
    alias ll="ls -l"
else
    # Debian-based distros
    alias sapt="sudo apt update -y && sudo apt upgrade -y"
fi

# Git
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gr="git rebase"
alias gs="git status"
alias gcl="git clone"
alias gco="git commit"
alias gcp="git cherry-pick"
alias gsh="git show"
alias gst="git stash"
alias gpll="git pull"
alias gpsh="git push"

# Determine sh provider
if [ -n "$BASH_SOURCE" ]; then
    _THIS="${BASH_SOURCE[0]}"
elif [ -n "$ZSH_VERSION" ]; then
    _THIS="${(%):-%N}"
else
    _THIS="$0"
fi

# Load all custom bash scripts
export FUNCTIONS_DIR="$(cd "$(dirname "$_THIS")" && pwd)"
export my_help=""

loader="$(readlink -f "${_THIS}")"
find "$FUNCTIONS_DIR" -type f -name '*.sh' -print0 |
while IFS= read -r -d '' f; do
    f_real="$(readlink -f "$f")"
    [[ "$f_real" == "$loader" ]] && continue
    . "$f_real"
done

help() {
    if [ -n "$BASH_VERSION" ]; then
        command help 2>/dev/null
        echo
    fi
    echo "Custom functions:"
    printf "%b\n" "$my_help"
}
