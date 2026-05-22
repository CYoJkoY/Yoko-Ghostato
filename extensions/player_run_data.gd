extends "res://singletons/player_run_data.gd"

# =========================== Extension =========================== #
static func init_stats(all_null_values: bool = false) -> Dictionary:
	if (Utils != null):
		var vanilla_stats =.init_stats(all_null_values)

		var new_stats := {

			Keys.trees_hash: 0, # Avoid assert not stat
			
		}

		new_stats.merge(vanilla_stats)

		return new_stats
	else: return {}

static func init_effects() -> Dictionary:
	if (Utils != null):
		var vanilla_effects =.init_effects()

		var new_effects := {

			Utils.ghostato_gain_stat_every_killed_scaling_hash: [],
			
		}

		new_effects.merge(vanilla_effects)

		return new_effects
	else: return {}
