draw_set_alpha(1);
depth = 300;
if (invincible)
{
    if (current_time mod 200 < 100)
        draw_self();
}
else
{
    draw_self();
}