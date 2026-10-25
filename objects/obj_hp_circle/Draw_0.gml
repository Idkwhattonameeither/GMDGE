var boss = instance_find(global.next_enemy, 0);
if(!instance_exists(boss)) exit;
var hp_ratio = boss.hp / boss.maxhp;
hp_ratio = min(hp_ratio, 1);
hp_ratio = max(hp_ratio, 0);
var segments = 400; // smoothness
var angle_step = 360 / segments;

var draw_segments = floor(hp_ratio * segments);

var radius_outer = 40;
var radius_inner = 36;

draw_set_color(c_red);

draw_primitive_begin(pr_trianglestrip);

for (var i = 0; i <= draw_segments; i++)
{
    var ang = i * angle_step + 90;

    var x1 = x + lengthdir_x(radius_outer, ang);
    var y1 = y + lengthdir_y(radius_outer, ang);

    var x2 = x + lengthdir_x(radius_inner, ang);
    var y2 = y + lengthdir_y(radius_inner, ang);

    draw_vertex(x1, y1);
    draw_vertex(x2, y2);
}

draw_primitive_end();
draw_set_color(c_white);