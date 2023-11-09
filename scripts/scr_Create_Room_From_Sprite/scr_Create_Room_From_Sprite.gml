//Functions needed to read proc gen room sprites
//ONLY CALL THESE FUNCTIONS IN THE DRAW EVENT

///@description Creates a 1024x1024 proc gen room from sprite data whose bottom left corner is located at x_offset, y_offset
/// @param spriteIndex
/// @param x_offset
/// @param y_offset
function scr_Create_Room_From_Sprite(spriteIndex, x_offset, y_offset){
	//Read the sprite into an array
	pixelArray = Read_Sprite_To_Array(spriteIndex);
	
	//Create all objects corresponding to the pixel data with matching offsets
	Generate_Block_From_Pixel_Array(pixelArray, x_offset, y_offset)	
}


function Read_Sprite_To_Array(spriteIndex){
	
	var width = sprite_get_width(spriteIndex);
	var height = sprite_get_height(spriteIndex);
	
	//Create a surface. NOTE: should only do this in the draw event for technical reasons
	var surface = surface_create(width, height)
	
	//Apply the sprite to it
	surface_set_target(surface);
	draw_sprite(spriteIndex, 0,0,0);
	surface_reset_target();
	
	//Read it into a buffer
	buffer = buffer_getpixel_begin(surface)
	var total = 0;
	
	//Create Array to store pixel data for easy access
	for(var i = 0; i < width; i++)
	{
		for(var j = 0; j < height; j++)
		{
			//Store pixel data in a 2D array containing an array with [R,G,B] values
			pixelData[i][j] = 
			[buffer_getpixel_r(buffer, i, j, width, height),
			buffer_getpixel_g(buffer, i, j, width, height),
			buffer_getpixel_b(buffer, i, j, width, height),
			buffer_getpixel_a(buffer, i, j, width, height)];
			total++;
			show_debug_message("Read buffer");
			show_debug_message(total);
		}
	}
	return pixelData;
}

function Generate_Block_From_Pixel_Array(pixelArray, x_offset, y_offset)
{
	for(var i = 0; i < array_length(pixelArray); i++)
	{
		for(var j = 0; j <  array_length(pixelArray[0]); j++)
		{
			var RGB = pixelArray[i][j]
			//Objects are placed within the pixel editor in 16 pixel increments, so offsets 
			//are the initial block offset + 16 * their grid location
			object_x_offset = x_offset + 16 * i;
			object_y_offset = y_offset + 16 * j;
			Create_Instance_From_RGB(RGB, object_x_offset, object_y_offset)
		}
	}
}


function Create_Instance_From_RGB(RGB, x_offset, y_offset)
{
	objectToCreate = scr_Get_Object_From_RGB(RGB[0], RGB[1], RGB[2], RGB[3]);
	
	if(objectToCreate != -1)
	test = instance_create_layer(x_offset, y_offset, "Instances", objectToCreate);
}