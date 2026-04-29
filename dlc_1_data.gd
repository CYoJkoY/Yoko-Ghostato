extends "res://dlcs/dlc_1/dlc_1_data.gd"

# =========================== Extension =========================== #
func curse_item(item_data: ItemParentData, player_index: int, turn_randomization_off: bool = false, min_modifier: float = 0.0) -> ItemParentData:
    if item_data.is_cursed: return item_data

    var new_item_data: ItemParentData =.curse_item(item_data, player_index, turn_randomization_off, min_modifier)
    if has_effect_ghostato(item_data.effects):
        new_item_data = _ghostato_curse_item(new_item_data, player_index, turn_randomization_off, min_modifier)
    return new_item_data

# =========================== Custom =========================== #
func _ghostato_curse_item(item_data: ItemParentData, _player_index: int, turn_randomization_off: bool = false, min_modifier: float = 0.0) -> ItemParentData:
    var max_effect_modifier: float = 0.0
    var new_item_data: ItemParentData = item_data.duplicate()
    var new_effects: Array = []

    for effect in item_data.effects:
        if !is_effect_yztato(effect):
            new_effects.append(effect)
            continue

        var effect_modifier: float = _get_cursed_item_effect_modifier(turn_randomization_off, min_modifier)
        max_effect_modifier = max(max_effect_modifier, effect_modifier)

        var new_effect: Effect = effect.duplicate()
        var id: String = new_effect.get_id()
        var key: int = new_effect.key_hash
        var cskey: int = new_effect.custom_key_hash

        match [id, key, cskey]:
            ["ghostato_gain_stat_every_killed_scaling", _, _]:
                new_effect.scaling_percent = Utils.ncl_curse_effect_value(new_effect.scaling_percent, effect_modifier, {"is_negative": true, "min_num": 1})

        new_effects.append(new_effect)
    new_item_data.effects = new_effects

    return new_item_data

# =========================== Method =========================== #
func has_effect_ghostato(effects: Array) -> bool:
    for effect in effects:
        if is_effect_yztato(effect):
            return true
    return false

func is_effect_yztato(effect: Effect) -> bool:
    return effect.get_id().begins_with("ghostato") or \
    effect.key.begins_with("ghostato") or \
    effect.custom_key.begins_with("ghostato")
