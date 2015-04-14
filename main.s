; Small C HuC6280 (v0.2, 08/Nov/97)
;
; Taken to HuC (22/Feb/00)
;
;
; This file generated by HuC (v3.21, 2005/04/09, Denki release)
; on Sun Apr 12 14:51:24 2015
;

HUC	= 1

	.include "startup.asm"
	.data
	.bank DATA_BANK

	.code

	.proc _spr_make
	__pushw
	__ldw_s	14
	  call	_spr_set
	__ldw_s	12
	  call	_spr_x
	__ldw_s	10
	  call	_spr_y
	__ldw_s	8
	  call	_spr_pattern
	__ldw_s	6
	  stx	_al
	__ldw_s	4
	  call	_spr_ctrl.2
	__ldw_s	2
	  call	_spr_pal
	__ldw_s	0
	  call	_spr_pri
LL1:

	__addmi	16,__stack
	  rts
	.endp

	.proc _spr_put
	__pushw
	__ldw_s	6
	  call	_spr_set
	__ldw_s	4
	  call	_spr_x
	__ldw_s	2
	  call	_spr_y
	__ldw_s	0
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL3
	__ldwi	8
	  stx	_al
	__ldwi	8
	  call	_spr_ctrl.2
	__lbra	LL4
LL3:

	__ldwi	8
	  stx	_al
	__ldwi	0
	  call	_spr_ctrl.2
LL4:

LL2:

	__addmi	8,__stack
	  rts
	.endp

	.data
	.dw $0
_knight:
	.incspr "knight5.pcx",0,0,2,30
	.code
	.data
	.dw $0
_knightpal:
	.incpal "knight5.pcx"
	.code
	.data
	.dw $0
_ennemy:
	.incspr "ennemy.pcx",0,0,1,3
	.code
	.data
	.dw $0
_ennemypal:
	.incpal "ennemy.pcx"
	.code
	.data
	.dw $0
_levelmap:
	.incbin "timeline.FMP"

	.code
	.data
	.dw $1000
_leveltiles__data__:
	.inctile "tile.pcx",0,0,6,7
	.code
	.data
	.dw $0
_levelpal0:
	.incpal "tile.pcx"
	.code
	.proc _timefend
	__addmi	-2,__stack
	  call	_cls
	__farptr	_levelmap,_bl,_si
	__ldwi	48
	__stw	_ax
	__ldwi	14
	  call	_set_map_data.3
	__ldwi	_leveltiles
	__stw	_di
	  call	_set_tile_data.1
	__ldwi	4096
	  call	_load_tile
	__ldwi	0
	  stx	_al
	__ldwi	0
	  stx	_ah
	__ldwi	0
	__phw	4,4
	__ldwi	0
	__phw	2
	__ldwi	32
	  stx	_dl
	__ldwi	14
	  stx	_dh
	  call	_load_map.6
	__ldwi	0
	  stx	_al
	__farptr	_levelpal0,_bl,_si
	__ldwi	1
	  stx	_cl
	  call	_load_palette.3
	__ldwi	20480
	__stw	_ram_knight_addr
	__ldwi	20736
	__stw	_ram_knight_addr2
	__ldwi	22016
	__stw	_ram_knight_atk1
	__ldwi	22272
	__stw	_ram_knight_atk2
	__ldwi	22528
	__stw	_ram_knight_atk3
	__ldwi	0
	__pushw
	__ldwi	112
	__pushw
	__ldwi	96
	__pushw
	__ldw	_ram_knight_addr
	__pushw
	__ldwi	185
	__pushw
	__ldwi	17
	__pushw
	__ldwi	0
	__pushw
	__ldwi	1
	  call	_spr_make
	_set_sprpal	#0,_knightpal,#1
	__ldw	_ram_knight_addr
	__stw	_di
	__farptr	_knight,_bl,_si
	__ldwi	5376
	__stw	_cx
	  call	_load_vram.3
	_set_sprpal	#1,_ennemypal,#1
	__ldwi	28672
	__stw	_di
	__farptr	_ennemy,_bl,_si
	__ldwi	256
	__stw	_cx
	  call	_load_vram.3
	__ldwi	0
	__stw	_state_knight
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_walk_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	112
	__stw	_knight_x
	__ldwi	96
	__stw	_knight_y
	__ldwi	0
	__stw	_ennemy_x
	__ldwi	0
	__stw	_ennemy_y
	__ldwi	0
	__stw	_nb_ennemy
	__ldwi	0
	__stw	_nb_ennemy_2
	__ldwi	0
	__stw	_nb_ennemy_3
	__ldwi	0
	__stw	_time_move
	__ldwi	1
	__stw	_univers_time
	__ldwi	0
	__stw	_counter
	__stwi_s	0,0
LL6:

	__ldw_s	0
	__stw	<__temp
	__ldwi	16
	  jsr	ltzp
	__lbne	LL8
	__lbra	LL9
LL7:

	__ldw_s	0
	__incw_s	0
	__lbra	LL6
LL8:

	__ldw_s	0
	__aslw
	__addwi	_table_z
	__pushw
	__ldwi	1
	__stwps
	__ldw_s	0
	__aslw
	__addwi	_table_z_2
	__pushw
	__ldwi	1
	__stwps
	__ldw_s	0
	__aslw
	__addwi	_table_z_3
	__pushw
	__ldwi	1
	__stwps
	__lbra	LL7
LL9:

	__ldwi	4
	  stx	_castle_1
	__ldwi	4
	  stx	_castle_2
	__ldwi	4
	  stx	_castle_3
	__ldwi	0
	  stx	_init_cnt_alive
	__ldwi	0
	  stx	_alive_total
	__ldwi	0
	  stx	_alive_iter
	__ldwi	1
	  stx	_al
	__ldwi	0
	  call	_set_font_color.2
	  call	_load_default_font
LL10:

LL11:

LL12:

	  ldy	#0
	  call	_vsync
	__ldwi	0
	  call	_joy
	__stw	_j1
	__ldw	_counter
	incw	_counter
	  call	_player_machine
	  call	_ennemy_machine
	  call	_physique
	  call	_castle_machine
	__ldb	_castle_1
	__pushw
	__ldb	_castle_2
	__addws
	__pushw
	__ldb	_castle_3
	__addws
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL14
	__ldwi	700
	  ldy	#1
	  call	_vsync
	  call	_init_satb
	  call	_reset_satb
	  call	_main
	__lbra	LL15
