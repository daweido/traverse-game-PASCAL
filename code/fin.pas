unit fin;

interface
uses gLib2D,SDL_TTF,menu,highlights,restart;

const
x_max_tt = 641;
x_min_tt = 359;

y_max_rejouer = 410;
y_min_rejouer = 330;

y_max_menu = 555;
y_min_menu = 475;

y_max_quitter = 700;
y_min_quitter = 620;

procedure menuFin(var mens : men;VAR victoire,tampo,menJou,choixNbJ,j1,j2,j3,j4: boolean;var nb_joueurs,cj : integer;jGagnant : integer;VAR plato : plateauDyn);

Implementation

procedure loadFin(VAR findepartie : gImage;jGagnant : integer);
begin
	if jGagnant = 1 then findepartie := gTexLoad('./images/findepartieJ1.png');
	if jGagnant = 2 then findepartie := gTexLoad('./images/findepartieJ2.png');
	if jGagnant = 3 then findepartie := gTexLoad('./images/findepartieJ3.png');
	if jGagnant = 4 then findepartie := gTexLoad('./images/findepartieJ4.png');
end;

function bouttonsF(VAR tampo,menJou,choixNbJ,victoire,j1,j2,j3,j4 : boolean;var nb_joueurs,cj : integer;var plato : plateauDyn): men;
var
	tmp : men;
begin
	if ((sdl_get_mouse_x < x_max_tt) and (sdl_get_mouse_x > x_min_tt)) then begin
		if ((sdl_get_mouse_y < y_max_rejouer) and (sdl_get_mouse_y > y_min_rejouer)) then begin //Bouton Jouer MenuA
			if sdl_mouse_left_down then begin
				writeln('REJOUER');
				tmp.menus := false;
				menJou := true;
				choixNbJ := true;
				tampo := false;
				victoire := false;
				rein(plato,j1,j2,j3,j4,cj);
				tmp.id := 1;
			end;
		end
		else if ((sdl_get_mouse_y < y_max_menu) and (sdl_get_mouse_y > y_min_menu)) then begin
			if sdl_mouse_left_down then begin
				tmp.menus := false;
				tampo := true;
				menJou := true;
				rein(plato,j1,j2,j3,j4,cj);
				choixNbJ := true;
			end;
		end
		else if ((sdl_get_mouse_y < y_max_quitter) and (sdl_get_mouse_y > y_min_quitter)) then begin
			if sdl_mouse_left_down then begin
				tmp.menus := false;
				tampo := false;
				menJou := true;
				choixNbJ := true;
				tmp.id := 4;
			end;
		end
		else tmp.menus := true;
	end;
	bouttonsF := tmp;
end;

procedure affiFin(jGagnant : integer);
var
	findepartie :gImage;
	x,y : integer;
begin
	loadFin(findepartie,jGagnant);
	x := SCR_W div 2;
	y := SCR_H div 2;
	gBeginRects(findepartie);
		gSetCoordMode(G_CENTER);
		gSetScaleWH(SCR_W,SCR_H+8);
		gSetCoord(x,y);
		gAdd();
	gEnd();
end;

procedure menuFin(var mens : men;VAR victoire,tampo,menJou,choixNbJ,j1,j2,j3,j4: boolean;var nb_joueurs,cj : integer;jGagnant : integer;VAR plato : plateauDyn);
begin
	mens := bouttonsF(tampo,menJou,choixNbJ,victoire,j1,j2,j3,j4,nb_joueurs,cj,plato);
	if mens.menus = true then affiFin(jGagnant)
	else victoire := false;
end;
end.
