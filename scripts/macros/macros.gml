#macro tile_size 32

#macro DOWN 0
#macro LEFT 1
#macro RIGHT 2
#macro UP 3
#macro bullet_red make_colour_rgb(217, 87, 99)
#macro bullet_blue make_colour_rgb(171, 205, 239)
#macro bullet_green make_colour_rgb(75, 111, 68)

#macro EN 0
#macro VI 1

#macro TSA_IN_LEFT   1
#macro TSA_IN_RIGHT  2
#macro TSA_IN_UP     4
#macro TSA_IN_DOWN   8
#macro TSA_IN_SHOT   16
#macro TSA_IN_BOMB   32
#macro TSA_IN_FOCUS  64

global.language = 0;
global.language_names = ["ENGLISH", "TIẾNG VIỆT"]

function lang_arr(_arr){
	if global.language == 0 return _arr[0];
	if global.language == 1 return _arr[1];
}

function lang(en, vi){
	if global.language == 0 return en;
	if global.language == 1 return vi;
}

global.difficulty = 1;
global.shot_type = 0;
global.shot_type_names = ["A", "B", "C"];
global.shot_desc = ["", "", "",];
global.diff_names = [["EASY", "NORMAL", "HARD", "LUNATIC"], ["DỄ", "TRUNG BÌNH", "KHÓ", "ĐIÊN LOẠN"]];
global.diff_desc = [["Easy is for babies!... Wait, wrong game.", "For Normal players.", "For Tryhards.", "For those who think they're the Chosen Ones. They're not."],
["Chỉ có con nít mới chơi Dễ!... Ủa, lộn game rồi.", "Dành cho người chơi Trung bình.", "Dành cho đám thích thể hiện.", "Dành cho mấy người tin rằng họ là thánh."]];
global.gamemode = 1;
global.gamemode_names = [["DEATHLESS", "NORMAL", "CHEATER"], ["HOÀN MỸ", "BÌNH THƯỜNG", "GIAN LẬN"]];
global.gamemode_desc = [["For even tryhard-ier Tryhards. One death and it's game over.", "The usual experience. Lives are limited, as is the norm.", "For those who think that even Easy is too hard. Infinite lives."],
["Chết cái là thua. Đếm luôn số lần thua, cay chơi.", "Trải nghiệm thông thường, đừng lo.", "Cái đồ ăn gian, chơi vậy ai chơi?"]];
global.retries = 0;
global.deaths = 0;
global.spell_history = {};
global.shot_names = [
    "Homing / Precision",
    "Laser",
    "Reversed-Scope Carpet Bombing"
];

global.shot_desc = [
    [
        "UNFOCUSED SHOT",
        "Homing cards that seek out enemies.",

        "FOCUSED SHOT",
        "Shards of Forgotten Echoes. Shards that aim upwards.",

        "BOMB",
        "Clears all bullets on the screen.",

        "SPECIAL: OPTIONS",
        "Starts with 2 options at 0.00 Power, growing to 5 at 5.00 Power."
    ],
    [
        "SHOT",
        "Laser fire.",

        "BOMB",
        "A long-lasting laser that damages enemies and clears bullets, followed by extended invincibility.",

        "SPECIAL: OPTIONS",
        "Reaches 4 options at 4.00 Power, before the 5.00 Power cap."
    ],
    [
        "SHOT",
        "Wide-area carpet bombing.",

        "POWER BOMBS",
        "Spend Power to clear bullets. Usable at 2.00 Power or above. Minimum Power is 1.00.",
		
        "SPECIAL: POWER",
        "Maximum Power is 8.00. Each Power item is worth more, and you can gain up to 8 options."
    ]
];

function diff(e, n, h, l)
{
    return [e, n, h, l][global.difficulty];
}

function array_index_of(_arr, _val)
{
    for (var i = 0; i < array_length(_arr); i++)
    {
        if (_arr[i] == _val)
        {
            return i;
        }
    }
    return -1;
}

leaderboard_init();