LL14:

	__ldwi	0
	  stx	_init_cnt_alive
LL16:

	__ldb	_init_cnt_alive
	__stw	<__temp
	__ldwi	16
	  jsr	ltzp
	__lbne	LL18
	__lbra	LL19
LL17:

	__ldb	_init_cnt_alive
	__addwi	1
	  stx	_init_cnt_alive
	__subwi	1
	__lbra	LL16
LL18:

	__ldwi	_table_z
	__pushw
	__ldb	_init_cnt_alive
	__aslw
	__addws
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldwi	_table_z_2
	__pushw
	__ldb	_init_cnt_alive
	__aslw
	__addws
	__stw	__ptr
	__ldwp	__ptr
	__addws
	__pushw
	__ldwi	_table_z_3
	__pushw
	__ldb	_init_cnt_alive
	__aslw
	__addws
	__stw	__ptr
	__ldwp	__ptr
	__addws
	  stx	_alive_iter
	__ldb	_alive_total
	__pushw
	__ldb	_alive_iter
	__addws
	  stx	_alive_total
	__ldwi	0
	  stx	_alive_iter
	__lbra	LL17
LL19:

	__ldb	_alive_total
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL20
	__ldwi	LL0+42
	__phw	3,3
	__ldwi	4
	__phb	1
	__ldwi	12
	  call	_put_string.3
	__ldwi	LL0+57
	__phw	3,3
	__ldwi	4
	__phb	1
	__ldwi	13
	  call	_put_string.3
	__ldb	_alive_iter
	__phw	3,3
	__ldwi	8
	__phb	1
	__ldwi	15
	  call	_put_string.3
	__lbra	LL21
LL20:

	__ldwi	0
	  stx	_init_cnt_alive
	__ldwi	0
	  stx	_alive_total
LL21:

LL15:

	  ldy	#0
	  call	_satb_update
	__lbra	LL12
LL13:

LL5:

	__addmi	2,__stack
	  rts
	.endp

	.proc _player_machine
	__ldwi	0
	  call	_spr_set
	__ldwi	LL23
	__pushw
	__ldw	_univers_time
	  jmp	___case
LL25:

	__ldwi	20480
	__stw	_ram_knight_addr
	__ldwi	20736
	__stw	_ram_knight_addr2
	__ldwi	22016
	__stw	_ram_knight_atk1
	__ldwi	22272
	__stw	_ram_knight_atk2
	__ldwi	22528
	__stw	_ram_knight_atk3
	__lbra	LL24
LL26:

	__ldwi	20992
	__stw	_ram_knight_addr
	__ldwi	21248
	__stw	_ram_knight_addr2
	__ldwi	22784
	__stw	_ram_knight_atk1
	__ldwi	23040
	__stw	_ram_knight_atk2
	__ldwi	23296
	__stw	_ram_knight_atk3
	__lbra	LL24
LL27:

	__ldwi	21504
	__stw	_ram_knight_addr
	__ldwi	21760
	__stw	_ram_knight_addr2
	__ldwi	23552
	__stw	_ram_knight_atk1
	__ldwi	23808
	__stw	_ram_knight_atk2
	__ldwi	24064
	__stw	_ram_knight_atk3
	__lbra	LL24
LL28:

	__ldwi	20480
	__stw	_ram_knight_addr
	__ldwi	20736
	__stw	_ram_knight_addr2
	__ldwi	22016
	__stw	_ram_knight_atk1
	__ldwi	22272
	__stw	_ram_knight_atk2
	__ldwi	22528
	__stw	_ram_knight_atk3
	__lbra	LL24
	__lbra	LL24
LL23:

	.dw	1,LL25,2,LL26,3,LL27
	.dw	LL28,0
LL24:

	__ldw	_state_knight
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL29
	  call	_player_knight_0
LL29:

	__ldw	_state_knight
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL30
	  call	_player_knight_1
LL30:

	__ldw	_state_knight
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL31
	  call	_player_knight_2
LL31:

	__ldw	_state_knight
	__stw	<__temp
	__ldwi	3
	  jsr	eqzp
	__lbeq	LL32
	  call	_player_knight_3
LL32:

	__ldw	_state_knight
	__stw	<__temp
	__ldwi	4
	  jsr	eqzp
	__lbeq	LL33
	  call	_player_knight_4
LL33:

LL22:

	  rts
	.endp

	.proc _player_knight_0
	__ldw	_tics_knight
	incw	_tics_knight
	__ldw	_tics_knight
	__stw	<__temp
	__ldwi	6
	  jsr	gtzp
	__lbeq	LL35
	__ldwi	0
	__stw	_tics_knight
	__ldw	_frame_knight
	incw	_frame_knight
	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	1
	  jsr	gtzp
	__lbeq	LL36
	__ldwi	0
	__stw	_frame_knight
LL36:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL37
	__ldw	_ram_knight_addr
	  call	_spr_pattern
LL37:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL38
	__ldw	_ram_knight_addr2
	  call	_spr_pattern
LL38:

LL35:

	__ldw	_j1
	__andwi	128
	__tstw
	__lbeq	LL39
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	1
	__stw	_dir_knight
LL39:

	__ldw	_j1
	__andwi	32
	__tstw
	__lbeq	LL40
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	2
	__stw	_dir_knight
LL40:

	__ldw	_j1
	__andwi	16
	__tstw
	__lbeq	LL41
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	3
	__stw	_dir_knight
LL41:

	__ldw	_j1
	__andwi	64
	__tstw
	__lbeq	LL42
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	4
	__stw	_dir_knight
LL42:

	__ldw	_j1
	__andwi	128
	__tstw
	__lbeq	LL44
	__ldw	_j1
	__andwi	16
LL44:

	__boolw
	__tstw
	__lbeq	LL43
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	5
	__stw	_dir_knight
LL43:

	__ldw	_j1
	__andwi	32
	__tstw
	__lbeq	LL46
	__ldw	_j1
	__andwi	16
LL46:

	__boolw
	__tstw
	__lbeq	LL45
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	6
	__stw	_dir_knight
