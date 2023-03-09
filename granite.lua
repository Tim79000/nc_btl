local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()
local localpref = modname .. ":" .. modname:gsub("^nc_", "") .. "_"



minetest.register_node(modname .. ":granite", {
		description = "Granite",
		tiles = {modname .. "_granite.png"},
		groups = {
			cracky = 1,
			granite = 1
		},
		drop_in_place = "nc_terrain:cobble",
		crush_damage = 2,
		sounds = nodecore.sounds("nc_terrain_stony")
	})

nodecore.register_stone_bricks("granite", "Granite",
	modname .. "_granite.png",
	218, 146,
	modname .. ":granite",
	{cracky = 1},
	{cracky = 2, nc_door_scuff_opacity = 16}
)

nodecore.register_concrete({
		name = "graggregate",
		description = "Graggregate",
		register_dry = false,
		craft_mix = false,
		tile_wet = "nc_btl_granite.png^(nc_fire_ash.png^("
		.. "nc_terrain_gravel.png^[opacity:128)^[mask:nc_concrete_mask.png)",
		sound = "nc_terrain_chompy",
		swim_color = {r = 152, g = 64, b = 64},
		to_crude = "nc_terrain:cobble",
		to_washed = "nc_terrain:gravel",
		to_molded = "nc_concrete:btl_granite_blank_ply"
	})

nodecore.register_concrete_etchable({
		basename = modname .. ":granite",
		pattern_opacity = 96,
		pliant_opacity = 128,
		pliant = {
			sounds = nodecore.sounds("nc_terrain_chompy"),
			drop_in_place = "nc_concrete:graggregate_wet_source",
			silktouch = false
		}
	})






