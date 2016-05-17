unit plateau;

interface
uses gLib2D,SDL_TTF,sysutils,pions;

type pion = record
		identif : integer;
		clr : integer;
	end;

TYPE plat = record
		x,y: integer;
		p : pion;
		couleur : gColor;
	end;

type
	plateauDyn = array of plat;


function creaPlateau():plateauDyn;
procedure affiPlateau(VAR plato : plateauDyn;VAR selectione : boolean;VAR i_d, i_a : integer);


Implementation

function creaPlateau():plateauDyn;
var
	i,j,x,y : integer;
	plato : plateauDyn;
begin
	SetLength(plato,100);
	gclear(WHITE);
	x := 200;
	y := 75;
	for i := 0 to 9 do begin
		for j := 0 to 9 do begin
			plato[(i*10)+j].x := x;
			plato[(i*10)+j].y := y;
			if (j mod 2 = 1) then
				if (i mod 2 = 1) then plato[(i*10)+j].couleur := black
				else plato[(i*10)+j].couleur := white
			else
				if (i mod 2 = 0) then plato[(i*10)+j].couleur := black
				else plato[(i*10)+j].couleur := white;
			x += 60;
		end;
		x := 200;
		y += 60;
	end;

//////Partie Inaccessible/////
	plato[0].p.identif := 5;
	plato[9].p.identif := 5;
	plato[90].p.identif := 5;
	plato[99].p.identif := 5;
///////////////////////////////
	plato[98].p.identif := 1;
	plato[91].p.identif := 1;
	plato[92].p.identif := 2;
	plato[96].p.identif := 2;
	plato[93].p.identif := 3;
	plato[97].p.identif := 3;
	plato[94].p.identif := 4;
	plato[95].p.identif := 4;
	plato[98].p.clr := 1;
	plato[91].p.clr := 2;
	plato[92].p.clr := 3;
	plato[96].p.clr := 4;
	plato[93].p.clr := 1;
	plato[97].p.clr := 2;
	plato[94].p.clr := 3;
	plato[95].p.clr := 4;
	creaPlateau := plato;
end;

{
0 : empty
1 : square
2 : triangle
3 : losange
4 : circle
}

procedure affiPions(plato : plateauDyn);
var
	i : integer;
begin
	for i := 0 to 99 do begin
		case plato[i].p.identif of
			1 : carres(plato[i].x,plato[i].y,plato[i].p.clr);
			2 : triangles(plato[i].x,plato[i].y,plato[i].p.clr);
			3 : losanges(plato[i].x,plato[i].y,plato[i].p.clr);
			4 : cercles(plato[i].x,plato[i].y,plato[i].p.clr)
		end;
	end;
end;

function caseVide(plato : plateauDyn; i : integer): boolean;
begin
	if plato[i].p.identif <> 0 then caseVide := false;
end;

//Ajouter exception dans le déplacement en fonction de la couelur du pion (Premierement vérifié les cases des coins)
// + faire les camps accessible seulement par les couleurs concernés
procedure deplacement(var plato : plateauDyn;var selectione : boolean; VAR i_d, i_a : integer);
begin
////Carré
	if plato[i_d].p.identif = 1 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+10) or (i_a = i_d-10)) then begin
				plato[i_a].p.identif := 1;
				plato[i_a].p.clr := plato[i_d].p.clr;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end;
	end
////Triangle
	else if plato[i_d].p.identif = 2 then begin
		if (plato[i_d].p.clr = 1) then begin
			if ((i_a = i_d+10) or (i_a = i_d-9) or (i_a = i_d+11)) then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 1;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end
		else if (plato[i_d].p.clr = 2) then begin
			if ((i_a = i_d-10) or (i_a = i_d+9) or (i_a = i_d+11)) then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 2;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end
		else if (plato[i_d].p.clr = 3) then begin
			if ((i_a = i_d+1) or (i_a = i_d+9) or (i_a = i_d-11)) then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 3;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end
		else begin
			if ((i_a = i_d-1) or (i_a = i_d-9) or (i_a = i_d+11)) then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 1;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end;
	end
/////Losange
	else if plato[i_d].p.identif = 3 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+11) or (i_a = i_d-11) or (i_a = i_d+9) or (i_a = i_d-9)) then begin
				plato[i_a].p.identif := 3;
				plato[i_a].p.clr := plato[i_d].p.clr;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end;
	end
//////Cercle
	else if plato[i_d].p.identif = 3 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+9) or (i_a = i_d-9) or (i_a = i_d+10) or (i_a = i_d-10) or (i_a = i_d+11) or (i_a = i_d-11)) then begin
				plato[i_a].p.identif := 4;
				plato[i_a].p.clr := plato[i_d].p.clr;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end;
	end
	else begin
		i_d := 0;
		i_a := 0;
	end;
	selectione := false;
end;
//Trouver un moyen de stocker i_d et i_a quelque part :
// Peut être faire une variable global et la mettre en variable de sortie dès le début
procedure selectionCase(VAR plato : plateauDyn;VAR selectione : boolean;VAR i_d, i_a : integer);
var
	i,xm,ym : integer; // i départ ; i arrivé
begin
	for i := 0 to 99 do begin
		xm := sdl_get_mouse_x;
		ym := sdl_get_mouse_y;
		if ((xm > plato[i].x) and (xm < plato[i].x +60)) and ((ym > plato[i].y) and (ym < plato[i].y +60)) then begin
			if sdl_mouse_left_down then begin
				if ((not caseVide(plato,i)) and (selectione = false)) then begin
					selectione := true;
					gDrawRect(plato[i].x+2, plato[i].y+2,57,57,SPRING_GREEN);
					gDrawRect(plato[i].x+3, plato[i].y+3,55,55,SPRING_GREEN);
					i_d := i;
					writeln(i_d);
				end
				else if (caseVide(plato,i)) and (selectione = true) then begin
					gDrawRect(plato[i].x+2,plato[i].y+2,57,57,RED);
					gDrawRect(plato[i].x+3,plato[i].y+3,55,55,RED);
					i_a := i;
					writeln(i_a);
					writeln(i_d);
					deplacement(plato,selectione,i_d,i_a);
				end
				else begin
					gDrawRect(plato[i].x+2,plato[i].y+2,57,57,BLUE);
					gDrawRect(plato[i].x+3,plato[i].y+3,55,55,BLUE);
				end;
			end;
		end;
	end;
end;

procedure affiPlateau(VAR plato : plateauDyn;VAR selectione : boolean;VAR i_d, i_a : integer);
var
	i : integer;
begin

	gclear(WHITE);
	for i := 0 to 99 do gFillRect(plato[i].x,plato[i].y,60,60,plato[i].couleur);
	gDrawRect(200,75,600,600,BLACK);
	affiPions(plato);
	//verif_cases(plato);
	selectionCase(plato,selectione,i_d,i_a);

end;

procedure verif_cases(var plato : plateauDyn);
var
	i,xm,ym : integer;
begin
	for i := 0 to 99 do begin
		xm := sdl_get_mouse_x;
		ym := sdl_get_mouse_y;
		if ((xm > plato[i].x) and (xm < plato[i].x + 60)) and ((ym > plato[i].y) and (ym < plato[i].y + 60)) then gFillRect(plato[i].x,plato[i].y,60,60,red);
	end;
end;

end.