LL45:

	__ldw	_j1
	__andwi	128
	__tstw
	__lbeq	LL48
	__ldw	_j1
	__andwi	64
LL48:

	__boolw
	__tstw
	__lbeq	LL47
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	7
	__stw	_dir_knight
LL47:

	__ldw	_j1
	__andwi	32
	__tstw
	__lbeq	LL50
	__ldw	_j1
	__andwi	64
LL50:

	__boolw
	__tstw
	__lbeq	LL49
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	1
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
	__ldwi	8
	__stw	_dir_knight
LL49:

	__ldw	_j1
	__andwi	1
	__tstw
	__lbeq	LL51
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	2
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
LL51:

	__ldw	_j1
	__andwi	2
	__tstw
	__lbeq	LL53
	__ldw	_j1
	__andwi	128
LL53:

	__boolw
	__tstw
	__lbeq	LL52
	__ldwi	1
	__stw	_time_move
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	4
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
LL52:

	__ldw	_j1
	__andwi	2
	__tstw
	__lbeq	LL55
	__ldw	_j1
	__andwi	32
LL55:

	__boolw
	__tstw
	__lbeq	LL54
	__ldwi	2
	__stw	_time_move
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	4
	__stw	_state_knight
	__ldw	_ram_knight_addr
	  call	_spr_pattern
LL54:

LL34:

	  rts
	.endp

	.proc _player_knight_1
	__ldwi	0
	__stw	_walk_knight
	__ldw	_tics_knight
	incw	_tics_knight
	__ldw	_tics_knight
	__stw	<__temp
	__ldwi	6
	  jsr	gtzp
	__lbeq	LL57
	__ldwi	0
	__stw	_tics_knight
	__ldw	_frame_knight
	incw	_frame_knight
	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	3
	  jsr	gtzp
	__lbeq	LL58
	__ldwi	0
	__stw	_frame_knight
LL58:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL59
	__ldw	_ram_knight_addr
	  call	_spr_pattern
LL59:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL60
	__ldw	_ram_knight_addr2
	  call	_spr_pattern
LL60:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL61
	__ldw	_ram_knight_addr
	  call	_spr_pattern
LL61:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	3
	  jsr	eqzp
	__lbeq	LL62
	__ldw	_ram_knight_addr2
	  call	_spr_pattern
LL62:

LL57:

	__ldw	_j1
	__andwi	128
	__tstw
	__lbeq	LL63
	__ldwi	1
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL63:

	__ldw	_j1
	__andwi	32
	__tstw
	__lbeq	LL64
	__ldwi	2
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL64:

	__ldw	_j1
	__andwi	16
	__tstw
	__lbeq	LL65
	__ldwi	3
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL65:

	__ldw	_j1
	__andwi	64
	__tstw
	__lbeq	LL66
	__ldwi	4
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL66:

	__ldw	_j1
	__andwi	128
	__tstw
	__lbeq	LL68
	__ldw	_j1
	__andwi	16
LL68:

	__boolw
	__tstw
	__lbeq	LL67
	__ldwi	5
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL67:

	__ldw	_j1
	__andwi	32
	__tstw
	__lbeq	LL70
	__ldw	_j1
	__andwi	16
LL70:

	__boolw
	__tstw
	__lbeq	LL69
	__ldwi	6
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL69:

	__ldw	_j1
	__andwi	128
	__tstw
	__lbeq	LL72
	__ldw	_j1
	__andwi	64
LL72:

	__boolw
	__tstw
	__lbeq	LL71
	__ldwi	7
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL71:

	__ldw	_j1
	__andwi	32
	__tstw
	__lbeq	LL74
	__ldw	_j1
	__andwi	64
LL74:

	__boolw
	__tstw
	__lbeq	LL73
	__ldwi	8
	__stw	_dir_knight
	__ldwi	1
	__stw	_walk_knight
LL73:

	__ldw	_j1
	__andwi	1
	__tstw
	__lbeq	LL75
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	2
	__stw	_state_knight
LL75:

	__ldw	_walk_knight
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL76
	__ldwi	0
	__stw	_tics_knight
	__ldwi	0
	__stw	_frame_knight
	__ldwi	0
	__stw	_state_knight
	__lbra	LL77
LL76:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL78
	__ldw	_knight_x
	__subwi	2
	__stw	_knight_x
LL78:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL79
	__ldw	_knight_x
	__addwi	2
	__stw	_knight_x
LL79:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	3
	  jsr	eqzp
	__lbeq	LL80
	__ldw	_knight_y
	__subwi	2
	__stw	_knight_y
LL80:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	4
	  jsr	eqzp
	__lbeq	LL81
	__ldw	_knight_y
	__addwi	2
	__stw	_knight_y
LL81:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	5
	  jsr	eqzp
	__lbeq	LL82
	__ldw	_knight_x
	__subwi	2
	__stw	_knight_x
	__ldw	_knight_y
	__subwi	2
	__stw	_knight_y
LL82:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	6
	  jsr	eqzp
	__lbeq	LL83
	__ldw	_knight_x
	__addwi	2
	__stw	_knight_x
	__ldw	_knight_y
	__subwi	2
	__stw	_knight_y
LL83:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	7
	  jsr	eqzp
	__lbeq	LL84
	__ldw	_knight_x
	__subwi	2
	__stw	_knight_x
	__ldw	_knight_y
	__addwi	2
	__stw	_knight_y
LL84:

	__ldw	_dir_knight
	__stw	<__temp
	__ldwi	8
	  jsr	eqzp
	__lbeq	LL85
	__ldw	_knight_x
	__addwi	2
	__stw	_knight_x
	__ldw	_knight_y
	__addwi	2
	__stw	_knight_y
LL85:

	__ldw	_knight_x
	__stw	<__temp
	__ldwi	0
	  jsr	ltzp
	__lbeq	LL86
	__ldwi	0
	__stw	_knight_x
LL86:

	__ldw	_knight_x
	__stw	<__temp
	__ldwi	224
	  jsr	gtzp
	__lbeq	LL87
	__ldwi	224
	__stw	_knight_x
LL87:

	__ldw	_knight_y
	__stw	<__temp
	__ldwi	0
	  jsr	ltzp
	__lbeq	LL88
	__ldwi	0
	__stw	_knight_y
