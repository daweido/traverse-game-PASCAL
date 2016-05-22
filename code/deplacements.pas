unit deplacements;

interface
uses gLib2D,SDL_TTF,sysutils,pions,highlights,sauts;

procedure deplacement(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a : integer; nb_joueurs : integer);

Implementation

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

procedure deplacementCarre(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if saut_pion(plato,i_d,i_a) then begin
			plato[i_a].p.identif := 1;
			plato[i_a].p.clr := plato[i_d].p.clr;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			i_d := i_a;
			if saut_possible(i_d,plato) then saut := true
			else begin
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs);
				selectione := false;
			end;
		end
		else if (((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+10) or (i_a = i_d-10)) and (saut = false) ) then begin
			plato[i_a].p.identif := 1;
			plato[i_a].p.clr := plato[i_d].p.clr;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			tours(j1,j2,j3,j4,nb_joueurs);
			selectione := false;
		end
		else begin
			i_d := 0;
			i_a := 0;
			selectione := false;
		end;
	end;
end;

procedure deplacementTriangle(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) then begin
		if saut_pion(plato,i_d,i_a) then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 1;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			i_d := i_a;
			if saut_possible(i_d,plato) then saut := true
			else begin
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs);
				selectione := false;
			end;
		end
		else if (((i_a = i_d+10) or (i_a = i_d-9) or (i_a = i_d-11)) and (saut = false)) then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 1;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			tours(j1,j2,j3,j4,nb_joueurs);
			selectione := false;
		end
		else begin
			i_d := 0;
			i_a := 0;
			selectione := false;
		end;
	end
	else if (plato[i_d].p.clr = 2) then begin
		if saut_pion(plato,i_d,i_a) then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 2;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			i_d := i_a;
			if saut_possible(i_d,plato) then saut := true
			else begin
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs);
				selectione := false;
			end;
		end
		else if (((i_a = i_d-10) or (i_a = i_d+9) or (i_a = i_d+11)) and (saut = false))then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 2;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			tours(j1,j2,j3,j4,nb_joueurs);
			selectione := false;
		end
		else begin
			i_d := 0;
			i_a := 0;
			selectione := false;
		end;
	end
	else if (plato[i_d].p.clr = 3) then begin
		if saut_pion(plato,i_d,i_a) then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 3;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			i_d := i_a;
			if saut_possible(i_d,plato) then saut := true
			else begin
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs);
				selectione := false;
			end;
		end
		else if (((i_a = i_d+1) or (i_a = i_d+9) or (i_a = i_d-11)) and (saut = false))  then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 3;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			tours(j1,j2,j3,j4,nb_joueurs);
			selectione := false;
		end
		else begin
			i_d := 0;
			i_a := 0;
			selectione := false;
		end;
	end
	else begin
		if saut_pion(plato,i_d,i_a) then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 4;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			i_d := i_a;
			if saut_possible(i_d,plato) then saut := true
			else begin
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs);
				selectione := false;
			end;
		end
		else if (((i_a = i_d-1) or (i_a = i_d-9) or (i_a = i_d+11)) and (saut = false)) then begin
			plato[i_a].p.identif := 2;
			plato[i_a].p.clr := 4;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			tours(j1,j2,j3,j4,nb_joueurs);
			selectione := false;
		end
		else begin
			i_d := 0;
			i_a := 0;
			selectione := false;
		end;
	end;
end;

procedure deplacementLosange(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if saut_pion(plato,i_d,i_a) then begin
			plato[i_a].p.identif := 3;
			plato[i_a].p.clr := plato[i_d].p.clr;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			i_d := i_a;
			if saut_possible(i_d,plato) then saut := true
			else begin
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs);
				selectione := false;
			end;
		end
		else if (((i_a = i_d+11) or (i_a = i_d-11) or (i_a = i_d+9) or (i_a = i_d-9)) and (saut = false)) then begin
			plato[i_a].p.identif := 3;
			plato[i_a].p.clr := plato[i_d].p.clr;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			tours(j1,j2,j3,j4,nb_joueurs);
			selectione := false;
		end
		else begin
			i_d := 0;
			i_a := 0;
			selectione := false;
		end;
	end;
end;

procedure deplacementCercle(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if saut_pion(plato,i_d,i_a) then begin
			plato[i_a].p.identif := 4;
			plato[i_a].p.clr := plato[i_d].p.clr;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			i_d := i_a;
			if saut_possible(i_d,plato) then saut := true
			else begin
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs);
				selectione := false;
			end;
		end
		else if (((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+9) or (i_a = i_d-9) or (i_a = i_d+10) or (i_a = i_d-10) or (i_a = i_d+11) or (i_a = i_d-11)) and (saut = false)) then begin
			plato[i_a].p.identif := 4;
			plato[i_a].p.clr := plato[i_d].p.clr;
			plato[i_d].p.identif := 0;
			plato[i_d].p.clr := 0;
			tours(j1,j2,j3,j4,nb_joueurs);
			selectione := false;
		end
		else begin
			i_d := 0;
			i_a := 0;
			selectione := false;
		end;
	end;
end;

procedure deplacement(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a : integer; nb_joueurs : integer);
begin
////Carré
	if plato[i_d].p.identif = 1 then deplacementCarre(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,nb_joueurs)
////Triangle
	else if plato[i_d].p.identif = 2 then deplacementTriangle(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,nb_joueurs)
/////Losange
	else if plato[i_d].p.identif = 3 then deplacementLosange(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,nb_joueurs)
//////Cercle
	else if plato[i_d].p.identif = 4 then deplacementCercle(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,nb_joueurs)
	else begin
		i_d := 0;
		i_a := 0;
		selectione := false;
	end;
end;
end.
