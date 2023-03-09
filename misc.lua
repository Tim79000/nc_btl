local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()


-- Sand Piles

minetest.register_craftitem(modname..":lump_sand", {
	description = "Sand Lump",
	inventory_image = "nc_terrain_sand.png^[mask:nc_fire_lump.png",
	wield_image = "nc_terrain_sand.png^[mask:nc_fire_lump.png",
	sounds = nodecore.sounds("nc_terrain_swishy"),
	groups = {
		crumbly = 1,
		}
})

nodecore.register_craft({
		label = "turn sand into lumps",
		action = "pummel",
		toolgroups = {crumbly = 2},
		indexkeys = {"nc_terrain:sand"},
		nodes = {
			{
				match = "nc_terrain:sand",
				replace = "air"
			}
		},
		items = {
			{name = "nc_btl:lump_sand 2", count = 4, scatter = 5}
		}
	})


nodecore.register_craft({
		label = "turn loose sand into lumps",
		action = "pummel",
		toolgroups = {crumbly = 2},
		indexkeys = {"nc_terrain:sand_loose"},
		nodes = {
			{
				match = "nc_terrain:sand_loose",
				replace = "air"
			}
		},
		items = {
			{name = "nc_btl:lump_sand 2", count = 4, scatter = 5}
		}
	})

nodecore.register_craft({
		label = "pack sand lumps into loose sand",
		action = "pummel",
		indexkeys = {modname .. ":lump_sand"},
		nodes = {
			{
				match = {name = modname .. ":lump_sand", count = 8},
				replace = "nc_terrain:sand_loose"
			}
		},
		toolgroups = {thumpy = 1}
	})