LL88:

	__ldw	_knight_y
	__stw	<__temp
	__ldwi	192
	  jsr	gtzp
	__lbeq	LL89
	__ldwi	192
	__stw	_knight_y
LL89:

LL77:

LL56:

	  rts
	.endp

	.proc _player_knight_2
	__addmi	-6,__stack
	__ldw	_tics_knight
	incw	_tics_knight
	__ldw	_tics_knight
	__stw	<__temp
	__ldwi	6
	  jsr	gtzp
	__lbeq	LL91
	__ldwi	0
	__stw	_tics_knight
	__ldw	_frame_knight
	incw	_frame_knight
	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	2
	  jsr	gtzp
	__lbeq	LL92
	__ldwi	0
	__stw	_frame_knight
	__ldwi	0
	__stw	_state_knight
LL92:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL93
	__ldw	_ram_knight_atk1
	  call	_spr_pattern
LL93:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL94
	__ldw	_ram_knight_atk2
	  call	_spr_pattern
LL94:

	__ldw	_frame_knight
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL95
	__ldw	_ram_knight_atk3
	  call	_spr_pattern
LL95:

LL91:

	__stwi_s	0,4
LL96:

	__ldw_s	4
	__stw	<__temp
	__ldw	_nb_ennemy
	  jsr	ltzp
	__lbne	LL98
	__lbra	LL99
LL97:

	__ldw_s	4
	__incw_s	4
	__lbra	LL96
LL98:

	__ldwi	LL100
	__pushw
	__ldw	_univers_time
	  jmp	___case
LL102:

	__ldw_s	4
	__aslw
	__addwi	_table_x
	__stw	__ptr
	__ldwp	__ptr
	__subw	_knight_x
	__stw_s	2
	__ldw_s	4
	__aslw
	__addwi	_table_y
	__stw	__ptr
	__ldwp	__ptr
	__subw	_knight_y
	__stw_s	0
	__lbra	LL101
LL103:

	__ldw_s	4
	__aslw
	__addwi	_table_x_2
	__stw	__ptr
	__ldwp	__ptr
	__subw	_knight_x
	__stw_s	2
	__ldw_s	4
	__aslw
	__addwi	_table_y_2
	__stw	__ptr
	__ldwp	__ptr
	__subw	_knight_y
	__stw_s	0
	__lbra	LL101
LL104:

	__ldw_s	4
	__aslw
	__addwi	_table_x_3
	__stw	__ptr
	__ldwp	__ptr
	__subw	_knight_x
	__stw_s	2
	__ldw_s	4
	__aslw
	__addwi	_table_y_3
	__stw	__ptr
	__ldwp	__ptr
	__subw	_knight_y
	__stw_s	0
	__lbra	LL101
	__lbra	LL101
LL100:

	.dw	1,LL102,2,LL103,3,LL104
	.dw	LL101,0
LL101:

	__ldw_s	2
	__pushw
	__ldwi	16
	__negw
	  jsr	gt
	__lbeq	LL106
	__ldw_s	2
	__stw	<__temp
	__ldwi	32
	  jsr	ltzp
LL106:

	__boolw
	__tstw
	__lbeq	LL107
	__ldw_s	0
	__pushw
	__ldwi	16
	__negw
	  jsr	gt
LL107:

	__boolw
	__tstw
	__lbeq	LL108
	__ldw_s	0
	__stw	<__temp
	__ldwi	32
	  jsr	ltzp
LL108:

	__boolw
	__tstw
	__lbeq	LL105
	__ldwi	LL109
	__pushw
	__ldw	_univers_time
	  jmp	___case
LL111:

	__ldw_s	4
	__aslw
	__addwi	_table_z
	__pushw
	__ldwi	0
	__stwps
	__lbra	LL110
LL112:

	__ldw_s	4
	__aslw
	__addwi	_table_z_2
	__pushw
	__ldwi	0
	__stwps
	__lbra	LL110
LL113:

	__ldw_s	4
	__aslw
	__addwi	_table_z_3
	__pushw
	__ldwi	0
	__stwps
	__lbra	LL110
	__lbra	LL110
LL109:

	.dw	1,LL111,2,LL112,3,LL113
	.dw	LL110,0
LL110:

LL105:

	__lbra	LL97
LL99:

LL90:

	__addmi	6,__stack
	  rts
	.endp

	.proc _player_knight_3
	__ldwi	0
	__stw	_state_knight
LL114:

	  rts
	.endp

	.proc _player_knight_4
	__addmi	-4,__stack
	__ldw	_univers_time
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL117
	__ldw	_time_move
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
LL117:

	__boolw
	__tstw
	__lbeq	LL116
	__stwi_s	0,0
	__stwi_s	0,2
LL118:

	__ldw_s	2
	__stw	<__temp
	__ldwi	256
	  jsr	ltzp
	__lbne	LL120
	__lbra	LL121
LL119:

	__ldw_s	2
	__incw_s	2
	__lbra	LL118
LL120:

	__ldw_s	0
	__incw_s	0
	__ldwi	0
	__pushw
	__ldw_s	2
	__pushw
	__ldwi	0
	__pushw
	__ldwi	0
	__pushw
	__ldwi	253
	__pushw
	__ldwi	192
	  call	_scroll
	__ldw_s	2
	__pushw
	__ldwi	5
	  jsr	smod
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL122
	  ldy	#0
	  call	_vsync
LL122:

	__lbra	LL119
LL121:

LL116:

	__ldw	_univers_time
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL124
	__ldw	_time_move
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
LL124:

	__boolw
	__tstw
	__lbeq	LL123
	__ldwi	0
	  stx	_al
	__ldwi	0
	  stx	_ah
	__ldwi	16
	__phw	4,4
	__ldwi	0
	__phw	2
	__ldwi	32
	  stx	_dl
	__ldwi	14
	  stx	_dh
	  call	_load_map.6
	__stwi_s	0,0
	__stwi_s	0,2
LL125:

	__ldw_s	2
	__stw	<__temp
	__ldwi	256
	  jsr	ltzp
	__lbne	LL127
	__lbra	LL128
LL126:

	__ldw_s	2
	__incw_s	2
	__lbra	LL125
