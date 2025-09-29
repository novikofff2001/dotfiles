_check_args() {
    [ $# -eq 0 ] && return
    local missing_args=() var
    for var in "$@"; do
        if [ -z "$(eval _get_env_var "$var")" ]; then
            missing_args+=("$var")
        fi
    done
    if [ ${#missing_args[@]} -gt 0 ]; then
        echo "$(_get_func_name): the next arguments are missing: ${missing_args[*]}" >&2
        return 1
    fi
}
