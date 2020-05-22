--[[

Lowers gravity the higher (and lower) you get above (or below) sea
level, max gravity at sea level.

]]--


local update = function()
	for _, players in ipairs(minetest.get_connected_players()) do
	    local pos = player:get_pos()
	    local grav = 1
	    if pos.y > 300 then grav = 300/pos.y end
	    if pos.y < -300 then grav = -300/pos.y end
	    player:set_physics_override({gravity=grav})
	end
end

local gravity_timer = 0
local action_timer = 0

local function gravity_globaltimer(dtime)
	gravity_timer = gravity_timer + dtime
	action_timer = action_timer + dtime

	if action_timer > 4 then
		update()
		action_timer = 0
	end
end

minetest.register_globalstep(gravity_globaltimer)

