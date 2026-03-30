_core-update:
    @just update

foo:
    @just _core-update

    update_command "uv tool upgrade --all"
