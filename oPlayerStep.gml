//Check each movement command at the start of every frame
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(ord("W"));

//reset direction value at the start of each frame
dir = 0;

//set direction of movement based on directional input
if(right and left){
	dir = 0;
}
else if(right){
	dir = 1;
}
else if(left){
	dir = -1;
}

//horizontal movement
for (var i = 0; i<walkSpeed; i+=1){ //set the number of pixels the player can move equal to the walkSpeed
	if(!place_meeting(x+dir,y,oWall)){ //collision check
		x += dir;
	}
}

//vertical movement
ySpeed += grav;

for (var i = 0; i<abs(ySpeed); i+=1){ //set the number of pixels the player can move equal to the ySpeed
	if(!place_meeting(x,y+sign(ySpeed), oWall)){ //collision check
		y += sign(ySpeed);
		grounded = false; //states that the player is in the air
	}
	else{
		grounded = true; //states that the player is on the ground
		ySpeed = 0;
	}
}

//jumping
if(jump and grounded){ //checks whether or not the player is on the ground
	ySpeed = jumpSpeed; //only allows them to jump if they are on the ground
}

if(y>850) room_restart();
