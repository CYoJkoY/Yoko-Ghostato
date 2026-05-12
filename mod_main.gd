extends Node

const AUTHORNAME_MODNAME_DIR: String = "Yoko-Ghostato"
const AUTHORNAME_MODNAME_LOG_NAME: String = "Yoko-Ghostato:Main"

var mod_dir_path: String = ""
var extensions_dir_path: String = ""

func _init() -> void:
    ModLoaderLog.info("Init", AUTHORNAME_MODNAME_LOG_NAME)
    mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)

    install_script_extensions()

func install_script_extensions() -> void:
    extensions_dir_path = mod_dir_path.plus_file("extensions")

    var extensions: Array = [
        "utils.gd",
        # KEYS

        "player_run_data.gd",
        # EFFECTS

        "entity_spawner.gd",
        # EFFECTS: gain_stat_every_killed_scaling

    ]

    for path in extensions:
        ModLoaderMod.install_script_extension(extensions_dir_path.plus_file(path))
