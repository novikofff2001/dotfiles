reload_dt_path() {
    _check_args SC_DT_PATH
    export SC_GCC_PATH="$SC_DT_PATH/riscv-gcc"
    export SC_CLANG_PATH="$SC_DT_PATH/llvm"
    export SC_CMAKE_TOOLCHAINS="$SC_DT_PATH/workspace/cmake-toolchains"
    export SC_GDB_PATH="$SC_DT_PATH/riscv-gdb/bin"
}

export my_help="${my_help}reload_dt_path() - Reload all pathes to Syntacore Devtoolkit subjects\n\n"
