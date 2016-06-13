unit paused;

interface
uses gLib2D,saveLoad,restart,highlights,loadImages;

const
	pause_x_min = 374;
	pause_x_max = 624;
	pause_repry_min = 275;
	pause_repry_max = 333;
	pause_savey_min = 373;
	pause_savey_max = 431;
	pause_quity_min = 471;
	pause_quity_max = 529;

procedure drawMenuPause(var tampo,pause,menJou,choixNbJ,j1,j2,j3,j4,loaded : boolean;VAR plato : plateauDyn;VAR cj : integer;nb_joueurs : integer;theme : images);

Implementation

procedure menu_pause(Var tampo,pause,menJou,choixNbJ,j1,j2,j3,j4,loaded : boolean;VAR plato : plateauDyn;VAR cj : integer;nb_joueurs : integer);
begin
	if ((sdl_get_mouse_x < pause_x_max) and (sdl_get_mouse_x > pause_x_min)) then begin
		if ((sdl_get_mouse_y < pause_repry_max) and (sdl_get_mouse_y > pause_repry_min)) then begin //Bouton Jouer MenuA
			if sdl_mouse_left_down then pause := false;
		end;
		if ((sdl_get_mouse_y < pause_savey_max) and (sdl_get_mouse_y > pause_savey_min)) then begin
			if sdl_mouse_left_down then begin
				sauvegarde(plato,j1,j2,j3,j4,nb_joueurs,cj);
			end;
		end;
		if ((sdl_get_mouse_y < pause_quity_max) and (sdl_get_mouse_y > pause_quity_min)) then begin
			if sdl_mouse_left_down then begin
				choixNbJ := true;
				menJou := true;
				pause := false;
				tampo := true;
				loaded := false;
				rein(plato,j1,j2,j3,j4,cj);
			end;
		end;
	end;
end;

procedure loadPause(var pauseMenu : gImage;theme : images);
begin
	pauseMenu := theme.menus[6];
	gBeginRects(pauseMenu);
		gSetCoordMode(G_CENTER);
		gSetScaleWH(500,375);
		gSetCoord(G_SCR_W div 2,G_SCR_H div 2);
		gAdd();
	gEnd();
end;

procedure drawMenuPause(var tampo,pause,menJou,choixNbJ,j1,j2,j3,j4,loaded : boolean;VAR plato : plateauDyn;VAR cj : integer;nb_joueurs : integer;theme : images);
var
	pauseMenu : gImage;
begin
	gFillRectAlpha(0, 0, 1000, 750,BLACK,125);
	loadPause(pauseMenu,theme);
	 menu_pause(tampo,pause,menJou,choixNbJ,j1,j2,j3,j4,loaded,plato,cj,nb_joueurs);
end;


end.
