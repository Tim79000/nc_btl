local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()


-- Items

minetest.register_craftitem(modname..":loathish_shard", {
	description = "Loathish Shard",
	inventory_image = "nc_btl_loathish.png^[mask:" .. modname .. "_shard.png",
	wield_image = "nc_btl_loathish.png^[mask:" .. modname .. "_shard.png",
	sounds = nodecore.sounds("nc_optics_glassy"),
	groups = {
		cracky = 1,
		loathish = 1
		}
})


-- Nodes

minetest.register_node(modname .. ":loathish_block", {
		description = "Loathish",
		tiles = {"nc_btl_loathish.png"},
		groups = {
			cracky = 3,
			loathish = 1,
		},
		sounds = nodecore.sounds("nc_optics_glassy")
	})

-- Recipes

nodecore.register_craft({
		label = "forge loathish block",
		action = "pummel",
		toolgroups = {thumpy = 3},
		priority = 10,
		indexkeys = {modname .. ":loathish_shard"},
		nodes = {
			{
				match = {name = modname .. ":loathish_shard", count = 8},
				replace = "air"
			}
		},
		items = {
			modname .. ":loathish_block"
		}
	})

nodecore.register_craft({
		label = "break apart loathish block",
		action = "pummel",
		toolgroups = {cracky = 3},
		indexkeys = {modname .. ":loathish_block"},
		nodes = {
			{
				match = modname .. ":loathish_block",
				replace = "air"
			}
		},
		items = {
			{name = modname .. ":loathish_shard 2", count = 4, scatter = 5}
		}
	})

-- Ore

minetest.register_node(modname .. ":loathish_ore", {
		description = "Loathish Ore",
		tiles = {"nc_terrain_stone.png^nc_btl_loathish.png^[mask:nc_btl_ore_mask.png"},
		groups = {
			cracky = 3,
			loathish = 1,
		},
		sounds = nodecore.sounds("nc_terrain_stony")
	})