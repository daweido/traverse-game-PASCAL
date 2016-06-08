unit tours;

interface

procedure changemenTours(VAR j1,j2,j3,j4 : boolean; nb_joueurs : integer;VAR cj : integer);

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

end.