LL127:

	__ldw_s	0
	__incw_s	0
	__ldwi	0
	__pushw
	__ldw_s	2
	__pushw
	__ldwi	0
	__pushw
	__ldwi	0
	__pushw
	__ldwi	253
	__pushw
	__ldwi	192
	  call	_scroll
	__ldw_s	2
	__pushw
	__ldwi	5
	  jsr	smod
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL129
	  ldy	#0
	  call	_vsync
LL129:

	__lbra	LL126
LL128:

LL123:

	__ldw	_univers_time
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL131
	__ldw	_time_move
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
LL131:

	__boolw
	__tstw
	__lbeq	LL130
	__ldwi	0
	  stx	_al
	__ldwi	0
	  stx	_ah
	__ldwi	0
	__phw	4,4
	__ldwi	0
	__phw	2
	__ldwi	32
	  stx	_dl
	__ldwi	14
	  stx	_dh
	  call	_load_map.6
	__stwi_s	256,0
	__stwi_s	0,2
LL132:

	__ldw_s	2
	__stw	<__temp
	__ldwi	256
	  jsr	ltzp
	__lbne	LL134
	__lbra	LL135
LL133:

	__ldw_s	2
	__incw_s	2
	__lbra	LL132
LL134:

	__ldw_s	0
	__subwi	1
	__stw_s	0
	__addwi	1
	__ldwi	0
	__pushw
	__ldw_s	2
	__pushw
	__ldwi	0
	__pushw
	__ldwi	0
	__pushw
	__ldwi	253
	__pushw
	__ldwi	192
	  call	_scroll
	__ldw_s	2
	__pushw
	__ldwi	5
	  jsr	smod
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL136
	  ldy	#0
	  call	_vsync
LL136:

	__lbra	LL133
LL135:

LL130:

	__ldw	_univers_time
	__stw	<__temp
	__ldwi	3
	  jsr	eqzp
	__lbeq	LL138
	__ldw	_time_move
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
LL138:

	__boolw
	__tstw
	__lbeq	LL137
	__stwi_s	256,0
	__stwi_s	0,2
LL139:

	__ldw_s	2
	__stw	<__temp
	__ldwi	256
	  jsr	ltzp
	__lbne	LL141
	__lbra	LL142
LL140:

	__ldw_s	2
	__incw_s	2
	__lbra	LL139
LL141:

	__ldw_s	0
	__subwi	1
	__stw_s	0
	__addwi	1
	__ldwi	0
	__pushw
	__ldw_s	2
	__pushw
	__ldwi	0
	__pushw
	__ldwi	0
	__pushw
	__ldwi	253
	__pushw
	__ldwi	192
	  call	_scroll
	__ldw_s	2
	__pushw
	__ldwi	5
	  jsr	smod
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL143
	  ldy	#0
	  call	_vsync
LL143:

	__lbra	LL140
LL142:

LL137:

	__ldw	_time_move
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL144
	__ldw	_univers_time
	__stw	<__temp
	__ldwi	1
	  jsr	gtzp
	__lbeq	LL145
	__ldw	_univers_time
	__subwi	1
	__stw	_univers_time
	__addwi	1
LL145:

LL144:

	__ldw	_time_move
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL146
	__ldw	_univers_time
	__stw	<__temp
	__ldwi	3
	  jsr	ltzp
	__lbeq	LL147
	__ldw	_univers_time
	incw	_univers_time
LL147:

LL146:

	__ldwi	0
	__stw	_state_knight
LL115:

	__addmi	4,__stack
	  rts
	.endp

	.proc _physique
	__ldwi	0
	__pushw
	__ldw	_knight_x
	__pushw
	__ldw	_knight_y
	__pushw
	__ldw	_dir_knight
	  call	_spr_put
LL148:

	  rts
	.endp

	.proc _ennemy_machine
	__addmi	-2,__stack
	__ldw	_counter
	__pushw
	__ldwi	100
	  jsr	smod
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL151
	__ldw	_nb_ennemy
	__stw	<__temp
	__ldwi	16
	  jsr	ltzp
LL151:

	__boolw
	__tstw
	__lbeq	LL150
	__ldw	_nb_ennemy
	incw	_nb_ennemy
	  call	_ennemy_cre
LL150:

	__ldw	_counter
	__pushw
	__ldwi	10
	  jsr	smod
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL152
	__stwi_s	0,0
LL153:

	__ldw_s	0
	__stw	<__temp
	__ldw	_nb_ennemy
	  jsr	ltzp
	__lbne	LL155
	__lbra	LL156
LL154:

	__ldw_s	0
	__incw_s	0
	__lbra	LL153
LL155:

	__ldw_s	0
	__aslw
	__addwi	_table_x
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	ltzp
	__lbeq	LL157
	__ldw_s	0
	__aslw
	__addwi	_table_x
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__addwi	1
	__stwps
	__subwi	1
LL157:

	__ldw_s	0
	__aslw
	__addwi	_table_x
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	gtzp
	__lbeq	LL158
	__ldw_s	0
	__aslw
	__addwi	_table_x
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__subwi	1
	__stwps
	__addwi	1
LL158:

	__ldw_s	0
	__aslw
	__addwi	_table_y
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	ltzp
	__lbeq	LL159
	__ldw_s	0
	__aslw
	__addwi	_table_y
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__addwi	1
	__stwps
	__subwi	1
LL159:

	__ldw_s	0
	__aslw
	__addwi	_table_y
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	gtzp
	__lbeq	LL160
	__ldw_s	0
	__aslw
	__addwi	_table_y
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__subwi	1
	__stwps
	__addwi	1
LL160:

	__ldw_s	0
	__aslw
	__addwi	_table_z
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL162
	__ldw_s	0
	__aslw
	__addwi	_table_x
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	eqzp
LL162:

	__boolw
	__tstw
	__lbeq	LL163
	__ldw_s	0
	__aslw
	__addwi	_table_y
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	eqzp
LL163:

	__boolw
	__tstw
	__lbeq	LL161
	__ldb	_castle_1
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
	__lbeq	LL164
	__ldb	_castle_1
	__subwi	1
	  stx	_castle_1
	__ldb	_castle_2
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
	__lbeq	LL165
	__ldb	_castle_2
	__subwi	1
	  stx	_castle_2
