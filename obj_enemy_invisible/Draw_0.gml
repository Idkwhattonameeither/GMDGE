// Draw Event (Draws at smooth floating-point positions)
angle += 1;
draw_set_alpha(0.5);
draw_set_color(c_white);

draw_circle(x, y, 20, true);

var sides = 3;
var radius = 20;

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
    var a1 = -angle - i * (360 / sides);
    var a2 = -angle - (i + 1) * (360 / sides);

    var x1 = x + lengthdir_x(radius, a1);
    var y1 = y + lengthdir_y(radius, a1);

    var x2 = x + lengthdir_x(radius, a2);
    var y2 = y + lengthdir_y(radius, a2);

    draw_line(x1, y1, x2, y2);
}
draw_circle(x, y, 10, true);
draw_set_alpha(1);

