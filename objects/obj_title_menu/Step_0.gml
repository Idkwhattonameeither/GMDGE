
/// obj_title_menu — Step Event

menu_time++;

// Animate stars.
var gw = display_get_gui_width();
var gh = display_get_gui_height();

for (var i = 0; i < star_count; i++)
{
    star_y[i] += star_speed[i] * gh / 1008;

    if (star_y[i] > gh)
    {
        star_y[i] = 0;
        star_x[i] = random(1512);
    }
}

for (var i = 0; i < particle_count; i++)
{
    particle_angle[i] += 0.12 + i * 0.002;
}

// Get the number of choices on this page.
var item_count = 0;

switch (menu_page)
{
    case "main":
        item_count = array_length(menu_items);
        break;

    case "gamemode":
        item_count = array_length(global.gamemode_names[0]);
        break;

    case "difficulty":
        item_count = array_length(global.diff_names[0]);
        break;

    case "character":
        item_count = array_length(character_names);
        break;

    case "shot":
        item_count = array_length(shot_names);
        break;
		
	case "practice_stage":
		item_count = array_length(practice_stage_number);
		break;

    case "options":
    case "credits":
        item_count = 1;
        break;
}

// Navigate.
if (keyboard_check_pressed(vk_up))
    menu_index--;

if (keyboard_check_pressed(vk_down))
    menu_index++;

if (item_count > 0)
    menu_index = (menu_index + item_count) mod item_count;

// Confirm.
if (keyboard_check_pressed(ord("Z"))
|| keyboard_check_pressed(vk_enter))
{
    switch (menu_page)
    {
        case "main":
    switch (menu_index)
    {
        case 0:
    global.practice_mode = false;
    menu_page = "gamemode";
    menu_index = selected_gamemode;
    break;

case 1:
    menu_page = "practice_stage";
    menu_index = 0;
    break;

case 2:
    room_goto(room_leaderboard);
    break;

case 3:
    replay_refresh_list();
    room_goto(room_replays);
    break;

case 4:
    menu_page = "options";
    menu_index = 0;
    break;

case 5:
    menu_page = "credits";
    menu_index = 0;
    break;

case 6:
    game_end();
    break;
    }
    break;
	
		case "practice_stage":
		global.practice_mode = true;
		global.practice_stage = menu_index;
		menu_index = 0;
		menu_page = "gamemode";
		break;
		
        case "gamemode":
            selected_gamemode = menu_index;
            global.gamemode = selected_gamemode;

            menu_page = "difficulty";
            menu_index = selected_difficulty;
            break;

        case "difficulty":
            selected_difficulty = menu_index;
            global.difficulty = selected_difficulty;

            menu_page = "character";
            menu_index = selected_character;
            break;

        case "character":
            selected_character = menu_index;

            menu_page = "shot";
            menu_index = selected_shot;
            break;

        case "shot":
            selected_shot = menu_index;

            // Commit all selected settings.
			audio_stop_sound(title);
            global.gamemode = selected_gamemode;
            global.difficulty = selected_difficulty;
            global.shot_type = selected_shot;
			
            // Initialize the playable character data.
            global.party_leader_data = {
                shmup_version: obj_moony_day_player_shmup
            };
			global.run_stage_reached = 1;
			global.run_cleared = false;
			global.in_battle = true;
			global.in_transition = true;
			if global.practice_mode == false{
				global.run_completed = false;
			global.next_enemy = noone;
			global.stage_controller = noone;
			global.theme = noone;
			global.splash_color = c_lime;
			global.stage_number = "STAGE 1";
			global.stage_name = "The Artist";
			replay_start_recording(false, 0);
			}
			else{
			global.run_stage_reached = global.practice_stage + 1;
			global.run_cleared = false;
			global.run_completed = false;
			global.next_enemy = practice_boss[global.practice_stage];
			global.stage_controller = practice_stage_controller[global.practice_stage];
			global.theme = practice_theme[global.practice_stage];
			global.splash_color = practice_splash_color[global.practice_stage];
			global.stage_number = practice_stage_number[global.practice_stage];
			global.stage_name = practice_stage_name[global.practice_stage];
			replay_start_recording(true, global.practice_stage);
			}
			
			global.replay_invalidated = false;
            // Start the existing danmaku room.
            room_goto(room_shmup);
            break;
			
        case "options":
        case "credits":
            menu_page = "main";
            menu_index = 0;
            break;
    }
}

// Back.
if (keyboard_check_pressed(ord("X"))
|| keyboard_check_pressed(vk_escape))
{
    switch (menu_page)
    {
		case "practice_stage":
		menu_page = "main";
		menu_index = 0;
		break;
		
        case "gamemode":
			if global.practice_mode = true{
			menu_page = "practice_stage";
			}
			else{
            menu_page = "main";
            menu_index = 0;
			}
            break;

        case "difficulty":
            menu_page = "gamemode";
            menu_index = selected_gamemode;
            break;

        case "character":
            menu_page = "difficulty";
            menu_index = selected_difficulty;
            break;

        case "shot":
            menu_page = "character";
            menu_index = selected_character;
            break;

        case "options":
        case "credits":
            menu_page = "main";
            menu_index = 0;
            break;
    }
}

