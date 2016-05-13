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
procedure affiPlateau(plato : plateauDyn);
procedure verif_cases(var plato : plateauDyn);


Implementation

function creaPlateau():plateauDyn;
var
	i,j,l,x,y : integer;
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

procedure affiPlateau(plato : plateauDyn);
var
	i : integer;
begin

	gclear(WHITE);
	for i := 0 to 99 do gFillRect(plato[i].x,plato[i].y,60,60,plato[i].couleur);
	gDrawRect(200,75,600,600,BLACK);
	affiPions(plato);
	verif_cases(plato);
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