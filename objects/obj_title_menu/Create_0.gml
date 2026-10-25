audio_group_load(audiogroup_bgm);
load_spell_history();
/// obj_title_menu — Create Event
global.run_score = 0;
global.run_completed = false;
global.run_stage_cleared = 0;
global.replay_mode = "off";
global.replay_input_mask = 0;
global.replay_previous_input_mask = 0;

menu_page = "main";
menu_index = 0;

menu_items = [
    "GAME START",
    "PRACTICE START",
    "LEADERBOARD",
	"REPLAYS",
    "OPTIONS",
    "CREDITS",
    "QUIT"
];

selected_gamemode = global.gamemode;
selected_difficulty = global.difficulty;
selected_character = 0;
selected_shot = global.shot_type;

character_names = ["MOONY"];

shot_names = global.shot_type_names;

shot_desc = [
    "Shot A: Description to be decided.",
    "Shot B: Description to be decided.",
    "Shot C: Description to be decided."
];

// Initialize the background.
global.practice_mode = false;
global.practice_stage = 0;
star_count = 150;

star_x = array_create(star_count);
star_y = array_create(star_count);
star_size = array_create(star_count);
star_speed = array_create(star_count);

for (var i = 0; i < star_count; i++)
{
    star_x[i] = random(1512);
    star_y[i] = random(1008);
    star_size[i] = random_range(0.7, 2.2);
    star_speed[i] = random_range(0.3, 1.4);
}

particle_count = 24;
particle_angle = array_create(particle_count);
particle_radius = array_create(particle_count);

for (var i = 0; i < particle_count; i++)
{
    particle_angle[i] = random(360);
    particle_radius[i] = random_range(90, 240);
}

practice_stage_number = [
];

practice_stage_name = [
];

practice_splash_color = [
];

practice_stage_controller = [
];

practice_theme = [
];

practice_boss = [
];

audio_play_sound(title, 100, true);

menu_time = 0;
