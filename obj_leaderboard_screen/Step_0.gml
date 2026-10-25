/// obj_leaderboard_screen — Step

menu_time++;

if (keyboard_check_pressed(vk_left)
|| keyboard_check_pressed(vk_right))
{
    view_mode = 1 - view_mode;
}

if (keyboard_check_pressed(vk_escape)
|| keyboard_check_pressed(ord("X")))
{
	audio_stop_all();
    room_goto(room_title);
}

if (keyboard_check_pressed(vk_up))
    difficulty_filter =
        (difficulty_filter + 3) mod 4;

if (keyboard_check_pressed(vk_down))
    difficulty_filter =
        (difficulty_filter + 1) mod 4;

if (keyboard_check_pressed(ord("Q")))
    shot_filter = (shot_filter + 2) mod 3;

if (keyboard_check_pressed(ord("E")))
    shot_filter = (shot_filter + 1) mod 3;