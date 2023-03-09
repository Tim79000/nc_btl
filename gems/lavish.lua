local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()


-- Items

minetest.register_craftitem(modname..":lavish_shard", {
	description = "lavish shard",
	inventory_image = "nc_btl_lavish.png^[mask:" .. modname .. "_shard.png",
	wield_image = "nc_btl_lavish.png^[mask:" .. modname .. "_shard.png",
	sounds = nodecore.sounds("nc_optics_glassy"),
	groups = {
		cracky = 1,
		lavish = 1
		}
})


-- Nodes

minetest.register_node(modname .. ":lavish_block", {
		description = "lavish",
		tiles = {"nc_btl_lavish.png"},
		groups = {
			lavish = 1,
			cracky = 5,
		},
		sounds = nodecore.sounds("nc_optics_glassy")
	})

-- Recipes

nodecore.register_craft({
		label = "forge lavish block",
		action = "pummel",
		toolgroups = {thumpy = 5},
		priority = 10,
		indexkeys = {modname .. ":lavish_shard"},
		nodes = {
			{
				match = {name = modname .. ":lavish_shard", count = 8},
				replace = "air"
			}
		},
		items = {
			modname .. ":lavish_block"
		}
	})

nodecore.register_craft({
		label = "break apart lavish block",
		action = "pummel",
		toolgroups = {choppy = 5},
		indexkeys = {modname .. ":lavish_block"},
		nodes = {
			{
				match = modname .. ":lavish_block",
				replace = "air"
			}
		},
		items = {
			{name = modname .. ":lavish_shard 2", count = 4, scatter = 5}
		}
	})