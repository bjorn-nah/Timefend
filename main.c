#include "huc.h"
#include "timefend2.c"

main()
{
	int joie;
	cls();
	init_satb();
	reset_satb();
	set_font_color(1, 0);
	load_default_font();
	put_string("TimeFend", 12, 12);
	put_string("First presented at AC2015", 4, 13);
	put_string("by Cr30s & Bjorn", 8, 15);
	for(;;)
	{	
	joie = joy(0);
	if (joie & JOY_STRT) timefend();
	}
}
