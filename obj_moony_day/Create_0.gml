move_speed = 2;
moving = false;
move_delay = 0;

target_x = x;
target_y = y;

last_hist_x = x;
last_hist_y = y;

facing = 0;
mode = "party";

sprite_index = moony_day_down;
image_speed = 0;
image_index = 0;

move_history = [];
move_history[0] = [x - 32, y];
move_queue = [];

global.party_leader = id;

leader_data = {
    shmup_version: obj_moony_day_player_shmup
};

move_speed = 2;

p1 = obj_p1_moony_tournament;
p2 = obj_p2_moony_tournament;