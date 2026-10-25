var total = array_length(global.replay_files);

if (total > 0)
{
    if (keyboard_check_pressed(vk_up))
        replay_index = (replay_index + total - 1) mod total;

    if (keyboard_check_pressed(vk_down))
        replay_index = (replay_index + 1) mod total;

    if (keyboard_check_pressed(vk_enter)
    || keyboard_check_pressed(ord("Z")))
    {
        replay_play_file(global.replay_files[replay_index]);
    }
}

if (keyboard_check_pressed(vk_escape)
|| keyboard_check_pressed(ord("X")))
{
	audio_stop_all();
    room_goto(room_title);
}