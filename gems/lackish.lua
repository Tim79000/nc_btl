local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()


-- Items

minetest.register_craftitem(modname..":lackish_shard", {
	description = "Lackish Shard",
	inventory_image = "nc_btl_lackish.png^[mask:" .. modname .. "_shard.png",
	wield_image = "nc_btl_lackish.png^[mask:" .. modname .. "_shard.png",
	sounds = nodecore.sounds("nc_optics_glassy"),
	groups = {
		cracky = 1,
		lackish = 1
		}
})


-- Nodes

minetest.register_node(modname .. ":lackish_block", {
		description = "Lackish",
		tiles = {"nc_btl_lackish.png"},
		groups = {
			cracky = 3,
			lackish = 1,
		},
		sounds = nodecore.sounds("nc_optics_glassy")
	})

-- Recipes

nodecore.register_craft({
		label = "forge lackish block",
		action = "pummel",
		toolgroups = {thumpy = 3},
		priority = 10,
		indexkeys = {modname .. ":lackish_shard"},
		nodes = {
			{
				match = {name = modname .. ":lackish_shard", count = 8},
				replace = "air"
			}
		},
		items = {
			modname .. ":lackish_block"
		}
	})

nodecore.register_craft({
		label = "break apart lackish block",
		action = "pummel",
		toolgroups = {cracky = 3},
		indexkeys = {modname .. ":lackish_block"},
		nodes = {
			{
				match = modname .. ":lackish_block",
				replace = "air"
			}
		},
		items = {
			{name = modname .. ":lackish_shard 2", count = 4, scatter = 5}
		}
	})