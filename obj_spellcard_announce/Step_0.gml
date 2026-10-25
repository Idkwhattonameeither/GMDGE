var boss = instance_find(global.next_enemy, 0);

if (!instance_exists(boss) || !boss.spell_active) {
    x = -100; // Hide off-screen
    spellcard_active_prev = false;
} 
else {
    // If a spell card just became active, reset x off-screen to trigger the slide-in
    if (!spellcard_active_prev) {
        x = -200; // Starting position further left for smooth entry
        spellcard_active_prev = true;
        
        // Fetch difficulty-separated spell history
        var diff_keys = ["E", "N", "H", "L"];
        var current_diff = diff_keys[global.difficulty];
        var _key = boss.spell_name + " (" + current_diff + ")";
        
        if (struct_exists(global.spell_history, _key)) {
            var rec = global.spell_history[$ _key];
            var cap_s = string_format(rec.captures, 2, 0);
            var att_s = string_format(!(global.replay_mode == "playback") ? rec.attempts + 1 : rec.attempts, 2, 0);
            // Replace spaces with leading zeros (e.g., " 3" -> "03")
            cap_s = string_replace_all(cap_s, " ", "0");
            att_s = string_replace_all(att_s, " ", "0");
            history_str = cap_s + "/" + att_s;
        } else {
			if(global.replay_mode == "playback"){
            history_str = "00/00";
			}
			else history_str = "00/01";
        }
    }
    
    // Handle sliding movement safely in the Step event
    x += move_speed;
    x = min(x, 20);
}