if(!instance_exists(global.next_enemy)) exit;
angle += 1;
draw_set_alpha(0.25);
draw_set_color(c_yellow);

draw_circle(x + lengthdir_x(2, angle), y + lengthdir_y(2, angle), 100, true);

var sides = 6;
var radius = 80;

for (var i = 0; i < sides; i++)
{
    var a1 = angle + i * (360 / sides);
    var a2 = angle + (i + 1) * (360 / sides);

    var x1 = x + lengthdir_x(radius, a1);
    var y1 = y + lengthdir_y(radius, a1);

    var x2 = x + lengthdir_x(radius, a2);
    var y2 = y + lengthdir_y(radius, a2);

    draw_line(x1, y1, x2, y2);
}

for (var i = 0; i < sides; i++)
{
    var a = angle + i * (360 / sides);

    var nx = x + lengthdir_x(radius, a);
    var ny = y + lengthdir_y(radius, a);

    draw_circle(nx, ny, 3, false);
}

var radius2 = 120;
var angle2 = -angle * 0.7;

for (var i = 0; i < sides; i++)
{
    var a1 = angle2 + i * (360 / sides);
    var a2 = angle2 + (i + 1) * (360 / sides);

    var x1 = x + lengthdir_x(radius2, a1);
    var y1 = y + lengthdir_y(radius2, a1);

    var x2 = x + lengthdir_x(radius2, a2);
    var y2 = y + lengthdir_y(radius2, a2);

    draw_line(x1, y1, x2, y2);
}

for (var i = 0; i < sides; i++)
{
    var a = angle2 + i * (360 / sides);

    var nx = x + lengthdir_x(radius2, a);
    var ny = y + lengthdir_y(radius2, a);

    draw_circle(nx, ny, 3, false);
}

for (var i = angle mod 360; i < 720; i += 20)
{
    var x1 = x + lengthdir_x(100, i);
    var y1 = y + lengthdir_y(100, i);

    var x2 = x + lengthdir_x(120, i);
    var y2 = y + lengthdir_y(120, i);

    draw_line(x1, y1, x2, y2);
}
draw_circle(x, y, 120, true);
draw_set_alpha(1);

