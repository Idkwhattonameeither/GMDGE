function start_ingame_dialogue(_lines) {
    if (!instance_exists(obj_dialogue)) {
        instance_create_layer(0, 0, "UI", obj_dialogue);
    }
    
    with (obj_dialogue) {
        dialogue_list = _lines;
        current_line = 0;
        char_index = 0;
        is_active = true;
    }
}