timer--;

if (timer < 60)
{
    alpha -= 0.03; // fade out
}

if (timer <= 0)
{
    instance_destroy();
}