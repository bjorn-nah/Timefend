/* #include "huc.h" */
#include "sprite.h"

#define DIR_LEFT 1
#define DIR_RIGHT 2
#define DIR_UP 3
#define DIR_DOWN 4
#define DIR_LEFT_UP 5
#define DIR_RIGHT_UP 6
#define DIR_LEFT_DOWN 7
#define DIR_RIGHT_DOWN 8

#define CENTER_X 120
#define CENTER_Y 104

#incspr(knight,"knight5.pcx",0,0,2,30);
#incpal(knightpal,"knight5.pcx");

#incspr(ennemy,"ennemy.pcx",0,0,1,3);
#incpal(ennemypal,"ennemy.pcx");

#incbin(levelmap,"timeline.FMP");
#inctile_ex(leveltiles,"tile.pcx",0,0,6,7,0);
#incpal(levelpal0,"tile.pcx");


int knight_x, knight_y, tics_knight, frame_knight, state_knight, dir_knight, walk_knight, j1;
int ennemy_x, ennemy_y;
int univers_time, time_move;
int counter;
int table_x[16], table_y[16], table_z[16], nb_ennemy;
int table_x_2[16], table_y_2[16], table_z_2[16], nb_ennemy_2;
int table_x_3[16], table_y_3[16], table_z_3[16], nb_ennemy_3;
int ram_knight_addr,ram_knight_addr2, ram_knight_atk1, ram_knight_atk2, ram_knight_atk3;
char castle_1, castle_2, castle_3, alive_iter, alive_total, init_cnt_alive;

timefend()
{
	int init_z;
	cls();
	set_map_data(levelmap,48,14);
	set_tile_data(leveltiles);
	load_tile(0x1000);
	load_map(0,0,0,0,32,14);
	load_palette(0,levelpal0,1);

	ram_knight_addr = 0x5000;
	ram_knight_addr2 = 0x5100;
	ram_knight_atk1 = 0x5600;
	ram_knight_atk2 = 0x5700;
	ram_knight_atk3 = 0x5800;
	
	spr_make(0,112,96,ram_knight_addr,FLIP_MAS|SIZE_MAS,NO_FLIP|SZ_32x32,0,1);
	set_sprpal(0,knightpal,1);
	load_vram(ram_knight_addr,knight,0x1500);
	
	/* spr_make(1,0,0,0x7000,FLIP_MAS|SIZE_MAS,NO_FLIP|SZ_16x16,1,1); */
	set_sprpal(1,ennemypal,1);
	load_vram(0x7000,ennemy,0x100);


	state_knight = 0;
	tics_knight = 0;
	walk_knight = 0;
	frame_knight = 0;

	knight_x = 112;
	knight_y = 96;

	ennemy_x = 0;
	ennemy_y = 0;
	nb_ennemy = 0;
	nb_ennemy_2 = 0;
	nb_ennemy_3 = 0;

	time_move = 0;
	univers_time = 1;

	counter = 0;

	for(init_z=0;init_z<16;init_z++)
	{
		table_z[init_z] = 1;
		table_z_2[init_z] = 1;
		table_z_3[init_z] = 1;
	}
	
		castle_1 = 4;
		castle_2 = 4;
		castle_3 = 4;
		
	init_cnt_alive=0;
		alive_total = 0;
	alive_iter =  0;
	
	
	set_font_color(1, 0);
	load_default_font();
	
	
	for(;;)
	{
		vsync();
		
		j1 = joy(0);
		/* put_number(counter , 5 , 5, 0); */

		counter++;
		
		player_machine();
		ennemy_machine();
		physique();
	castle_machine();
		
	if ((castle_1 + castle_2 + castle_3) == 0)
	{
		vsync(700);
		init_satb();
		reset_satb();
		satb_update(); /* pasque si tu maj pas, ça marche pas */
		main();
	}	
	else {
	for(init_cnt_alive = 0;init_cnt_alive<16;init_cnt_alive++){
		alive_iter = table_z[init_cnt_alive] + table_z_2[init_cnt_alive] + table_z_3[init_cnt_alive];
		alive_total += alive_iter;
		
		alive_iter = 0;
		
	}
	/* put_number(alive_total, 5, 5, 1); */
	if (alive_total == 0) {
		put_string("T'as la win ! ", 4, 12);
	put_string("Et là haut ils aiment ça.", 4, 13);
	put_string(alive_iter, 8, 15);
	/* vsync(700);	
	cls(); */
	}
	else {
		init_cnt_alive = 0;
		alive_total = 0;
	}
}

		
		

		satb_update();
	}

}

