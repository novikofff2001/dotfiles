get_latest_dt_path() {
    _check_args SC_PATH
    local dir="$SC_PATH/sc-dt"
    local latest_path
    latest_path=$(ls -d "$dir"/*/ 2>/dev/null | sort -V | tail -n 1)
    export SC_DT_PATH="${latest_path%/}"
    echo "${SC_DT_PATH}"
}

export my_help="${my_help}get_latest_dt_path() - Return latest Syntacore devtoolkit path. - \$SC_PATH required\n\n"
