timer--;
if(timer <= 0){
	timer = 0;
	alpha -= 0.02;
}
if(alpha <= 0) instance_destroy();