player_machine()
{
/*
	0 - Repos
	1 - Marche
	2 - Frappe
	3 - Meurt
	4 - Warp
*/
	spr_set(0);
	
	switch (univers_time){
		case 1 :
			ram_knight_addr = 0x5000;
			ram_knight_addr2 = 0x5100;
			ram_knight_atk1 = 0x5600;
	ram_knight_atk2 = 0x5700;
	ram_knight_atk3 = 0x5800;
			break;
		case 2 : 
			ram_knight_addr = 0x5200;
			ram_knight_addr2 = 0x5300;
			ram_knight_atk1 = 0x5900;
	ram_knight_atk2 = 0x5A00;
	ram_knight_atk3 = 0x5B00;
			break;
		case 3 : 
			ram_knight_addr = 0x5400;
			ram_knight_addr2 = 0x5500;
			ram_knight_atk1 = 0x5C00;
	ram_knight_atk2 = 0x5D00;
	ram_knight_atk3 = 0x5E00;
			break;
		default :
			ram_knight_addr = 0x5000;
			ram_knight_addr2 = 0x5100;
			ram_knight_atk1 = 0x5600;
	ram_knight_atk2 = 0x5700;
	ram_knight_atk3 = 0x5800;
			break;
	}
	if ( state_knight == 0) player_knight_0();
	if ( state_knight == 1) player_knight_1();
	if ( state_knight == 2) player_knight_2();
	if ( state_knight == 3) player_knight_3();
	if ( state_knight == 4) player_knight_4();
}

player_knight_0()
{
	/*	
	if ( tics_knight == 0 ) spr_pattern(ram_knight_addr);
	tics_knight = 1;
	*/
	tics_knight++;
	if (tics_knight > 6)
	{
		tics_knight = 0;
		frame_knight++;
		if (frame_knight > 1) frame_knight = 0;
		if (frame_knight == 0) spr_pattern(ram_knight_addr);
		if (frame_knight == 1) spr_pattern(ram_knight_addr2);

	}
	
	if (j1 & JOY_LEFT)
	{
		/* spr_ctrl(FLIP_X_MASK,FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_LEFT;
	}
	if (j1 & JOY_RGHT)
	{
		/* spr_ctrl(FLIP_X_MASK,NO_FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_RIGHT;
	}
	if (j1 & JOY_UP)
	{
		/* spr_ctrl(FLIP_X_MASK,FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_UP;
	}
	if (j1 & JOY_DOWN)
	{
		/* spr_ctrl(FLIP_X_MASK,FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_DOWN;
	}

	if (j1 & JOY_LEFT && j1 & JOY_UP)
	{
		/* spr_ctrl(FLIP_X_MASK,FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_LEFT_UP;
	}
	if (j1 & JOY_RGHT && j1 & JOY_UP)
	{
		/* spr_ctrl(FLIP_X_MASK,FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_RIGHT_UP;
	}
	if (j1 & JOY_LEFT && j1 & JOY_DOWN)
	{
		/* spr_ctrl(FLIP_X_MASK,FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_LEFT_DOWN;
	}
	if (j1 & JOY_RGHT && j1 & JOY_DOWN)
	{
		/* spr_ctrl(FLIP_X_MASK,FLIP_X); */
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 1;
		spr_pattern(ram_knight_addr);
		dir_knight = DIR_RIGHT_DOWN;
	}

	if (j1 & JOY_A)
	{
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 2;
		spr_pattern(ram_knight_addr);
		
	}

	if (j1 & JOY_B && j1 & JOY_LEFT)
	{
		time_move = DIR_LEFT;
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 4;
		spr_pattern(ram_knight_addr);
	}
	if (j1 & JOY_B && j1 & JOY_RGHT)
	{
		time_move = DIR_RIGHT;
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 4;
		spr_pattern(ram_knight_addr);
	}
}

