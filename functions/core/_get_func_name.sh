_get_func_name() {
    if [ -n "$ZSH_VERSION" ]; then
        if [[ ${#funcstack[@]} -gt 1 ]]; then
            echo "${funcstack[-2]}"
        fi
    elif [ -n "$BASH_VERSION" ]; then
        if [ ${#FUNCNAME[@]} -gt 1 ]; then
            echo "${FUNCNAME[-2]}"
        fi
    else
        echo "Unsupported shell"
    fi
}
