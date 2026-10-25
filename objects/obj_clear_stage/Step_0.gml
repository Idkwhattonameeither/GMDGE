if (!cleared){
	add_score(value);
	cleared = true;
}

timer++;

if (timer >= total_time)
{
    instance_destroy();
}