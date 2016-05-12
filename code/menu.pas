unit menu;

interface
uses gLib2D,SDL,plateau;

type men = record
		menus : boolean;
		id : integer;
	end;
const
	SCR_W = 1000;
	SCR_H = 750;

	x_min_A = 359.43;
	x_max_A = 640.9;

	y_min_Jouer = 191.4;
	y_max_Jouer = 270.6;

	y_min_Cmt = 308.4;
	y_max_Cmt = 387.6;

	y_min_Rgl = 432.4;
	y_max_Rgl = 511.6;

	y_min_Ex = 587.4;
	y_max_Ex = 666.6;



function iniMenus:gImage;
function bouttons: men;
procedure affiMenuA(image : gImage);
procedure principalMenu(var tampo : boolean; var mens : men; plato : plateauDyn; menua : gImage);
Implementation

// Si plusieurs image faire un tableau d'image
function iniMenus:gImage;
begin
	iniMenus := gTexLoad('menu.png');
end;

procedure affiMenuA(image : gImage);
var
	x, y : integer;
begin
	gclear(WHITE);
	x := SCR_W div 2;
	y := SCR_H div 2;

	gBeginRects(image);
		gSetCoordMode(G_CENTER);
		gSetScaleWH(SCR_W,SCR_H);
		gSetCoord(x,y);
		gAdd();
	gEnd();
end;

function bouttons: men;
var
	tmp : men;
begin
	if ((sdl_get_mouse_x < x_max_A) and (sdl_get_mouse_x > x_min_A)) then begin
		if ((sdl_get_mouse_y < y_max_Jouer) and (sdl_get_mouse_y > y_min_jouer)) then begin //Bouton Jouer MenuA
			if sdl_mouse_left_down then begin
				tmp.menus := false;
				tmp.id := 1;
			end;
		end
		else if ((sdl_get_mouse_y < y_max_Cmt) and (sdl_get_mouse_y > y_min_Cmt)) then begin
			if sdl_mouse_left_down then begin
				tmp.menus := false;
				tmp.id := 2;
			end;
		end
		else if ((sdl_get_mouse_y < y_max_Rgl) and (sdl_get_mouse_y > y_min_Rgl)) then begin
			if sdl_mouse_left_down then begin
				tmp.menus := false;
				tmp.id := 3;
			end;
		end
		else if ((sdl_get_mouse_y < y_max_Ex) and (sdl_get_mouse_y > y_min_Ex)) then begin
			if sdl_mouse_left_down then begin
				tmp.menus := false;
				tmp.id := 4;
			end;
		end
		else tmp.menus := true;
	end;
	bouttons := tmp;
end;

procedure principalMenu(var tampo : boolean; var mens : men; plato : plateauDyn; menua : gImage);
begin
	if tampo = true then mens := bouttons;
	if mens.menus = true then begin
		affiMenuA(menua);
	end
	else begin
		if mens.id = 1 then affiPlateau(plato)
		else if mens.id = 2 then gClear(WHITE)
		else if mens.id = 3 then gClear(red)
		else exit;
		tampo := false;
	end;
end;

end.
