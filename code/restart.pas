unit restart;

interface
uses highlights;


procedure rein(var plato : plateauDyn;VAR j1,j2,j3,j4 : boolean;VAR cj : integer);

Implementation

procedure reinitialiser_tours(VAR j1,j2,j3,j4 : boolean;VAR cj : integer);
begin
if j1 = false then begin
	j1 := true;
	j2 := false;
	j3 := false;
	j4 := false;
end;
cj := 0;
end;

procedure rein(var plato : plateauDyn;VAR j1,j2,j3,j4 : boolean;VAR cj : integer);
var
	i : integer;
begin
	for i := 0 to 99 do begin
	plato[i].p.identif := 0;
	plato[i].p.clr := 0;
	end;
//////Partie Inaccessible/////
	plato[0].p.identif := 5;
	plato[9].p.identif := 5;
	plato[90].p.identif := 5;
	plato[99].p.identif := 5;
/////////Tours////
	reinitialiser_tours(j1,j2,j3,j4,cj);
end;

end.
