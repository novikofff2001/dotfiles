_get_env_var() {
    local var_name="$1"
    [ -z "$var_name" ] && return
    if [ -n "$ZSH_VERSION" ]; then
        echo ${(P)var_name}
    elif [ -n "$BASH_VERSION" ]; then
        echo "${!var_name}"
    else
        echo "get_env_var: unsupported shell" >&2
        return 1
    fi
}