player_knight_1()
{
	walk_knight = 0;
	tics_knight++;
	if (tics_knight > 6)
	{
		tics_knight = 0;
		frame_knight++;
		if (frame_knight > 3) frame_knight = 0;
		if (frame_knight == 0) spr_pattern(ram_knight_addr);
		if (frame_knight == 1) spr_pattern(ram_knight_addr2);
		if (frame_knight == 2) spr_pattern(ram_knight_addr);
		if (frame_knight == 3) spr_pattern(ram_knight_addr2);
	}
	/*
	if (j1 & JOY_LEFT && dir_knight == DIR_LEFT) walk_knight = 1;
	if (j1 & JOY_RGHT && dir_knight == DIR_RIGHT) walk_knight = 1;
	if (j1 & JOY_UP && dir_knight == DIR_UP) walk_knight = 1;
	if (j1 & JOY_DOWN && dir_knight == DIR_DOWN) walk_knight = 1;

	if (j1 & JOY_LEFT && j1 & JOY_UP && dir_knight == DIR_LEFT_UP) walk_knight = 1;
	if (j1 & JOY_RGHT && j1 & JOY_UP && dir_knight == DIR_RIGHT_UP) walk_knight = 1;
	if (j1 & JOY_LEFT && j1 & JOY_DOWN && dir_knight == DIR_LEFT_DOWN) walk_knight = 1;
	if (j1 & JOY_RGHT && j1 & JOY_DOWN && dir_knight == DIR_RIGHT_DOWN) walk_knight = 1;
	*/

	if (j1 & JOY_LEFT)
	{
		dir_knight = DIR_LEFT;
		walk_knight = 1;
	}
	if (j1 & JOY_RGHT)
	{
		dir_knight = DIR_RIGHT;
		walk_knight = 1;
	}
	if (j1 & JOY_UP)
	{
		dir_knight = DIR_UP;
		walk_knight = 1;
	}
	if (j1 & JOY_DOWN)
	{
		dir_knight = DIR_DOWN;
		walk_knight = 1;
	}

	if (j1 & JOY_LEFT && j1 & JOY_UP)
	{
		dir_knight = DIR_LEFT_UP;
		walk_knight = 1;
	}
	if (j1 & JOY_RGHT && j1 & JOY_UP)
	{
		dir_knight = DIR_RIGHT_UP;
		walk_knight = 1;
	}
	if (j1 & JOY_LEFT && j1 & JOY_DOWN)
	{
		dir_knight = DIR_LEFT_DOWN;
		walk_knight = 1;
	}
	if (j1 & JOY_RGHT && j1 & JOY_DOWN)
	{
		dir_knight = DIR_RIGHT_DOWN;
		walk_knight = 1;
	}

	if (j1 & JOY_A)
	{
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 2;
		/* spr_pattern(ram_knight_addr); */
	}
	if (walk_knight == 0)
	{
		tics_knight = 0;
		frame_knight = 0;
		state_knight = 0;
	}
	
	else
	{
		if(dir_knight == DIR_LEFT) knight_x-=2;
		if(dir_knight == DIR_RIGHT) knight_x+=2;
		if(dir_knight == DIR_UP) knight_y-=2;
		if(dir_knight == DIR_DOWN) knight_y+=2;
	
		if(dir_knight == DIR_LEFT_UP) 
		{ 
			knight_x-=2;
			knight_y-=2;
		}
		if(dir_knight == DIR_RIGHT_UP)
		{ 
			knight_x+=2;
			knight_y-=2;
		}
		if(dir_knight == DIR_LEFT_DOWN)
		{ 
			knight_x-=2;
			knight_y+=2;
		}
		if(dir_knight == DIR_RIGHT_DOWN)
		{ 
			knight_x+=2;
			knight_y+=2;
		}
		if(knight_x < 0) knight_x=0;
		if(knight_x > 224) knight_x=224;
		if(knight_y < 0) knight_y=0;
		if(knight_y > 192) knight_y=192;
		
	}
		
}

