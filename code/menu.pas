unit menu;

interface
uses gLib2D,SDL,plateau,deplacements,highlights,saveLoad;

type men = record
		menus : boolean;
		id : integer;
	end;

const
	SCR_W = 1000;
	SCR_H = 750;
////////////////Menu Principal
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

	x_max_retour = 967;
	x_min_retour = 685;

	y_max_retour = 686;
	y_min_retour = 606;
////////////Menu Jouer
	nv_xmin = 72;
	nv_xmax = 354;
	nv_ymin = 335;
	nv_ymax = 415;
	charg_xmin = 646;
	charg_xmax = 928;
	charg_ymin = 335;
	charg_ymax = 415;
/////////Menu Nouvelle partie
	bouton_jx_min = 359;
	bouton_jx_max = 641;
	bouton_1jy_min = 189;
	bouton_1jy_max = 269;
	bouton_2jy_min = 319;
	bouton_2jy_max = 399;
	bouton_3jy_min = 449;
	bouton_3jy_max = 529;
	bouton_4jy_min = 579;
	bouton_4jy_max = 5659;
//////////////Menu Réglgages
	bouton1_y_min = 214;
	bouton1_y_max = 294;
	bouton2_y_min = 354;
	bouton2_y_max = 434;
	bouton3_y_min = 494;
	bouton3_y_max = 574;

function iniMenus(i : integer):gImage;
function bouttonsJ: men;
procedure affiMenu(image : gImage);
procedure principalMenu(var tampo : boolean; var mens : men;menuJ: gImage);
procedure commentMenu(var retCmt : boolean; var mCmt : men;menuC : gImage);
procedure reglagesMenu(var retReg : boolean; var mnR : men;menuR :gImage);
procedure menuJouer(var mn : men;var menJou : boolean);
procedure menuNvPartie(var mNb : men;var choixNbJ : boolean);


Implementation
////////////////Menu Principal
// Si plusieurs image faire un tableau d'image
function iniMenus(i : integer):gImage;
begin
	if i = 1 then iniMenus := gTexLoad('./images/menu.png')
	else if i = 2 then iniMenus := gTexLoad('./images/commentJouer.png')
	else iniMenus := gTexLoad('./images/reglages.png')
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


function boutonCmt: men;
var
	tmp : men;
begin
	if ((sdl_get_mouse_x < x_max_retour) and (sdl_get_mouse_x > x_min_retour) and (sdl_get_mouse_y < y_max_retour) and (sdl_get_mouse_y > y_min_retour)) then begin
		if sdl_mouse_left_down then begin
			tmp.menus := false;
			tmp.id := 1;
		end;
	end
	else tmp.menus := true;
	boutonCmt := tmp;
end;

function boutonReg: men;
var
	tmp : men;
begin
	if ((sdl_get_mouse_x < x_max_retour) and (sdl_get_mouse_x > x_min_retour) and (sdl_get_mouse_y < y_max_retour) and (sdl_get_mouse_y > y_min_retour)) then begin
		if sdl_mouse_left_down then begin
			tmp.menus := false;
			tmp.id := 4;
		end;
	end
	else if ((sdl_get_mouse_x < x_max_A) and (sdl_get_mouse_x > x_min_A)) then begin
		if ((sdl_get_mouse_y < bouton1_y_max) and (sdl_get_mouse_y > bouton1_y_min)) then begin //Bouton Jouer MenuA
			if sdl_mouse_left_down then begin
				tmp.id := 1;
				tmp.menus := false;
			end;
		end
		else if ((sdl_get_mouse_y < bouton2_y_max) and (sdl_get_mouse_y > bouton2_y_min)) then begin
			if sdl_mouse_left_down then begin
				tmp.id := 2;
				tmp.menus := false;
			end;
		end
		else if ((sdl_get_mouse_y < bouton3_y_max) and (sdl_get_mouse_y > bouton3_y_min)) then begin
			if sdl_mouse_left_down then begin
				tmp.id := 3;
				tmp.menus := false;
			end;
		end;
	end
	else tmp.menus := true;
	boutonReg := tmp;
end;

