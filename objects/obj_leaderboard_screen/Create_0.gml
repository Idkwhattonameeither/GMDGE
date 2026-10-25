/// obj_leaderboard_screen — Create

view_mode = 0; // 0 = Normal, 1 = Practice
menu_time = 0;

global.lb_normal = is_array(global.lb_normal)
    ? global.lb_normal : [];

global.lb_practice = is_array(global.lb_practice)
    ? global.lb_practice : [];
	
difficulty_filter = 1; // Normal
shot_filter = 0;      // A