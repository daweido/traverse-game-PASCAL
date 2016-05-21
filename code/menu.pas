unit menu;

interface
uses gLib2D,SDL,plateau,deplacements,highlights;

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

	x_max_retourCR = 967;
	x_min_retourCR = 685;

	y_max_retourCR = 686;
	y_min_retourCR = 606;




function iniMenus(i : integer):gImage;
function bouttonsJ: men;
procedure affiMenu(image : gImage);
procedure principalMenu(var tampo : boolean; var mens : men; plato : plateauDyn; menuJ: gImage);
procedure commentMenu(var tampo : boolean; var mens : men;menuJ,menuC : gImage); // Recopier la procedure d'en bas mais pour le menu comment Jouer
procedure reglagesMenu(var tampo : boolean; var mens : men; menuJ,menuR :gImage);


Implementation

// Si plusieurs image faire un tableau d'image
function iniMenus(i : integer):gImage;
begin
	if i = 1 then iniMenus := gTexLoad('menu.png')
	else if i = 2 then iniMenus := gTexLoad('commentJouer.png')
	else iniMenus := gTexLoad('reglages.png')
end;

procedure affiMenu(image : gImage);
var
	x, y : integer;
begin
	gclear(WHITE);
	x := SCR_W div 2;
	y := SCR_H div 2;

	gBeginRects(image);
		gSetCoordMode(G_CENTER);
		gSetScaleWH(SCR_W,SCR_H+8);
		gSetCoord(x,y);
		gAdd();
	gEnd();
end;

function bouttonsJ: men;
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
	bouttonsJ := tmp;
end;


function bouttonCR: men;
var
	tmp : men;
begin
	if ((sdl_get_mouse_x < x_max_retourCR) and (sdl_get_mouse_x > x_min_retourCR) and (sdl_get_mouse_y < y_max_retourCR) and (sdl_get_mouse_y > y_min_retourCR)) then begin
		if sdl_mouse_left_down then begin
			tmp.menus := false;
		end;
	end
	else tmp.menus := true;
	bouttonCR := tmp;
end;

procedure commentMenu(var tampo : boolean; var mens : men;menuJ,menuC : gImage); // Recopier la procedure d'en bas mais pour le menu comment Jouer
begin
	mens := bouttonCR;
	writeln('120');
	if (mens.menus = true) then begin
		writeln('121');
		affiMenu(menuC);
	end
	else begin
		affiMenu(menuJ);
		writeln('123');
		tampo := true;
	end;
end;

procedure reglagesMenu(var tampo : boolean; var mens : men; menuJ,menuR :gImage);
begin
	mens := bouttonCR;
	if (mens.menus = true) then begin
		writeln('121');
		affiMenu(menuR);
	end
	else begin
		affiMenu(menuJ);
		writeln('123');
		tampo := true;
	end;
end;


procedure principalMenu(var tampo : boolean; var mens : men; plato : plateauDyn; menuJ: gImage);
begin
	mens := bouttonsJ;
	if mens.menus = true then begin
		affiMenu(menuJ);
	end
	else begin
		tampo := false;
	end;
end;
end.
