unit plateau;

interface
uses gLib2D,SDL_TTF,sysutils,pions;

TYPE plat = record
		x,y,pion : integer;
		couleur : gColor;
	end;

type
	plateauDyn = array of plat;


function creaPlateau():plateauDyn;
procedure affiPlateau(plato : plateauDyn);
procedure affiPions(plato : plateauDyn);

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
	plato[98].pion := 1;
	plato[91].pion := 1;
	plato[94].pion := 4;
	plato[95].pion := 4;
	creaPlateau := plato;
end;

procedure affiPions(plato : plateauDyn);
var
	i : integer;
begin
	for i := 0 to 99 do begin
		if plato[i].pion = 1 then carres(plato[i].x,plato[i].y,blue);
		if plato[i].pion = 4 then cercles(plato[i].x,plato[i].y,blue);

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
end;

end.
