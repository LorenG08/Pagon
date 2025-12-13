extends Node

#for general area detection
var area_entered = false

#merit
var merit = 0
var merit_verifier = false
var karma = 0
var steal = false
var steal_counter = 0
var plunderer = false
var karma_trigger = false
var good = false
var bad = false

var variable = false
#for first level
var left = false
var right = false
var up = false
var lower = false
var sides = 0
var side_verifier = false
var has_met_sign: bool = false 

#for level 2
# donations handler
var Farmer_donation: bool = false
var Farmer_done_donate: bool = false
var Farmer2_donation: bool = false
var Farmer2_done_donate: bool = false
var Farmer3_donation: bool = false
var Farmer3_done_donate: bool = false
var donation_counter = 0
var donation_verifier = false
var donation_done = false
var donated = false
var done = false
var is_captain_angry = false
var captain_offer = false
var become_captain = false
var become_coustgaurd = false

#fruits
var picked_fruit1: bool = false
var fruit1_holder: bool = false
var picked_fruit2: bool = false
var fruit2_holder: bool = false
var picked_fruit3: bool = false
var fruit3_holder: bool = false
var fruit_counter = 0
var fruit_verifier = false

var pass_ernesto = false
var has_orange_flower = false
var start = false
var came_from = false
var tester_done = false


#tree
var has_axe: bool = false
var cut1_tree : bool = false
var cut1_counter = false
var cut2_tree : bool = false
var cut2_counter = false
var cut3_tree : bool = false
var cut3_counter = false
var tree_verifier = false
var tree_counter = 0
#james
var has_met_james :bool = false
var has_help_james = false
#john
var has_met_john : bool = false
var done_meeting_john: bool = false
#mary
var has_met_mary : bool = false
var done_james = false
#ending
var next_level = false
var space = false

var volunteer1 = false
var volunteer2 = false
var volunteer3 = false
var has_met_guard = false
var goods_counter = 0
var has_goods = false

var end_game = false
var game_done = false


func _process (delta):
#for donations
	if Farmer_done_donate == true:
		if Farmer_donation == true:
			donation_counter +=1
			merit += 1
			Farmer_donation = false
	elif Farmer2_done_donate == true:
		if Farmer2_donation == true:
			donation_counter +=1
			merit += 1
			Farmer2_donation = false
	elif Farmer3_done_donate == true:
			if Farmer3_donation == true:
				donation_counter +=1
				merit += 1
				Farmer3_donation = false
	
	if donation_done == true:
		merit = merit + 3
		donation_done = false
	if merit > 6:
		merit_verifier = true
	



	if has_help_james == true:
		merit = merit + 3
		has_help_james = false
		done_james = true
	#karma
	if is_captain_angry == true:
		karma = karma + 3
	# donation_veryfier
	if donation_counter >= 1:
		donation_verifier = true
	if fruit_counter >= 1:
		fruit_verifier = true
	


	# for fruits
	if picked_fruit1 == true:
		if fruit1_holder == true:
			fruit_counter += 1
			picked_fruit1 = false
	if picked_fruit2 == true:
		if fruit2_holder == true:
			fruit_counter += 1
			picked_fruit2 = false
	if picked_fruit3 == true:
		if fruit3_holder == true:
			fruit_counter += 1
			picked_fruit3 = false
#for tree
	if cut1_tree == true:
		if cut1_counter == true:
			tree_counter += 1
			cut1_counter = false
	if cut2_tree == true:
		if cut2_counter == true:
			tree_counter += 1
			cut2_counter = false
	if cut3_tree == true:
		if cut3_counter == true:
			tree_counter += 1
			cut3_counter = false
	if tree_counter >= 1:
		tree_verifier = true

	if sides == 4: 
		side_verifier = true

	if volunteer1 == true:
		goods_counter = goods_counter+1
	if volunteer2 == true:
		goods_counter = goods_counter+1
	if volunteer3 == true:
		goods_counter = goods_counter+1
	if goods_counter ==3:
		has_goods = true

	if has_orange_flower == true and start == true:
		tester_done = true


	if steal == true:
		steal_counter = steal_counter + 1
		steal = false
	if karma_trigger == true :
		karma = karma + 1 
		karma_trigger = false

	if merit > karma:
		good = true
	if karma > merit:
		bad = true
	if steal_counter > 10:
		plunderer = true

# save and load
var save_path := "user://savegame.save"

# --- Save the current scene and player position ---
func save_game():
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		print("No player found to save.")
		return
	
	var save_data = {
		"scene": get_tree().current_scene.scene_file_path,
		"player_position": player.position
	}
	
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()
	print("Game saved successfully!")

# --- Load the last saved scene and restore player position ---
func load_game():
	if not FileAccess.file_exists(save_path):
		print("No save file found.")
		return
	
	var file = FileAccess.open(save_path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	
	if typeof(data) != TYPE_DICTIONARY:
		print("Save file corrupted.")
		return
	
	get_tree().change_scene_to_file(data["scene"])
	await get_tree().process_frame  # wait for scene to load
	
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.position = data["player_position"]
		print("Game loaded successfully!")
	else:
		print("Player not found in loaded scene.")
