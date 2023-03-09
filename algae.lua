local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()

minetest.register_node(modname .. ":algae_living", {
		description = "Living Algae",
		tiles = {modname .. "_algae.png"},
		groups = {
			snappy = 1,
			algae = 1
		},
		air_pass = true,
		sounds = nodecore.sounds("nc_terrain_swishy")
	})

minetest.register_node(modname .. ":algae_dry", {
		description = "Dry Algae",
		tiles = {modname .. "_algae.png^nc_tree_peat.png"},
		groups = {
			snappy = 1,
			flammable = 3,
			fire_fuel = 3,
			algae = 1
		},
		air_pass = true,
		sounds = nodecore.sounds("nc_terrain_swishy")
	})




