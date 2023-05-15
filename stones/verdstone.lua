local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()
local localpref = modname .. ":" .. modname:gsub("^nc_", "") .. "_"



minetest.register_node(modname .. ":verdstone", {
		description = "Verdstone",
		tiles = {"nc_terrain_stone.png^[colorize:chartreuse:40"},
		groups = {
			cracky = 1,
			verdstone = 1
		},
		drop_in_place = "nc_terrain:cobble",
		crush_damage = 2,
		sounds = nodecore.sounds("nc_terrain_stony")
	})

nodecore.register_stone_bricks("verdstone", "Verdstone",
	"nc_terrain_stone.png^[colorize:chartreuse:40",
	218, 146,
	modname .. ":verdstone",
	{cracky = 1},
	{cracky = 2, nc_door_scuff_opacity = 16}
)

nodecore.register_concrete({
		description = "Oliverd",
		tile_powder = "nc_terrain_gravel.png^[colorize:chartreuse:40^(nc_fire_ash.png^[mask:nc_concrete_mask.png)",
		tile_wet = "nc_terrain_stone.png^(nc_fire_ash.png^("
		.. "nc_terrain_gravel.png^[opacity:128)^[mask:nc_concrete_mask.png)"
		.. "^[colorize:chartreuse:40",
		sound = "nc_terrain_chompy",
		groups_powder = {crumbly = 1},
		swim_color = {r = 127, g = 255, b = 0},
		craft_from_keys = {"nc_tree:leaves_loose"},
		craft_from = "nc_tree:leaves_loose",
		to_crude = "nc_tree:leaves_loose",
		to_washed = "nc_tree:leaves_loose",
		to_molded = localpref .. "verdstone_blank_ply"
	})


nodecore.register_concrete_etchable({
		basename = modname .. ":verdstone",
		pattern_opacity = 96,
		pliant_opacity = 128,
		pliant = {
			sounds = nodecore.sounds("nc_terrain_chompy"),
			drop_in_place = "nc_concrete:oliverd_wet_source",
			silktouch = false
		}
	})






