--[[

Lowers gravity the higher (and lower) you get above (or below) sea
level, max gravity at sea level.

]]--

local action_timer = 0
local realgthres=minetest.settings:get('real_g_threshold') or 300

local gravity_update = function()
	for _, players in ipairs(minetest.get_connected_players()) do
	    local pos = players:get_pos()
	    local grav = 1
	    if abs(pos.y) > realgthres then grav = abs(realgthres/pos.y) end
	    players:set_physics_override({gravity=grav})
	end
end


local function gravity_globaltimer(dtime)
	action_timer = action_timer + dtime

	if action_timer > 4 then
		gravity_update()
		action_timer = 0
	end
end

minetest.register_globalstep(gravity_globaltimer)

