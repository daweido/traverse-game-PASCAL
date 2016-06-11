unit tours;

interface
uses highlights;
procedure changemenTours(VAR j1,j2,j3,j4 : boolean; nb_joueurs : integer;VAR cj : integer);
procedure verifTours(plato : plateauDyn;VAR j1,j2,j3,j4 : boolean; nb_joueurs : integer;VAR cj : integer);

Implementation

procedure j_1(VAR j1,j2 : boolean; VAR cj : integer);
begin
	if j1 = true then begin
		cj += 1;
		j2 := true;
		j1 := false;
	end
	else begin
		j1 := true;
		j2 := false;
	end;
end;

procedure j_2(VAR j1,j2 : boolean;VAR cj : integer);
begin
	if j1 = true then begin
		cj +=1;
		j1 := false;
		j2 := true;
	end
	else begin
		j1 := true;
		j2 := false;
	end;
end;

procedure j_3(VAR j1,j2,j3 : boolean;VAR cj : integer);
begin
	if j1 = true then begin
		cj += 1;
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

procedure j_4(VAR j1,j2,j3,j4 : boolean;VAR cj : integer);
begin
	if j1 = true then begin
		cj +=1;
		writeln('cj = ',cj);
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

procedure changemenTours(VAR j1,j2,j3,j4 : boolean; nb_joueurs : integer;VAR cj : integer);
begin
	IF nb_joueurs = 1 then j_1(j1,j2,cj) //Mettre ici intelligence
	else if nb_joueurs = 2 then j_2(j1,j2,cj)
	else if nb_joueurs = 3 then j_3(j1,j2,j3,cj)
	else j_4(j1,j2,j3,j4,cj);
end;

function pasDePions1(plato : plateauDyn):boolean;
var
	tam : boolean;
	i : integer;
begin
	tam := true;
	for i := 0 to 99 do begin
		if plato[i].p.clr = 1 then begin
			tam := false;
			break;
		end;
	end;
	pasDePions1 := tam;
end;

function pasDePions2(plato : plateauDyn):boolean;
var
	tam : boolean;
	i : integer;
begin
	tam := true;
	for i := 0 to 99 do begin
		if plato[i].p.clr = 2 then begin
			tam := false;
			break;
		end;
	end;
	pasDePions2 := tam;
end;

function pasDePions3(plato : plateauDyn):boolean;
var
	tam : boolean;
	i : integer;
begin
	tam := true;
	for i := 0 to 99 do begin
		if plato[i].p.clr = 3 then begin
			tam := false;
			break;
		end;
	end;
	pasDePions3 := tam;
end;
function pasDePions4(plato : plateauDyn):boolean;
var
	tam : boolean;
	i : integer;
begin
	tam := true;
	for i := 0 to 99 do begin
		if plato[i].p.clr = 4 then begin
			tam := false;
			break;
		end;
	end;
	pasDePions4 := tam;
end;


procedure verifTours(plato : plateauDyn;VAR j1,j2,j3,j4 : boolean; nb_joueurs : integer;VAR cj : integer);
var
	oka : boolean;
begin
	oka := false;
	while not oka do begin
		if (j1 = true) and pasDePions1(plato) then changemenTours(j1,j2,j3,j4,nb_joueurs,cj)
		else oka := true;

		if (j2 = true) and pasDePions2(plato) then changemenTours(j1,j2,j3,j4,nb_joueurs,cj)
		else oka := true;

		if (j3 = true) and pasDePions3(plato) then changemenTours(j1,j2,j3,j4,nb_joueurs,cj)
		else oka := true;

		if (j4 = true) and pasDePions4(plato) then changemenTours(j1,j2,j3,j4,nb_joueurs,cj)
		else oka := true;
	end;
end;


end.