player_knight_2()
{
	/* int table_x_loc, table_y_loc, i, diff_x, diff_y; */
	int i, diff_x, diff_y;
	
	
	tics_knight++;
	
	if (tics_knight > 6)
	{
		tics_knight = 0;
		frame_knight++;
		if (frame_knight > 2){
			frame_knight = 0;
			state_knight = 0;
		}
		/* if (frame_knight == 0) spr_pattern(ram_knight_addr);
		if (frame_knight == 1) spr_pattern(ram_knight_atk1);
		if (frame_knight == 2) spr_pattern(ram_knight_atk2);
		if (frame_knight == 3) spr_pattern(ram_knight_atk3);
		if (frame_knight == 4) spr_pattern(ram_knight_atk2);
		if (frame_knight == 5) spr_pattern(ram_knight_addr); */
		
		if (frame_knight == 0) spr_pattern(ram_knight_atk1);
		if (frame_knight == 1) spr_pattern(ram_knight_atk2);
		if (frame_knight == 2) spr_pattern(ram_knight_atk3);
		

	}
	
	
	/* switch(univers_time){
	case 1 :
	table_x_loc = *table_x;
	table_y_loc = *table_y;
	break;
	case 2 :
	table_x_loc = *table_x_2;
	table_y_loc = *table_y_2;
	break;
	case 3 :
	table_x_loc = *table_x_3;
	table_y_loc = *table_y_3;
	break;
	} */
	for(i=0;i<nb_ennemy;i++)
	{
		switch(univers_time){
		case 1 :
		diff_x = table_x[i]- knight_x;
		diff_y = table_y[i]- knight_y;
		break;
		case 2 :
		diff_x = table_x_2[i]- knight_x;
		diff_y = table_y_2[i]- knight_y;
		break;
		case 3 :
		diff_x = table_x_3[i]- knight_x;
		diff_y = table_y_3[i]- knight_y;
		break;
		}
		if(diff_x > -16 && diff_x < 32 && diff_y > -16 && diff_y < 32)
		{
			switch(univers_time){
			case 1 :
			table_z[i]=0;
			break;
			case 2 :
			table_z_2[i]=0;
			break;
			case 3 :
			table_z_3[i]=0;
			break;
			}
		}
			
	}
	/* state_knight = 0; */
}

player_knight_3()
{
	state_knight = 0;
}

player_knight_4()
{
	int i, shipx;

	if(univers_time == 1 && time_move == DIR_RIGHT) 
	{
		/* load_map(0,0,0,0,32,14); */
		shipx = 0;
		for(i=0;i<256;i++)
		{
			shipx++;
			scroll(0,shipx,0,0,253,0xC0);
			if (i%5 == 0) {
				vsync();
			}
		}		
	}
	if(univers_time == 2 && time_move == DIR_RIGHT) 
	{
		load_map(0,0,16,0,32,14);
		shipx = 0;
		for(i=0;i<256;i++)
		{
			shipx++;
			scroll(0,shipx,0,0,253,0xC0);
			if (i%5 == 0) {
				vsync();
			}
		}
	}
	if(univers_time == 2 && time_move == DIR_LEFT) 
	{
		load_map(0,0,0,0,32,14);
		shipx = 256;
		for(i=0;i<256;i++){
		shipx--;
		scroll(0,shipx,0,0,253,0xC0);
		if (i%5 == 0) {
			vsync();
		}
		}
	}
	if(univers_time == 3 && time_move == DIR_LEFT)
	{
		/* load_map(0,0,16,0,32,14);*/
		shipx = 256;
		for(i=0;i<256;i++){
		shipx--;
		scroll(0,shipx,0,0,253,0xC0);
		if (i%5 == 0) {
			vsync();
		}
		}
	}
	if (time_move == DIR_LEFT)
	{
		if (univers_time > 1) univers_time--;
	}
	if (time_move == DIR_RIGHT)
	{
		if (univers_time < 3) univers_time++;
	}
	state_knight = 0;
}

physique()
{
	spr_put(0,knight_x,knight_y, dir_knight);
}