LL165:

	__ldb	_castle_3
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
	__lbeq	LL166
	__ldb	_castle_3
	__subwi	1
	  stx	_castle_3
LL166:

	__ldw_s	0
	__aslw
	__addwi	_table_z
	__pushw
	__ldwi	0
	__stwps
	__lbra	LL167
LL164:

	__ldw_s	0
	__aslw
	__addwi	_table_z
	__pushw
	__ldwi	0
	__stwps
LL167:

LL161:

	__ldw_s	0
	__aslw
	__addwi	_table_x_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	ltzp
	__lbeq	LL168
	__ldw_s	0
	__aslw
	__addwi	_table_x_2
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__addwi	1
	__stwps
	__subwi	1
LL168:

	__ldw_s	0
	__aslw
	__addwi	_table_x_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	gtzp
	__lbeq	LL169
	__ldw_s	0
	__aslw
	__addwi	_table_x_2
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__subwi	1
	__stwps
	__addwi	1
LL169:

	__ldw_s	0
	__aslw
	__addwi	_table_y_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	ltzp
	__lbeq	LL170
	__ldw_s	0
	__aslw
	__addwi	_table_y_2
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__addwi	1
	__stwps
	__subwi	1
LL170:

	__ldw_s	0
	__aslw
	__addwi	_table_y_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	gtzp
	__lbeq	LL171
	__ldw_s	0
	__aslw
	__addwi	_table_y_2
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__subwi	1
	__stwps
	__addwi	1
LL171:

	__ldw_s	0
	__aslw
	__addwi	_table_z_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL173
	__ldw_s	0
	__aslw
	__addwi	_table_x_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	eqzp
LL173:

	__boolw
	__tstw
	__lbeq	LL174
	__ldw_s	0
	__aslw
	__addwi	_table_y_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	eqzp
LL174:

	__boolw
	__tstw
	__lbeq	LL172
	__ldb	_castle_2
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
	__lbeq	LL175
	__ldb	_castle_2
	__subwi	1
	  stx	_castle_2
	__ldb	_castle_3
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
	__lbeq	LL176
	__ldb	_castle_3
	__subwi	1
	  stx	_castle_3
LL176:

	__ldw_s	0
	__aslw
	__addwi	_table_z_2
	__pushw
	__ldwi	0
	__stwps
	__lbra	LL177
LL175:

	__ldw_s	0
	__aslw
	__addwi	_table_z_2
	__pushw
	__ldwi	0
	__stwps
LL177:

LL172:

	__ldw_s	0
	__aslw
	__addwi	_table_x_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	ltzp
	__lbeq	LL178
	__ldw_s	0
	__aslw
	__addwi	_table_x_3
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__addwi	1
	__stwps
	__subwi	1
LL178:

	__ldw_s	0
	__aslw
	__addwi	_table_x_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	gtzp
	__lbeq	LL179
	__ldw_s	0
	__aslw
	__addwi	_table_x_3
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__subwi	1
	__stwps
	__addwi	1
LL179:

	__ldw_s	0
	__aslw
	__addwi	_table_y_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	ltzp
	__lbeq	LL180
	__ldw_s	0
	__aslw
	__addwi	_table_y_3
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__addwi	1
	__stwps
	__subwi	1
LL180:

	__ldw_s	0
	__aslw
	__addwi	_table_y_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	gtzp
	__lbeq	LL181
	__ldw_s	0
	__aslw
	__addwi	_table_y_3
	__pushw
	__stw	__ptr
	__ldwp	__ptr
	__subwi	1
	__stwps
	__addwi	1
LL181:

	__ldw_s	0
	__aslw
	__addwi	_table_z_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL183
	__ldb	_castle_3
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
LL183:

	__boolw
	__tstw
	__lbeq	LL184
	__ldw_s	0
	__aslw
	__addwi	_table_x_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	120
	  jsr	eqzp
LL184:

	__boolw
	__tstw
	__lbeq	LL185
	__ldw_s	0
	__aslw
	__addwi	_table_y_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	104
	  jsr	eqzp
LL185:

	__boolw
	__tstw
	__lbeq	LL182
	__ldb	_castle_3
	__stw	<__temp
	__ldwi	0
	  jsr	gtzp
	__lbeq	LL186
	__ldb	_castle_3
	__subwi	1
	  stx	_castle_3
	__ldw_s	0
	__aslw
	__addwi	_table_z_3
	__pushw
	__ldwi	0
	__stwps
	__lbra	LL187
LL186:

	__ldw_s	0
	__aslw
	__addwi	_table_z_3
	__pushw
	__ldwi	0
	__stwps
LL187:

LL182:

	__ldwi	LL188
	__pushw
	__ldw	_univers_time
	  jmp	___case
LL190:

	__ldw_s	0
	__aslw
	__addwi	_table_z
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL191
	__ldw_s	0
	__addwi	1
	  ldy	#1
	  call	_spr_show
	__ldw_s	0
	__addwi	1
	__pushw
	__ldw_s	2
	__aslw
	__addwi	_table_x
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldw_s	4
	__aslw
	__addwi	_table_y
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldwi	1
	  call	_spr_put
	__ldwi	28672
	  call	_spr_pattern
	__lbra	LL192
LL191:

	__ldw_s	0
	__addwi	1
	  ldy	#1
	  call	_spr_hide
LL192:

	__lbra	LL189
LL193:

	__ldw_s	0
	__aslw
	__addwi	_table_z_2
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL194
	__ldw_s	0
	__addwi	1
	  ldy	#1
	  call	_spr_show
	__ldw_s	0
	__addwi	1
	__pushw
	__ldw_s	2
	__aslw
	__addwi	_table_x_2
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldw_s	4
	__aslw
	__addwi	_table_y_2
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldwi	1
	  call	_spr_put
	__ldwi	28736
	  call	_spr_pattern
	__lbra	LL195
LL194:

	__ldw_s	0
	__addwi	1
	  ldy	#1
	  call	_spr_hide
LL195:

	__lbra	LL189
