if (!global.choice_active) exit;

if (global.choice_active){
	if (keyboard_check_pressed(vk_up))
		global.choice_index = max(0, global.choice_index - 1); 
		
	if (keyboard_check_pressed(vk_down))
		global.choice_index = min(array_length(global.choice_options), global.choice_index + 1);

	if (keyboard_check_pressed(ord("Z")))
	{
		var result = global.choice_index;
		global.choice_active = false;

		if (is_callable(global.choice_callback))
		{
			var cb = global.choice_callback;
			global.choice_callback = -1;
			cb(result);
		}
	}
}