ennemy_machine()
{
	int i;


	if(counter%100 == 0 && nb_ennemy < 16)
	{
		nb_ennemy++;
		ennemy_cre();
	}

	if(counter%10 == 0)
	{
		for (i=0;i<nb_ennemy;i++)
		{
			if(table_x[i] < CENTER_X) table_x[i]++;
			if(table_x[i] > CENTER_X) table_x[i]--;
			if(table_y[i] < CENTER_Y) table_y[i]++;
			if(table_y[i] > CENTER_Y) table_y[i]--;
			if (table_z[i] == 1  && table_x[i] == CENTER_X && table_y[i] == CENTER_Y){
				if (castle_1 > 0){
					castle_1 -= 1;
					if (castle_2 > 0) castle_2 -= 1;
					if (castle_3 > 0) castle_3 -= 1;
					table_z[i] = 0;
				}
				else {
					table_z[i] = 0;
				}
					
			}
			
			
			if(table_x_2[i] < CENTER_X) table_x_2[i]++;
			if(table_x_2[i] > CENTER_X) table_x_2[i]--;
			if(table_y_2[i] < CENTER_Y) table_y_2[i]++;
			if(table_y_2[i] > CENTER_Y) table_y_2[i]--;
			if (table_z_2[i] == 1 && table_x_2[i] == CENTER_X && table_y_2[i] == CENTER_Y){
				if (castle_2 > 0) {
					castle_2 -= 1;
					if (castle_3 > 0) castle_3 -= 1;
					table_z_2[i] = 0;
				}
				else {
					table_z_2[i] = 0;
				}
					
			}
			
			if(table_x_3[i] < CENTER_X) table_x_3[i]++;
			if(table_x_3[i] > CENTER_X) table_x_3[i]--;
			if(table_y_3[i] < CENTER_Y) table_y_3[i]++;
			if(table_y_3[i] > CENTER_Y) table_y_3[i]--;
			if (table_z_3[i] == 1 && castle_3 > 0 &&  table_x_3[i] == CENTER_X && table_y_3[i] == CENTER_Y){
				if (castle_3 > 0){
					castle_3 -= 1;
				table_z_3[i] = 0;
				}
				else {
					table_z_3[i] = 0;
				}
				
			}
			
			switch(univers_time){
			case 1 :
			if (table_z[i] == 1)
			{
				spr_show(i+1); 
				spr_put(i+1,table_x[i],table_y[i], 1);
				spr_pattern(0x7000);
			}
			else spr_hide(i+1); 
			break;
			case 2 :
			if (table_z_2[i] == 1)
			{
				spr_show(i+1);
				spr_put(i+1,table_x_2[i],table_y_2[i], 1);
				spr_pattern(0x7040);
			}
			else spr_hide(i+1); 
			break;
			case 3 :
			if (table_z_3[i] == 1)
			{
				spr_show(i+1);
				spr_put(i+1,table_x_3[i],table_y_3[i], 1);
				spr_pattern(0x7080);
			}
			else spr_hide(i+1); 
			break;
			}
			
		}
	}

}