procedure commentMenu(var retCmt : boolean; var mCmt : men; menuC : gImage); // Recopier la procedure d'en bas mais pour le menu comment Jouer
begin
	mCmt := boutonCmt;
	if (mCmt.menus = true) then begin
		affiMenu(menuC);
	end
	else retCmt := false;
end;

////////////////////////Réglages
procedure reglagesMenu(var retReg : boolean; var mnR : men;menuR :gImage);
begin
	mnR := boutonReg;
	if (mnR.menus = true) then begin
		affiMenu(menuR);
	end
	else retReg := false;
end;

procedure principalMenu(var tampo : boolean; var mens : men;menuJ: gImage);
begin
	mens := bouttonsJ;
	if mens.menus = true then begin
		affiMenu(menuJ);
	end
	else tampo := false;
end;

/////////////////Menu Jouer
function choixJouer():men;
var
	tmp : men;
begin
if ((sdl_get_mouse_x < nv_xmax) and (sdl_get_mouse_x > nv_xmin) and (sdl_get_mouse_y < nv_ymax) and (sdl_get_mouse_y > nv_ymin)) then begin
	if sdl_mouse_left_down then begin
		tmp.menus := false;
		tmp.id := 1;
	end;
end
else if ((sdl_get_mouse_x < charg_xmax) and (sdl_get_mouse_x > charg_xmin) and (sdl_get_mouse_y < charg_ymax) and (sdl_get_mouse_y > charg_ymin)) then begin
	if sdl_mouse_left_down then begin
		tmp.menus := false;
		tmp.id := 2;
	end;
end
else if ((sdl_get_mouse_x < x_max_retour) and (sdl_get_mouse_x > x_min_retour) and (sdl_get_mouse_y < y_max_retour) and (sdl_get_mouse_y > y_min_retour)) then begin
	if sdl_mouse_left_down then begin
		tmp.menus := false;
		tmp.id := 3;
	end;
end
else begin
	tmp.menus := true;
end;
choixJouer := tmp;
end;

procedure menuJouer(var mn : men;var menJou : boolean);
var
	menuJou : gImage;
begin
	mn := choixJouer();
	if mn.menus = true then begin
		menuJou := gTexLoad('./images/jouer.png');
		affiMenu(menuJou);
	end
	else menJou := false;
end;
/////////////////////Menu Nouvelle partie
function choixNbJoueurs():men;
var
	tmp : men;
begin
if ((sdl_get_mouse_x < bouton_jx_max) and (sdl_get_mouse_x > bouton_jx_min)) then begin
	if ((sdl_get_mouse_y < bouton_1jy_max) and (sdl_get_mouse_y > bouton_1jy_min)) then begin
		if sdl_mouse_left_down then begin
			tmp.menus := false;
			tmp.id := 1;
		end;
	end
	else if ((sdl_get_mouse_y < bouton_2jy_max) and (sdl_get_mouse_y > bouton_2jy_min)) then begin
		if sdl_mouse_left_down then begin
			tmp.menus := false;
			tmp.id := 2;
		end;
	end
	else if ((sdl_get_mouse_y < bouton_3jy_max) and (sdl_get_mouse_y > bouton_3jy_min)) then begin
		if sdl_mouse_left_down then begin
			tmp.menus := false;
			tmp.id := 3;
		end;
	end
	else if ((sdl_get_mouse_y < bouton_4jy_max) and (sdl_get_mouse_y > bouton_4jy_min)) then begin
		if sdl_mouse_left_down then begin
			tmp.menus := false;
			tmp.id := 4;
		end;
	end
	else tmp.menus := true;
end
else if ((sdl_get_mouse_x < x_max_retour) and (sdl_get_mouse_x > x_min_retour) and (sdl_get_mouse_y < y_max_retour) and (sdl_get_mouse_y > y_min_retour)) then begin
	if sdl_mouse_left_down then begin
		tmp.menus := false;
		tmp.id := 5;
	end;
end
else tmp.menus := true;
choixNbJoueurs := tmp;
end;

procedure menuNvPartie(var mNb : men;var choixNbJ : boolean);
var
	menuNv : gImage;
begin
	mNb := choixNbJoueurs();
	if mNb.menus = true then begin
		menuNv := gTexLoad('./images/nouvellePartie.png');
		affiMenu(menuNv);
	end
	else choixNbJ := false;
end;

end.
