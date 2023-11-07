/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

at_edge = (!collision_point(x + sprite_width / 2, y + (sprite_height / 2), obj_ground, false, false))or (!collision_point(x - sprite_width / 2, y + (sprite_height / 2), obj_ground, false, false)); 
at_wall = place_meeting(x + spd, y, obj_ground_parent);
on_ground = instance_place(x,y+1,obj_ground);
end_chasing = false;
edge_side = 0; //left is 0,right is 1;

if(at_edge and collision_point(x + sprite_width / 2, y + (sprite_height / 2), obj_ground, false, false)){
 edge_side = 0;
} 

else if(at_edge and collision_point(x - sprite_width / 2, y + (sprite_height / 2), obj_ground, false, false)){
 edge_side = 1;
}




var player_instance = instance_nearest(x, y, obj_player);

if(at_edge){
 if(distance_to_object(player_instance)<100){
  end_chasing = true;
  if(edge_side = 0){
   if(player_instance.x - x > 0){
   
    spd = 1;
    x += spd
   }
    
   else if (player_instance.x - x < 0){
    spd = 0;
   }
  }
  else{
   if(player_instance.x - x > 0){
    spd = 0;
    
   }
    
   else if (player_instance.x - x < 0){
    
    spd = -1;
    x += spd
   }
  }
  
 }
 
 else if(distance_to_object(player_instance)>100){
   if(edge_side = 0){
   spd = 0.5;
   x += spd;
  }
  else{
   spd = -0.5;
   x += spd;
   }
  }
}
 
else if(!at_edge){
 if(distance_to_object(player_instance)<100){
  if(player_instance.x - x > 0){
   spd = 1;
   x += spd;
   end_chasing = true;
  }
  else if(player_instance.x - x < 0){
   spd = -1;
   x += spd;
  }
 }
 else if(distance_to_object(player_instance)>100){
  if(end_chasing){
  if(player_instance.x - x > 0){
	spd = -0.5;
   end_chasing = false;
  }
  else if(player_instance.x - x < 0){
   spd = 0.5;
   end_chaing = false;
  }
  
  }
  x += spd;
 }
 

}