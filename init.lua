local func = function()
    local player = minetest.get_player_by_name("singleplayer")
    local pos = player:get_pos()
    local grav = 1
    if pos.y > 10 then grav = 10/pos.y end
    player:set_physics_override({gravity=grav})

end

minetest.register_abm({
	nodenames = {
		"air",
		"default:stone",
		"default:dirt",
		"default:sand",
		"default:water_source"
	},
	neighbors = {
		"air",
		"default:stone",
		"default:dirt",
		"default:sand",
		"default:water_source"
	},
	interval = 1,
	chance = 1,
	action = func
})
