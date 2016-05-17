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
procedure affiPlateau(VAR plato : plateauDyn;VAR selectione,j1,j2,j3,j4 : boolean;VAR i_d, i_a : integer;nb_joueurs : integer);
procedure def_nb_joueurs(VAR plato : plateauDyn; VAR nb_joueurs : integer);


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
//////
	creaPlateau := plato;
end;

{
0 : empty
1 : square
2 : triangle
3 : losange
4 : circle
}

procedure ini_1j(VAR plato : plateauDyn);
var
	i : integer;
begin
	for i := 91 to 98 do begin
		plato[i].p.clr := 1;
		if ((i = 91) or (i=98)) then plato[i].p.identif := 1
		else if ((i = 92) or (i=97)) then plato[i].p.identif := 2
		else if	((i = 93) or (i=96)) then plato[i].p.identif := 3
		else plato[i].p.identif := 4;
	end;
end;

procedure ini_2j(VAR plato : plateauDyn);
var
	i : integer;
begin
	ini_1j(plato);
	for i := 1 to 8 do begin
		plato[i].p.clr := 2;
		if ((i = 1) or (i=8)) then plato[i].p.identif := 1
		else if ((i = 2) or (i=7)) then plato[i].p.identif := 2
		else if	((i = 3) or (i=6)) then plato[i].p.identif := 3
		else plato[i].p.identif := 4;
	end;
end;

procedure ini_3j(VAR plato : plateauDyn);
begin
	ini_2j(plato);
	plato[19].p.clr := 3;
	plato[19].p.identif := 1;
	plato[29].p.clr := 3;
	plato[29].p.identif := 2;
	plato[39].p.clr := 3;
	plato[39].p.identif := 3;
	plato[49].p.clr := 3;
	plato[49].p.identif := 4;
	plato[59].p.clr := 3;
	plato[59].p.identif := 4;
	plato[69].p.clr := 3;
	plato[69].p.identif := 3;
	plato[79].p.clr := 3;
	plato[79].p.identif := 2;
	plato[89].p.clr := 3;
	plato[89].p.identif := 1;
end;

procedure ini_4j(VAR plato : plateauDyn);
begin
	ini_3j(plato);
	plato[10].p.clr := 4;
	plato[10].p.identif := 1;
	plato[20].p.clr := 4;
	plato[20].p.identif := 2;
	plato[30].p.clr := 4;
	plato[30].p.identif := 3;
	plato[40].p.clr := 4;
	plato[40].p.identif := 4;
	plato[50].p.clr := 4;
	plato[50].p.identif := 4;
	plato[60].p.clr := 4;
	plato[60].p.identif := 3;
	plato[70].p.clr := 4;
	plato[70].p.identif := 2;
	plato[80].p.clr := 4;
	plato[80].p.identif := 1;
end;

procedure def_nb_joueurs(VAR plato : plateauDyn; VAR nb_joueurs : integer);
begin
	write('Nombre de joueurs : ');
	readln(nb_joueurs);
	if nb_joueurs = 1 then ini_1j(plato)
	else if nb_joueurs = 2 then ini_2j(plato)
	else if nb_joueurs = 3 then ini_3j(plato)
	else ini_4j(plato);
end;

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

procedure j_2(VAR j1,j2 : boolean);
begin
	if j1 = true then begin
		j1 := false;
		j2 := true;
	end
	else begin
		j1 := true;
		j2 := false;
	end;
end;

procedure j_3(VAR j1,j2,j3 : boolean);
begin
	if j1 = true then begin
		j1 := false;
		j2 := true;
	end
	else if j2 = true then begin
		j3 := true;
		j2 := false;
	end
	else begin
		j3 := false;
		j1 := true;
	end;
end;

