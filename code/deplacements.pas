unit deplacements;

interface
uses gLib2D,SDL_TTF,sysutils,pions,highlights,sauts;

procedure deplacement(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4 : integer; nb_joueurs : integer);

Implementation

procedure j_2(VAR j1,j2 : boolean;VAR cj1,cj2 : integer);
begin
	if j1 = true then begin
		cj1 +=1;
		j1 := false;
		j2 := true;
	end
	else begin
		cj2+=1;
		j1 := true;
		j2 := false;
	end;
end;

procedure j_3(VAR j1,j2,j3 : boolean;VAR cj1,cj2,cj3: integer);
begin
	if j1 = true then begin
		cj1 += 1;
		j1 := false;
		j2 := true;
	end
	else if j2 = true then begin
		cj2+= 1;
		j3 := true;
		j2 := false;
	end
	else begin
		cj3 +=1;
		j3 := false;
		j1 := true;
	end;
end;

procedure j_4(VAR j1,j2,j3,j4 : boolean;VAR cj1,cj2,cj3,cj4: integer);
begin
	if j1 = true then begin
		cj1+=1;
		j1 := false;
		j2 := true;
	end
	else if j2 = true then begin
		cj2+=1;
		j3 := true;
		j2 := false;
	end
	else if j3 = true then begin
		cj3+=1;
		j3 := false;
		j4 := true;
	end
	else begin
		cj4+=1;
		j4 := false;
		j1 := true;
	end;
end;


procedure tours(VAR j1,j2,j3,j4 : boolean; nb_joueurs : integer;VAR cj1,cj2,cj3,cj4: integer);
begin
	IF nb_joueurs = 1 then j1 := j1
	else if nb_joueurs = 2 then j_2(j1,j2,cj1,cj2)
	else if nb_joueurs = 3 then j_3(j1,j2,j3,cj1,cj2,cj3)
	else j_4(j1,j2,j3,j4,cj1,cj2,cj3,cj4);
end;

procedure changement(var plato : plateauDyn;i_d,i_a : integer);
begin
	plato[i_a].p.identif := plato[i_d].p.identif;
	plato[i_a].p.clr := plato[i_d].p.clr;
	plato[i_d].p.identif := 0;
	plato[i_d].p.clr := 0;
end;

procedure deplacementCarre(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4 : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((saut = false) and ((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+10) or (i_a = i_d-10))) then begin
			writeln('déplacement/saut ; saut = false');
			changement(plato,i_d,i_a);
			writeln('i_a = ',i_a);
			writeln('i_d = ',i_d);
			tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
			selectione := false;
		end
		else if( saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			writeln('Saut fait; saut = true');
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			writeln('Saut possible ; saut = true');
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				writeln('Sauts multiples : Saut = true');
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				writeln('Saut effectué mais plus de saut possible ; saut = true');
					saut := false;
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
			end;
		end
		else begin
			i_d := 0;
			i_a := 0;
			i_dAncien := 0;
			saut := false;
			selectione := false;
		end;
	end;
end;

procedure deplacementTriangle(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4 : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) then begin
		if (((i_a = i_d+10) or (i_a = i_d-9) or (i_a = i_d-11)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			writeln('Saut fait; saut = true');
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			writeln('Saut possible ; saut = true');
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				writeln('Sauts multiples : Saut = true');
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				writeln('Saut effectué mais plus de saut possible ; saut = true');
					saut := false;
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
			end;
		end
		else begin
			i_d := 0;
			i_a := 0;
			i_dAncien := 0;
			saut := false;
			selectione := false;
		end;
	end
	else if (plato[i_d].p.clr = 2) then begin
		if (((i_a = i_d-10) or (i_a = i_d+9) or (i_a = i_d+11)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			writeln('Saut fait; saut = true');
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			writeln('Saut possible ; saut = true');
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				writeln('Sauts multiples : Saut = true');
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				writeln('Saut effectué mais plus de saut possible ; saut = true');
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else begin
			i_d := 0;
			i_a := 0;
			i_dAncien := 0;
			saut := false;
			selectione := false;
		end;
	end
	else if (plato[i_d].p.clr = 3) then begin
		if (((i_a = i_d+1) or (i_a = i_d+9) or (i_a = i_d-11)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			writeln('Saut fait; saut = true');
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			writeln('Saut possible ; saut = true');
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				writeln('Sauts multiples : Saut = true');
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				writeln('Saut effectué mais plus de saut possible ; saut = true');
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else begin
			i_d := 0;
			i_a := 0;
			i_dAncien := 0;
			saut := false;
			selectione := false;
		end;
	end
	else begin
		if (((i_a = i_d-1) or (i_a = i_d-9) or (i_a = i_d+11)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			writeln('Saut fait; saut = true');
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			writeln('Saut possible ; saut = true');
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				writeln('Sauts multiples : Saut = true');
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				writeln('Saut effectué mais plus de saut possible ; saut = true');
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else begin
			i_d := 0;
			i_a := 0;
			i_dAncien := 0;
			saut := false;
			selectione := false;
		end;
	end;
end;

procedure deplacementLosange(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4 : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if (((i_a = i_d+11) or (i_a = i_d-11) or (i_a = i_d+9) or (i_a = i_d-9)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			writeln('Saut fait; saut = true');
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			writeln('Saut possible ; saut = true');
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				writeln('Sauts multiples : Saut = true');
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				writeln('Saut effectué mais plus de saut possible ; saut = true');
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else begin
			i_d := 0;
			i_a := 0;
			i_dAncien := 0;
			saut := false;
			selectione := false;
		end;
	end;
end;

procedure deplacementCercle(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4 : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if (((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+9) or (i_a = i_d-9) or (i_a = i_d+10) or (i_a = i_d-10) or (i_a = i_d+11) or (i_a = i_d-11)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			writeln('Saut fait; saut = true');
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			writeln('Saut possible ; saut = true');
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				writeln('Sauts multiples : Saut = true');
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				writeln('Saut effectué mais plus de saut possible ; saut = true');
				saut := false;
				tours(j1,j2,j3,j4,nb_joueurs,cj1,cj2,cj3,cj4);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else begin
			i_d := 0;
			i_a := 0;
			i_dAncien := 0;
			saut := false;
			selectione := false;
		end;
	end;
end;

procedure deplacement(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4 : integer; nb_joueurs : integer);
begin
////Carré
	if plato[i_d].p.identif = 1 then deplacementCarre(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4,nb_joueurs)
////Triangle
	else if plato[i_d].p.identif = 2 then deplacementTriangle(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4,nb_joueurs)
/////Losange
	else if plato[i_d].p.identif = 3 then deplacementLosange(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4,nb_joueurs)
//////Cercle
	else if plato[i_d].p.identif = 4 then deplacementCercle(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj1,cj2,cj3,cj4,nb_joueurs)
	else begin
		i_d := 0;
		i_a := 0;
		i_dAncien := 0;
		selectione := false;
	end;
end;
end.
