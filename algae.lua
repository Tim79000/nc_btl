local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()

minetest.register_node(modname .. ":algae", {
		description = "Algae",
		tiles = {modname .. "_algae.png"},
		groups = {
			snappy = 1,
			flammable = 3,
			fire_fuel = 3,
			algae = 1
		},
		air_pass = true,
		sounds = nodecore.sounds("nc_terrain_swishy")
	})



