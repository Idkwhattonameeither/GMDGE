global.party = [obj_moony_day, obj_sunny_day, obj_john_day];

global.choice_active = false;
global.choice_options = [];
global.choice_index = 0;
global.choice_result = -1;

global.in_transition = false;
global.ui_input_lock = 0;
global.in_tournament = false;

audio_group_load(audiogroup_bgm);

party_spawn(64, 64, global.party);
global.party_leader_data = global.party[0].leader_data;