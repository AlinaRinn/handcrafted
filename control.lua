require("util")

-- last_crafting_length holds 2 values:
-- first, the amount of unique items in the queue
-- second, the count of the current queued item

function accelerate_handcrafting(pid,player)
	local can_accelerate = false --return true if there's crafting to accelerate, even if we didn't do do it just yet
	if player.controller_type == defines.controllers.character and player.crafting_queue_size > 0 then 
		can_accelerate = true
		if player.crafting_queue_progress < 0.3 -- special case to avoid accelerating crafts that are already boosted
		and (storage.last_crafting_length[pid] ~= player.crafting_queue_size or storage.last_crafting_count[pid] ~= player.crafting_queue[1].count) then
			storage.last_crafting_length[pid] = player.crafting_queue_size
			storage.last_crafting_count[pid] = player.crafting_queue[1].count
			local gun_inv = player.get_inventory(defines.inventory.character_guns)
			local ammo_inv = player.get_inventory(defines.inventory.character_ammo)

			local equipped_toolbox
			local equipped_handtools

			local index = player.character.selected_gun_index
			equipped_toolbox, equipped_handtools = gun_inv[index], ammo_inv[index]
			if (equipped_toolbox and equipped_toolbox.valid_for_read and equipped_handtools.valid_for_read and equipped_toolbox.name == 'hand-tool-box') then
				local recipe_id = player.crafting_queue[1].recipe
				local seek_recipe = player.force.recipes[recipe_id]
				if (seek_recipe) then
					-- get values for the crafting speed contribution
					local crafting_energy = math.ceil(seek_recipe.energy)
					local whole_tools = equipped_handtools.count - 1
					local available_energy = equipped_handtools.ammo + (whole_tools * equipped_handtools.prototype.magazine_size)
					local speedup_proportion = equipped_handtools.prototype.reload_time * 0.01

					-- check how much contribution can actually occur
					if (crafting_energy > equipped_handtools.ammo) then
						local non_evenly_dividing_energy = crafting_energy % equipped_handtools.prototype.magazine_size
						local evenly_dividing_energy = (crafting_energy - non_evenly_dividing_energy) / equipped_handtools.prototype.magazine_size
						if (crafting_energy >= available_energy) then -- out of tools, use what we've got as effectively as we can
							speedup_proportion = speedup_proportion * (available_energy / crafting_energy)
							equipped_handtools.count = 1
							equipped_handtools.drain_ammo(equipped_handtools.ammo)
							player.crafting_queue_progress = math.min(player.crafting_queue_progress + speedup_proportion, 0.99)
							storage.last_crafting_length[pid] = 0
							storage.last_crafting_count[pid] = 0
							can_accelerate = false
						else
							equipped_handtools.drain_ammo(non_evenly_dividing_energy)
							local preserve_fractional = equipped_handtools.ammo
							equipped_handtools.count = equipped_handtools.count - evenly_dividing_energy
							equipped_handtools.ammo = preserve_fractional
							player.crafting_queue_progress = math.min(player.crafting_queue_progress + speedup_proportion, 0.99)
						end
					else
						player.crafting_queue_progress = math.min(player.crafting_queue_progress + speedup_proportion, 0.99)
						equipped_handtools.drain_ammo(crafting_energy)
					end

				else -- crafting a recipe we don't have anymore? how? don't care, get us out of here
					storage.last_crafting_length[pid] = 0
					storage.last_crafting_count[pid] = 0
					can_accelerate = false
				end
			else
				storage.last_crafting_length[pid] = 0
				storage.last_crafting_count[pid] = 0
				can_accelerate = false
			end
		end
	else
		storage.last_crafting_length[pid] = 0
		storage.last_crafting_count[pid] = 0
	end
	return can_accelerate
end

function main_handcrafting_loop(event)
	local interval = settings.global["handcrafting-check-interval"].value
	if event.tick % interval == 0 then
		for pid,player in pairs(storage.crafting_players) do
			if player.cheat_mode or player.controller_type == defines.controllers.editor then
				deregister_handcrafting(pid)
			else
				accelerate_handcrafting(pid,player)
			end		
		end
	end
end

function register_handcrafting(pid)
	storage.crafting_players[pid] = game.get_player(pid)
	storage.last_crafting_count[pid] = 0 -- refresh craft detection
end

function deregister_handcrafting(pid)
	storage.crafting_players[pid] = nil
end

script.on_init(function(event) 
	storage.crafting_players = {}
	storage.last_crafting_length = {}
	storage.last_crafting_count = {}
end)

script.on_configuration_changed(function(event) 
	storage.crafting_players = storage.crafting_players or {}
	storage.last_crafting_length = storage.last_crafting_length or {}
	storage.last_crafting_count = storage.last_crafting_count or {}
end)

script.on_event({defines.events.on_player_joined_game,defines.events.on_pre_player_crafted_item,defines.events.on_player_ammo_inventory_changed}, function (event) register_handcrafting(event.player_index) end)
script.on_event({defines.events.on_player_left_game}, function (event) deregister_handcrafting(event.player_index) end)

script.on_nth_tick(1, main_handcrafting_loop)
