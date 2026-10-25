function save_spell_history() {
    // Convert the global spell history struct into a JSON string
    var _json = json_stringify(global.spell_history);
    
    // Open a text file for writing (GameMaker automatically handles the sandboxed local directory)
    var _file = file_text_open_write("spell_history.json");
    file_text_write_string(_file, _json);
    file_text_close(_file);
}

function load_spell_history() {
    // Check if a save file exists before trying to read it
    if (file_exists("spell_history.json")) {
        var _file = file_text_open_read("spell_history.json");
        var _json = "";
        
        // Read lines until the end of the file
        while (!file_text_eof(_file)) {
            _json += file_text_read_string(_file);
            file_text_readln(_file);
        }
        file_text_close(_file);
        
        // Parse the JSON string back into a GameMaker struct
        global.spell_history = json_parse(_json);
    } else {
        // If no file exists yet, initialize an empty struct
        global.spell_history = {};
    }
}

function record_spell_result(_spell_name, _captured) {
	if (global.replay_mode != "playback" && global.replay_mode != "playback_finished"){
    if (_spell_name == "") exit; 
    
    // Array of difficulty strings matching global.difficulty (0: Easy, 1: Normal, 2: Hard, 3: Lunatic)
    var diff_keys = ["E", "N", "H", "L"];
    var current_diff = diff_keys[global.difficulty];
    
    // Create a unique composite key for this specific spell + difficulty combo
    var _key = _spell_name + " (" + current_diff + ")";
    
    // Initialize entry if it doesn't exist yet
    if (!struct_exists(global.spell_history, _key)) {
        global.spell_history[$ _key] = {
            spell_name: _spell_name,
            difficulty: current_diff,
            difficulty_id: global.difficulty,
            attempts: 0,
            captures: 0,
            unlocked: false
        };
    }
    
    // Update stats
    var record = global.spell_history[$ _key];
    record.attempts++;
    
    if (_captured) {
        record.captures++;
        record.unlocked = true;
    }
    
    // Save to file immediately
    save_spell_history();
	}
}