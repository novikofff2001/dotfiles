# Build sample app
sab() {
    _check_args SC_CMAKE_TOOLCHAINS
    [ -n "$1" ] && export platform="$1"
    [ -n "$2" ] && export app="$2"

    if echo "$platform" | grep -q 32; then
        export bit=32
    else
        export bit=64
    fi

    (
        cd $SC_SAMPLE_APPS_PATH
        cmake -S . -B "./build-clang-${platform}" \
            -DCMAKE_TOOLCHAIN_FILE="${SC_CMAKE_TOOLCHAINS}/riscv${bit}-elf-clang.cmake" \
            -DPLATFORM="${platform}" \
            -DOPT=none \
            "${@:3}"
        cmake --build "build-clang-${platform}" --target "${app}"
        echo -e "\nbuild ${app} app for ${platform}\n"
    )
}

export my_help="${my_help}sab() - build \$app sample app for \$platform. - \$SC_CMAKE_TOOLCHAINS, \$SC_SAMPLE_APPS_PATH required\n\n"
