add_dummy_sound_output() {
    if [ pactl info >/dev/null 2>&1; ]; then
        pactl unload-module module-null-sink >/dev/null 2>&1 || true
        pactl load-module module-null-sink sink_name=dummy_output \
          sink_properties="device.description='Dummy\ Output',device.icon_name='audio-headphones'" >/dev/null
    fi
}

export my_help="${my_help}add_dummy_sound_output() - Add dummy sound output. Useful for RDP sessions\n\n"