LL196:

	__ldw_s	0
	__aslw
	__addwi	_table_z_3
	__stw	__ptr
	__ldwp	__ptr
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL197
	__ldw_s	0
	__addwi	1
	  ldy	#1
	  call	_spr_show
	__ldw_s	0
	__addwi	1
	__pushw
	__ldw_s	2
	__aslw
	__addwi	_table_x_3
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldw_s	4
	__aslw
	__addwi	_table_y_3
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldwi	1
	  call	_spr_put
	__ldwi	28800
	  call	_spr_pattern
	__lbra	LL198
LL197:

	__ldw_s	0
	__addwi	1
	  ldy	#1
	  call	_spr_hide
LL198:

	__lbra	LL189
	__lbra	LL189
LL188:

	.dw	1,LL190,2,LL193,3,LL196
	.dw	LL189,0
LL189:

	__lbra	LL154
LL156:

LL152:

LL149:

	__addmi	2,__stack
	  rts
	.endp

	.proc _ennemy_cre
	__addmi	-6,__stack
	__ldw	_counter
	__addw	_knight_x
	__addw	_tics_knight
	  call	_srand
	__pea_s	4
	__ldwi	4
	  call	_random
	__stwps
	__pea_s	2
	__ldwi	16
	  call	_random
	__pushw
	__ldwi	16
	  jsr	smul
	__stwps
	__pea_s	0
	__ldwi	14
	  call	_random
	__pushw
	__ldwi	16
	  jsr	smul
	__stwps
	__ldw_s	4
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL200
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x
	__pushw
	__ldw_s	4
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y
	__pushw
	__ldwi	0
	__stwps
LL200:

	__ldw_s	4
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL201
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x
	__pushw
	__ldw_s	4
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y
	__pushw
	__ldwi	224
	__stwps
LL201:

	__ldw_s	4
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL202
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x
	__pushw
	__ldwi	0
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y
	__pushw
	__ldw_s	2
	__stwps
LL202:

	__ldw_s	4
	__stw	<__temp
	__ldwi	3
	  jsr	eqzp
	__lbeq	LL203
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x
	__pushw
	__ldwi	256
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y
	__pushw
	__ldw_s	2
	__stwps
LL203:

	__pea_s	4
	__ldwi	4
	  call	_random
	__stwps
	__pea_s	2
	__ldwi	16
	  call	_random
	__pushw
	__ldwi	16
	  jsr	smul
	__stwps
	__pea_s	0
	__ldwi	14
	  call	_random
	__pushw
	__ldwi	16
	  jsr	smul
	__stwps
	__ldw_s	4
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL204
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_2
	__pushw
	__ldw_s	4
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_2
	__pushw
	__ldwi	0
	__stwps
LL204:

	__ldw_s	4
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL205
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_2
	__pushw
	__ldw_s	4
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_2
	__pushw
	__ldwi	224
	__stwps
LL205:

	__ldw_s	4
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL206
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_2
	__pushw
	__ldwi	0
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_2
	__pushw
	__ldw_s	2
	__stwps
LL206:

	__ldw_s	4
	__stw	<__temp
	__ldwi	3
	  jsr	eqzp
	__lbeq	LL207
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_2
	__pushw
	__ldwi	256
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_2
	__pushw
	__ldw_s	2
	__stwps
LL207:

	__pea_s	4
	__ldwi	4
	  call	_random
	__stwps
	__pea_s	2
	__ldwi	16
	  call	_random
	__pushw
	__ldwi	16
	  jsr	smul
	__stwps
	__pea_s	0
	__ldwi	14
	  call	_random
	__pushw
	__ldwi	16
	  jsr	smul
	__stwps
	__ldw_s	4
	__stw	<__temp
	__ldwi	0
	  jsr	eqzp
	__lbeq	LL208
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_3
	__pushw
	__ldw_s	4
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_3
	__pushw
	__ldwi	0
	__stwps
LL208:

	__ldw_s	4
	__stw	<__temp
	__ldwi	1
	  jsr	eqzp
	__lbeq	LL209
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_3
	__pushw
	__ldw_s	4
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_3
	__pushw
	__ldwi	224
	__stwps
LL209:

	__ldw_s	4
	__stw	<__temp
	__ldwi	2
	  jsr	eqzp
	__lbeq	LL210
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_3
	__pushw
	__ldwi	0
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_3
	__pushw
	__ldw_s	2
	__stwps
LL210:

	__ldw_s	4
	__stw	<__temp
	__ldwi	3
	  jsr	eqzp
	__lbeq	LL211
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_3
	__pushw
	__ldwi	256
	__stwps
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_3
	__pushw
	__ldw_s	2
	__stwps
LL211:

	__ldwi	LL212
	__pushw
	__ldw	_univers_time
	  jmp	___case
LL214:

	__ldw	_nb_ennemy
	__pushw
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldwi	28672
	__pushw
	__ldwi	185
	__pushw
	__ldwi	0
	__pushw
	__ldwi	1
	__pushw
	__ldwi	1
	  call	_spr_make
	__lbra	LL213
LL215:

	__ldw	_nb_ennemy
	__pushw
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_2
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_2
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldwi	28672
	__pushw
	__ldwi	185
	__pushw
	__ldwi	0
	__pushw
	__ldwi	1
	__pushw
	__ldwi	1
	  call	_spr_make
	__lbra	LL213
LL216:

	__ldw	_nb_ennemy
	__pushw
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_x_3
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldw	_nb_ennemy
	__aslw
	__addwi	_table_y_3
	__stw	__ptr
	__ldwp	__ptr
	__pushw
	__ldwi	28672
	__pushw
	__ldwi	185
	__pushw
	__ldwi	0
	__pushw
	__ldwi	1
	__pushw
	__ldwi	1
	  call	_spr_make
	__lbra	LL213
	__lbra	LL213
LL212:

	.dw	1,LL214,2,LL215,3,LL216
	.dw	LL213,0
LL213:

LL199:

	__addmi	6,__stack
	  rts
	.endp

	.proc _castle_machine
	__ldwi	LL218
	__pushw
	__ldw	_univers_time
	  jmp	___case
LL220:

	__ldwi	LL221
	__pushw
	__ldb	_castle_1
	  jmp	___case
