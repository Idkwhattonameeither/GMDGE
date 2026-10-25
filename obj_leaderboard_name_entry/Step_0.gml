// Limit the name to 8 characters.
keyboard_string = string_copy(keyboard_string, 1, 8);

if keyboard_check_pressed(vk_enter)
{
    leaderboard_add_entry(keyboard_string);
    room_goto(room_leaderboard);
}