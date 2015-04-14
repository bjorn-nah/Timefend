spr_make(spriteno, spritex, spritey, spritepattern, ctrl1, ctrl2, sprpal, sprpri)
int spriteno, spritex, spritey, spritepattern, ctrl1, ctrl2, sprpal, sprpri;
{
	spr_set(spriteno);
	spr_x(spritex);
	spr_y(spritey);
	spr_pattern(spritepattern);
	spr_ctrl(ctrl1, ctrl2);
	spr_pal(sprpal);
	spr_pri(sprpri);
}

spr_put(spriteno, spritex, spritey, direction)
int spriteno, spritex, spritey, direction;
{
	spr_set(spriteno);
	spr_x(spritex);
	spr_y(spritey);
	if (direction == 2)
		spr_ctrl(FLIP_X_MASK,FLIP_X);
	else
		spr_ctrl(FLIP_X_MASK,NO_FLIP_X);
}

