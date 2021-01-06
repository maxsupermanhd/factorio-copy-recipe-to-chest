script.on_event(defines.events.on_entity_settings_pasted, function(event)
	game.print("\n\n=========");
	game.print("Player index: " .. event.player_index);
	game.print("From entity: " .. event.source.name);
	game.print("To entity: " .. event.destination.name);
	
	if(event.destination.prototype.logistic_mode ~= "storage") then -- check that it is logistic storage chest
		game.print("Target is not a logistic storage");
		return;
	end
	if(event.source.prototype.crafting_speed == nil) then -- check if it is assembler or something similar
		game.print("Source is not an assembler");
		return;
	end
	local r = event.source.get_recipe();
	if(r == nil) then -- check that there is a recipe set
		game.print("No recipe set");
		return;
	end
	game.print("Recipe: ["..r.name.."]");
	if(r.prototype.main_product == nil) then -- check that main product exists
		game.print("No main product");
		return;
	end
	local s = r.prototype.main_product;
	if(s.type ~= "item") then -- check that product is item
		game.print("Main product is not an item");
		return;
	end
	game.print("Setting filter to ["..s.name.."]");
	event.destination.storage_filter = game.item_prototypes[s.name];
end)
