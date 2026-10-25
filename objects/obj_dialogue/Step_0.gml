if (!is_active) exit;

var current_data = dialogue_list[current_line];
var full_text = current_data.text;

// Typewriter effect progression
if (char_index < string_length(full_text)) {
    char_index += text_speed;
}

// Input: Press 'Z' or 'Enter' to advance or instantly skip typing
if (replay_input_pressed(TSA_IN_SHOT) || keyboard_check_pressed(vk_enter)) {
    if (char_index < string_length(full_text)) {
        char_index = string_length(full_text); // Instantly fill text
    } else {
        current_line++;
        char_index = 0;
        
        // Close dialogue when sequence finishes
        if (current_line >= array_length(dialogue_list)) {
            is_active = false;
            instance_destroy();
        }
    }
}