LL223:

	__ldwi	10
	__stw	_dx
	__ldwi	7
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__lbra	LL222
LL224:

	__ldwi	10
	__stw	_dx
	__ldwi	7
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	11
	__stw	_dx
	__ldwi	8
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__lbra	LL222
LL225:

	__ldwi	10
	__stw	_dx
	__ldwi	7
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	11
	__stw	_dx
	__ldwi	8
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	16
	__stw	_dx
	__ldwi	7
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__lbra	LL222
LL226:

	__ldwi	10
	__stw	_dx
	__ldwi	7
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	11
	__stw	_dx
	__ldwi	8
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	16
	__stw	_dx
	__ldwi	7
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__ldwi	17
	__stw	_dx
	__ldwi	8
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__lbra	LL222
	__lbra	LL222
LL221:

	.dw	3,LL223,2,LL224,1,LL225,0,LL226
	.dw	LL222,0
LL222:

	__lbra	LL219
LL227:

	__ldwi	LL228
	__pushw
	__ldb	_castle_2
	  jmp	___case
LL230:

	__ldwi	35
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__lbra	LL229
LL231:

	__ldwi	35
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	35
	__stw	_dx
	__ldwi	8
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__lbra	LL229
LL232:

	__ldwi	35
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	35
	__stw	_dx
	__ldwi	24
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	35
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__lbra	LL229
LL233:

	__ldwi	35
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	35
	__stw	_dx
	__ldwi	24
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	35
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__ldwi	35
	__stw	_dx
	__ldwi	24
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__lbra	LL229
	__lbra	LL229
LL228:

	.dw	3,LL230,2,LL231,1,LL232,0,LL233
	.dw	LL229,0
LL229:

	__lbra	LL219
LL234:

	__ldwi	LL235
	__pushw
	__ldb	_castle_3
	  jmp	___case
LL237:

	__ldwi	32
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__lbra	LL236
LL238:

	__ldwi	32
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	33
	__stw	_dx
	__ldwi	8
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__lbra	LL236
LL239:

	__ldwi	32
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	33
	__stw	_dx
	__ldwi	24
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	38
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__lbra	LL236
LL240:

	__ldwi	32
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	33
	__stw	_dx
	__ldwi	24
	  stx	_al
	__ldwi	6
	  call	_put_tile.3
	__ldwi	38
	__stw	_dx
	__ldwi	23
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__ldwi	39
	__stw	_dx
	__ldwi	24
	  stx	_al
	__ldwi	7
	  call	_put_tile.3
	__lbra	LL236
	__lbra	LL236
LL235:

	.dw	3,LL237,2,LL238,1,LL239,0,LL240
	.dw	LL236,0
LL236:

	__lbra	LL219
	__lbra	LL219
LL218:

	.dw	1,LL220,2,LL227,3,LL234
	.dw	LL219,0
LL219:

LL217:

	  rts
	.endp

	.proc _main
	__addmi	-2,__stack
	  call	_cls
	  call	_init_satb
	  call	_reset_satb
	__ldwi	1
	  stx	_al
	__ldwi	0
	  call	_set_font_color.2
	  call	_load_default_font
	__ldwi	LL0+85
	__phw	3,3
	__ldwi	12
	__phb	1
	__ldwi	12
	  call	_put_string.3
	__ldwi	LL0+94
	__phw	3,3
	__ldwi	4
	__phb	1
	__ldwi	13
	  call	_put_string.3
	__ldwi	LL0+120
	__phw	3,3
	__ldwi	8
	__phb	1
	__ldwi	15
	  call	_put_string.3
LL242:

LL243:

LL244:

	__pea_s	0
	__ldwi	0
	  call	_joy
	__stwps
	__ldw_s	0
	__andwi	8
	__tstw
	__lbeq	LL246
	  call	_timefend
LL246:

	__lbra	LL244
LL245:

LL241:

	__addmi	2,__stack
	  rts
	.endp

	.data
	.bank CONST_BANK
	.org $4000
LL0:
	.db	0,0,0,0,0,0,0,0
	.db	0,0,0,0,0,0,0,0
	.db	0,0,0,0,0,0,0,0
	.db	0,0,0,0,0,0,0,0
	.db	0,0,0,0,0,0,0,0
	.db	0,0,84,39,97,115,32,108
	.db	97,32,119,105,110,32,33,32
	.db	0,69,116,32,108,67,32,32
	.db	104,97,117,116,32,105,108,115
	.db	32,97,105,109,101,110,116,32
	.db	67,39,97,46,0,84,105,109
	.db	101,70,101,110,100,0,70,105
	.db	114,115,116,32,112,114,101,115
	.db	101,110,116,101,100,32,97,116
	.db	32,65,67,50,48,49,53,0
	.db	98,121,32,67,114,51,48,115
	.db	32,38,32,66,106,111,114,110
	.db	0
_leveltiles:
	.dw	42
	.dw	16
	.dw	BANK(_leveltiles__data__)
	.dw	     _leveltiles__data__
	.dw	LL0+0

	.bss
_knight_x:		.ds	2
_knight_y:		.ds	2
_tics_knight:		.ds	2
_frame_knight:		.ds	2
_state_knight:		.ds	2
_dir_knight:		.ds	2
_walk_knight:		.ds	2
_j1:		.ds	2
_ennemy_x:		.ds	2
_ennemy_y:		.ds	2
_univers_time:		.ds	2
_time_move:		.ds	2
_counter:		.ds	2
_table_x:		.ds	32
_table_y:		.ds	32
_table_z:		.ds	32
_nb_ennemy:		.ds	2
_table_x_2:		.ds	32
_table_y_2:		.ds	32
_table_z_2:		.ds	32
_nb_ennemy_2:		.ds	2
_table_x_3:		.ds	32
_table_y_3:		.ds	32
_table_z_3:		.ds	32
_nb_ennemy_3:		.ds	2
_ram_knight_addr:		.ds	2
_ram_knight_addr2:		.ds	2
_ram_knight_atk1:		.ds	2
_ram_knight_atk2:		.ds	2
_ram_knight_atk3:		.ds	2
_castle_1:		.ds	1
_castle_2:		.ds	1
_castle_3:		.ds	1
_alive_iter:		.ds	1
_alive_total:		.ds	1
_init_cnt_alive:		.ds	1
__arg:

;0 error(s) in compilation
;	literal pool:137
;	constant pool:10
;	global pool:2944
;	Macro pool:1196