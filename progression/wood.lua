local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()


-- Plank (blasphemy)

minetest.register_node("nc_btl:wooden_plank", {
	description = ("Wooden Plank"),
	tiles = {"nc_woodwork_plank.png"},
        paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5000, -0.5000, -0.5000, 0.5000, 0.000, 0.5000},
		},
	},
	groups = {choppy = 1, flammable = 2, fire_fuel = 1},
	sounds = nodecore.sounds("nc_tree_woody"),
})

local function splitrecipe(choppy, normaly)
	nodecore.register_craft({
			label = "split tree to planks",
			action = "pummel",
			toolgroups = {choppy = choppy},
			normal = {y = normaly},
			check = function(_, data)
				local y = nodecore.facedirs[data.node.param2].t.y
				return y == 1 or y == -1
			end,
			indexkeys = {"group:log"},
			nodes = {
				{match = {groups = {log = true}}, replace = "air"}
			},
			items = {
				{name = "nc_btl:wooden_plank", count = 4, scatter = 5}
			}
		})
end
splitrecipe(1, 1)
splitrecipe(4, -1)


nodecore.register_craft({
		label = "assemble planks",
		normal = {y = 1},
		indexkeys = {"nc_btl:wooden_plank"},
		nodes = {
			{match = "nc_btl:wooden_plank", replace = "air"},
			{y = -1, match = "nc_btl:wooden_plank", replace = "nc_woodwork:plank"}
		}
	})

local function bashrecipe(thumpy, normaly)
	nodecore.register_craft({
			label = "bash plank to sticks",
			action = "pummel",
			toolgroups = {thumpy = thumpy},
			normal = {y = normaly},
			indexkeys = {modname .. ":wooden_plank"},
			nodes = {
				{match = "nc_btl:wooden_plank", replace = "air"}
			},
			items = {
				{name = "nc_tree:stick 2", count = 4, scatter = 5}
			}
		})
end
bashrecipe(3, 1)
bashrecipe(5, -1)

nodecore.register_craft({
		label = "chop apart planks",
		action = "pummel",
		toolgroups = {choppy = 1},
		indexkeys = {"nc_woodwork:plank"},
		nodes = {
			{
				match = "nc_woodwork:plank",
				replace = "air"
			}
		},
		items = {
			{name = modname .. ":wooden_plank", count = 2, scatter = 5}
		}
	})


-- Overides

minetest.override_item("nc_woodwork:plank", {
	description = "Wooden Planks",
})

local function bashrecipe(thumpy, normaly)
	nodecore.register_craft({
			label = "bash planks to sticks",
			action = "pummel",
			toolgroups = {thumpy = thumpy},
			normal = {y = normaly},
			indexkeys = {"nc_woodwork:plank"},
			nodes = {
				{match = "nc_woodwork:plank", replace = "air"}
			},
			items = {
				{name = "nc_tree:stick 4", count = 4, scatter = 5}
			}
		})
end
bashrecipe(3, 1)
bashrecipe(5, -1)

nodecore.register_craft({
		label = "assemble wood shelf",
		action = "stackapply",
		indexkeys = {"nc_woodwork:form"},
		wield = {name = modname .. ":wooden_plank"},
		consumewield = 1,
		nodes = {
			{
				match = {name = "nc_woodwork:form", empty = true},
				replace = "nc_woodwork:shelf"
			},
		}
	})