ennemy_cre()
{

	int choix, rand_x, rand_y;
	srand(counter+knight_x+tics_knight);		/* re-randomise le random! */
	choix = random(4);
	rand_x = random(16)*16;
	rand_y = random(14)*16;
	
	if(choix == 0) 
	{
		table_x[nb_ennemy] = rand_x;
		table_y[nb_ennemy] = 0;
	}
	if(choix == 1) 
	{
		table_x[nb_ennemy] = rand_x;
		table_y[nb_ennemy] = 224;
	}
	if(choix == 2) 
	{
		table_x[nb_ennemy] = 0;
		table_y[nb_ennemy] = rand_y;
	}
	if(choix == 3) 
	{
		table_x[nb_ennemy] = 256;
		table_y[nb_ennemy] = rand_y;
	}
	
	/* caca boudin 1 */
	
	choix = random(4);
	rand_x = random(16)*16;
	rand_y = random(14)*16;
	
	if(choix == 0) 
	{
		table_x_2[nb_ennemy] = rand_x;
		table_y_2[nb_ennemy] = 0;
	}
	if(choix == 1) 
	{
		table_x_2[nb_ennemy] = rand_x;
		table_y_2[nb_ennemy] = 224;
	}
	if(choix == 2) 
	{
		table_x_2[nb_ennemy] = 0;
		table_y_2[nb_ennemy] = rand_y;
	}
	if(choix == 3) 
	{
		table_x_2[nb_ennemy] = 256;
		table_y_2[nb_ennemy] = rand_y;
	}
	
	/* prout pipi 2 */
	
	
	choix = random(4);
	rand_x = random(16)*16;
	rand_y = random(14)*16;
	
	if(choix == 0) 
	{
		table_x_3[nb_ennemy] = rand_x;
		table_y_3[nb_ennemy] = 0;
	}
	if(choix == 1) 
	{
		table_x_3[nb_ennemy] = rand_x;
		table_y_3[nb_ennemy] = 224;
	}
	if(choix == 2) 
	{
		table_x_3[nb_ennemy] = 0;
		table_y_3[nb_ennemy] = rand_y;
	}
	if(choix == 3) 
	{
		table_x_3[nb_ennemy] = 256;
		table_y_3[nb_ennemy] = rand_y;
	}
	switch (univers_time){
		case 1 :
	spr_make(nb_ennemy,table_x[nb_ennemy],table_y[nb_ennemy],0x7000,FLIP_MAS|SIZE_MAS,NO_FLIP|SZ_16x16,1,1);
	break;
	case 2 :
	spr_make(nb_ennemy,table_x_2[nb_ennemy],table_y_2[nb_ennemy],0x7000,FLIP_MAS|SIZE_MAS,NO_FLIP|SZ_16x16,1,1);
	break;
	case 3 :
	spr_make(nb_ennemy,table_x_3[nb_ennemy],table_y_3[nb_ennemy],0x7000,FLIP_MAS|SIZE_MAS,NO_FLIP|SZ_16x16,1,1);
	break;
	}
}

castle_machine(){
	switch(univers_time){
		case 1:
		switch (castle_1) {
			case 3 :
			put_tile(10, 7, 6); 
			break;
			
			case 2 :
			put_tile(10, 7, 6); 
			put_tile(11, 8, 6); 
			break;
			
			case 1 :
			put_tile(10, 7, 6); 
			put_tile(11, 8, 6); 
			put_tile(16, 7, 7);
			break;
			
			case 0 :
			put_tile(10, 7, 6); 
			put_tile(11, 8, 6); 
			put_tile(16, 7, 7); 
			put_tile(17, 8, 7); 
			break;
		}
		break;
		case 2:
		switch (castle_2) {
			case 3 :
			put_tile(35, 23, 6); 
			break;
			
			case 2 :
			put_tile(35, 23, 6); 
			put_tile(35, 8, 6); 
			break;
			
			case 1 :
			put_tile(35, 23, 6); 
			put_tile(35, 24, 6); 
			put_tile(35, 23, 7);
			break;
			
			case 0 :
			put_tile(35, 23, 6); 
			put_tile(35, 24, 6); 
			put_tile(35, 23, 7); 
			put_tile(35, 24, 7); 
			break;
		}
		break;
		
		case 3:
		/* switch (castle_3) {
			case 3 :
			put_tile(10, 39, 6); 
			break;
			
			case 2 :
			put_tile(10, 39, 6); 
			put_tile(11, 40, 6); 
			break;
			
			case 1 :
			put_tile(10, 39, 6); 
			put_tile(11, 40, 6); 
			put_tile(20, 39, 7);
			break;
			
			case 0 :
			put_tile(10, 39, 6); 
			put_tile(11, 40, 6); 
			put_tile(20, 39, 7); 
			put_tile(21, 40, 7); 
			break;
		} */
		switch (castle_3) {
			case 3 :
			put_tile(32, 23, 6); 
			break;
			
			case 2 :
			put_tile(32, 23, 6); 
			put_tile(33, 8, 6); 
			break;
			
			case 1 :
			put_tile(32, 23, 6); 
			put_tile(33, 24, 6); 
			put_tile(38, 23, 7);
			break;
			
			case 0 :
			put_tile(32, 23, 6); 
			put_tile(33, 24, 6); 
			put_tile(38, 23, 7); 
			put_tile(39, 24, 7); 
			break;
		}
		break;
	}
	
	
		
		
}