procedure j_4(VAR j1,j2,j3,j4 : boolean);
begin
	if j1 = true then begin
		j1 := false;
		j2 := true;
	end
	else if j2 = true then begin
		j3 := true;
		j2 := false;
	end
	else if j3 = true then begin
		j3 := false;
		j4 := true;
	end
	else begin
		j4 := false;
		j1 := true;
	end;
end;


procedure tours(VAR j1,j2,j3,j4 : boolean; nb_joueurs : integer);
begin
	IF nb_joueurs = 1 then j1 := j1
	else if nb_joueurs = 2 then j_2(j1,j2)
	else if nb_joueurs = 3 then j_3(j1,j2,j3)
	else j_4(j1,j2,j3,j4);
end;

function saut_pion(plato : plateauDyn; i_d,i_a : integer):boolean;
begin
///Carré
	if plato[i_d].p.identif = 1 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+2) and (plato[i_d+1].p.identif <> 0)) or
			((i_a = i_d-2) and (plato[i_d-1].p.identif <> 0)) or
			((i_a = i_d+20) and (plato[i_d+10].p.identif <> 0)) or
			((i_a = i_d-20) and (plato[i_d-10].p.identif <> 0)) then saut_pion := true
			else saut_pion := false;
		end;
	end
////Triangle
	else if plato[i_d].p.identif = 2 then begin
		if (plato[i_d].p.clr = 1) then begin
			if ((i_a = i_d+20) and (plato[i_d+10].p.identif <> 0)) or
			((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) or
			((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) then saut_pion := true
			else saut_pion := false;
		end
		else if (plato[i_d].p.clr = 2) then begin
			if ((i_a = i_d-20) and (plato[i_d-10].p.identif <> 0)) or
			((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
			((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) then saut_pion := true
			else saut_pion := false;
		end
		else if (plato[i_d].p.clr = 3) then begin
			if ((i_a = i_d+2) and (plato[i_d+1].p.identif <> 0)) or
			((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
			((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) then saut_pion := true
			else saut_pion := false;
		end
		else begin
			if ((i_a = i_d-2) and (plato[i_d-1].p.identif <> 0)) or
			((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) or
			((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) then saut_pion := true
			else saut_pion := false;
		end;
	end
/////Losange
	else if plato[i_d].p.identif = 3 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) or
			((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) or
			((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
			((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) then saut_pion := true
			else saut_pion := false;
		end;
	end
//////Cercle
	else if plato[i_d].p.identif = 4 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+2) and (plato[i_d+1].p.identif <> 0))  or
			((i_a = i_d-2) and (plato[i_d-1].p.identif <> 0)) or
			((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
			((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) or
			((i_a = i_d+20) and (plato[i_d+10].p.identif <> 0)) or
			((i_a = i_d-20) and (plato[i_d-10].p.identif <> 0)) or
			((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) or
			((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) then saut_pion := true
			else saut_pion := false;
		end;
	end
	else saut_pion := false;
end;
//Ajouter exception dans le déplacement en fonction de la couelur du pion (Premierement vérifié les cases des coins)
// + faire les camps accessible seulement par les couleurs concernés
procedure deplacement(var plato : plateauDyn;var selectione,j1,j2,j3,j4 : boolean; VAR i_d, i_a : integer; nb_joueurs : integer);
begin
////Carré
	if plato[i_d].p.identif = 1 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+10) or (i_a = i_d-10)) or saut_pion(plato,i_d,i_a) then begin
				plato[i_a].p.identif := 1;
				plato[i_a].p.clr := plato[i_d].p.clr;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
				tours(j1,j2,j3,j4,nb_joueurs);
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
			if ((i_a = i_d+10) or (i_a = i_d-9) or (i_a = i_d-11)) or saut_pion(plato,i_d,i_a)then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 1;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
				tours(j1,j2,j3,j4,nb_joueurs);
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end
		else if (plato[i_d].p.clr = 2) then begin
			if ((i_a = i_d-10) or (i_a = i_d+9) or (i_a = i_d+11)) or saut_pion(plato,i_d,i_a) then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 2;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
				tours(j1,j2,j3,j4,nb_joueurs);
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end
		else if (plato[i_d].p.clr = 3) then begin
			if ((i_a = i_d+1) or (i_a = i_d+9) or (i_a = i_d-11)) or saut_pion(plato,i_d,i_a) then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 3;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
				tours(j1,j2,j3,j4,nb_joueurs);
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end
		else begin
			if ((i_a = i_d-1) or (i_a = i_d-9) or (i_a = i_d+11)) or saut_pion(plato,i_d,i_a) then begin
				plato[i_a].p.identif := 2;
				plato[i_a].p.clr := 4;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
				tours(j1,j2,j3,j4,nb_joueurs);
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
			if ((i_a = i_d+11) or (i_a = i_d-11) or (i_a = i_d+9) or (i_a = i_d-9)) or saut_pion(plato,i_d,i_a) then begin
				plato[i_a].p.identif := 3;
				plato[i_a].p.clr := plato[i_d].p.clr;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
				tours(j1,j2,j3,j4,nb_joueurs);
			end
			else begin
				i_d := 0;
				i_a := 0;
			end;
		end;
	end
//////Cercle
	else if plato[i_d].p.identif = 4 then begin
		if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
			if ((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+9) or (i_a = i_d-9) or (i_a = i_d+10) or (i_a = i_d-10) or (i_a = i_d+11) or (i_a = i_d-11)) or saut_pion(plato,i_d,i_a) then begin
				plato[i_a].p.identif := 4;
				plato[i_a].p.clr := plato[i_d].p.clr;
				plato[i_d].p.identif := 0;
				plato[i_d].p.clr := 0;
				tours(j1,j2,j3,j4,nb_joueurs);
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


function bon_pion(plato : plateauDyn;i :integer; j1,j2,j3,j4 : boolean): boolean;
begin
	if ((plato[i].p.clr = 1) and (j1 = false)) then bon_pion := false
	else if ((plato[i].p.clr = 2) and (j2 = false)) then bon_pion := false
	else if ((plato[i].p.clr = 3) and (j3 = false)) then bon_pion := false
	else if ((plato[i].p.clr = 4) and (j4 = false)) then bon_pion := false
	else bon_pion := true;
end;

procedure selectionCase(VAR plato : plateauDyn;VAR selectione,j1,j2,j3,j4 : boolean;VAR i_d, i_a : integer;nb_joueurs : integer);
var
	i,xm,ym : integer; // i départ ; i arrivé
begin
	for i := 0 to 99 do begin
		xm := sdl_get_mouse_x;
		ym := sdl_get_mouse_y;
		if ((xm > plato[i].x) and (xm < plato[i].x +60)) and ((ym > plato[i].y) and (ym < plato[i].y +60)) then begin
			if sdl_mouse_left_down then begin
				if ((not caseVide(plato,i)) and (selectione = false) and bon_pion(plato,i,j1,j2,j3,j4)) then begin
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
					deplacement(plato,selectione,j1,j2,j3,j4,i_d,i_a,nb_joueurs);
				end
				else begin
					gDrawRect(plato[i].x+2,plato[i].y+2,57,57,BLUE);
					gDrawRect(plato[i].x+3,plato[i].y+3,55,55,BLUE);
				end;
			end;
		end;
	end;
end;

procedure affiPlateau(VAR plato : plateauDyn;VAR selectione,j1,j2,j3,j4 : boolean;VAR i_d, i_a : integer;nb_joueurs : integer);
var
	i : integer;
begin

	gclear(WHITE);
	for i := 0 to 99 do gFillRect(plato[i].x,plato[i].y,60,60,plato[i].couleur);
	gDrawRect(200,75,600,600,BLACK);
	affiPions(plato);
	selectionCase(plato,selectione,j1,j2,j3,j4,i_d,i_a,nb_joueurs);
end;

end.
