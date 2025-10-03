### Useful vars
# Common vars
export SC_PATH="/opt/syntacore"
export SC_WS_PATH="$SC_PATH/workspace"

# QEMU
export SC_WS_QEMU_PATH="$SC_WS_PATH/scr-qemu"
export SC_QEMU_PATH="$SC_WS_QEMU_PATH/build"
export QEMU32="$SC_QEMU_PATH/qemu-system-riscv32"
export QEMU64="$SC_QEMU_PATH/qemu-system-riscv64"

# Workspace
export SC_SAMPLE_APPS_PATH="$SC_WS_QEMU_PATH/sample_apps"
export SC_HAL_PATH="$SC_WS_PATH/scr-hal"

### Aliases
# QEMU
alias qbc="qb -c"
alias qk="pkill -9 qemu"
alias qb="$SC_WS_QEMU_PATH/build.sh --syssw --release telecom --os ubuntu"
alias qcp="python3 $SC_WS_QEMU_PATH/.jenkins/utils/check-patch.py | grep ERROR -A 3 || true"
