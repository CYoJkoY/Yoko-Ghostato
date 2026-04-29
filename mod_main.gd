extends Node

const AUTHORNAME_MODNAME_DIR := "Yoko-Ghostato"
const AUTHORNAME_MODNAME_LOG_NAME := "Yoko-Ghostato:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

func _init() -> void:
    ModLoaderLog.info("Init", AUTHORNAME_MODNAME_LOG_NAME)
    mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(AUTHORNAME_MODNAME_DIR)

    add_translations()

    install_script_extensions()

func add_translations() -> void:
    translations_dir_path = mod_dir_path.plus_file("translations")

    ModLoaderMod.add_translation(translations_dir_path.plus_file("Ghostato.en.translation"))
    ModLoaderMod.add_translation(translations_dir_path.plus_file("Ghostato.zh.translation"))

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
