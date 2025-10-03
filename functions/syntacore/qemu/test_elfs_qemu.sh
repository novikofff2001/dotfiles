_find_elfs() {
    local dir="${1:-.}"
    find "$dir" -type f -name "*.elf" -print0 | xargs -0 -I{} realpath "{}"
}

test_qemu_elfs() {
    local dir="${1:-.}"
    if [[ -z "$QEMU_CMD" ]]; then
        echo "Error: QEMU_CMD is not set."
        return 1
    fi

    eval "set -- $QEMU_CMD"
    local -a base_cmd=( "$@" )

    local -a elfs=()
    while IFS= read -r elf; do elfs+=( "$elf" ); done < <(_find_elfs "$dir")

    local total="${#elfs[@]}"
    local i=0
    for elf in "${elfs[@]}"; do
        i=$((i+1))
        echo "========================================"
        echo "[$i/$total] Running: $elf"
        echo "========================================"

        local -a expanded=()
        local placeholder=0
        local arg
        for arg in "${base_cmd[@]}"; do
            if [[ "$arg" == "{}" ]]; then
                expanded+=( "$elf" )
                placeholder=1
            else
                expanded+=( "$arg" )
            fi
        done
        if [[ $placeholder -eq 0 ]]; then
            expanded+=( "$elf" )
        fi

        "${expanded[@]}"
        local ret=$?
        echo "Exit code: $ret"
        echo "========================================"
    done
}

export my_help="${my_help}test_qemu_elfs() - find all *.elf and run QEMU_CMD on each. Uses '{}' placeholder if present\n\n"
