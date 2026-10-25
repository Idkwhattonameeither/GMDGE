function party_spawn(_x, _y, _party_objects_array) {
    global.party = [];
    
    if (!is_array(_party_objects_array) || array_length(_party_objects_array) == 0) {
        show_debug_message("party_spawn error: No party objects provided!");
        global.party_leader = noone;
        return;
    }
    
    for (var i = 0; i < array_length(_party_objects_array); i++) {
        var obj = _party_objects_array[i];
        var inst = instance_create_layer(_x, _y, "Instances", obj);
        
        inst.party_index = i;
        inst.is_leader = (i == 0);
        inst.target_x = _x;
        inst.target_y = _y;
        inst.moving = false;
        inst.move_queue = [];
        inst.move_speed = 2; // <--- ADDED: Fixes the movement speed bug (adjust as needed)
        
        array_push(global.party, inst);
    }
    
    global.party_leader = global.party[0];
}

// Allows you to change the party leader at any time dynamically
function party_set_leader(_new_leader_inst) {
    var index = -1;
    for (var i = 0; i < array_length(global.party); i++) {
        if (global.party[i] == _new_leader_inst) {
            index = i;
            break;
        }
    }
    if (index == -1) return; // Instance not found in party

    // Reorder global.party so the new leader is at index 0
    var new_party = [];
    array_push(new_party, _new_leader_inst);
    
    for (var i = 0; i < array_length(global.party); i++) {
        var inst = global.party[i];
        if (inst != _new_leader_inst) {
            array_push(new_party, inst);
        }
    }
    global.party = new_party;

    // Refresh all indices, flags, and clear queues to prevent snap bugs
    for (var i = 0; i < array_length(global.party); i++) {
        var inst = global.party[i];
        inst.party_index = i;
        inst.is_leader = (i == 0);
        inst.move_queue = [];
    }
    
    global.party_leader = global.party[0];
	global.party_leader_data = global.party[0].leader_data;
}