# Run sample app
sar() {
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
        echo -e "\nrun ${app} app for ${platform}\n"
        cmake --build "build-clang-${platform}" --target "qemu-${app}"
    )
}

export my_help="${my_help}sar() - run \$app sample app for \$platform. - \$SC_SAMPLE_APPS_PATH required\n\n"
