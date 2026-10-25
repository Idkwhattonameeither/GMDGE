if (global.choice_active)
{

    if (keyboard_check_pressed(ord("Z")))
    {
        global.choice_result = global.choice_index;
        global.choice_active = false;
    }

    exit;
}

if (global.choice_result != -1)
{
    switch (global.choice_result)
    {
        case 0:
            show_debug_message("You chose to fight the box...");
        break;

        case 1:
            show_debug_message("You spared the box... for now.");
        break;
    }

    global.choice_result = -1;
}

if (global.ui_input_lock > 0)
{
    global.ui_input_lock--;
    if (global.ui_input_lock == 0 && is_callable(global.pending_dialogue_callback))
    {
        var cb = global.pending_dialogue_callback;
        global.pending_dialogue_callback = -1;
        cb();
    }
}

