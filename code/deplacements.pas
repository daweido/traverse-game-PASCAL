unit deplacements;

interface
uses gLib2D,SDL_TTF,sysutils,pions,highlights,sauts,tours,eval,arbre,changements;

procedure deplacement(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj : integer; nb_joueurs : integer);

Implementation



procedure deplacementCarre(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((saut = false) and ((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+10) or (i_a = i_d-10))) then begin
			changement(plato,i_d,i_a);
			changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
			if not (saut_possible(i_d,i_dAncien,plato)) then begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
					saut := false;
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
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

procedure deplacementTriangle(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) then begin
		if (((i_a = i_d+10) or (i_a = i_d-9) or (i_a = i_d-11)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
			if not (saut_possible(i_d,i_dAncien,plato)) then begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
					saut := false;
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
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
			changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
			if not (saut_possible(i_d,i_dAncien,plato)) then begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
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
			changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
			if not (saut_possible(i_d,i_dAncien,plato)) then begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
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
			changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
			if not (saut_possible(i_d,i_dAncien,plato)) then begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
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

procedure deplacementLosange(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if (((i_a = i_d+11) or (i_a = i_d-11) or (i_a = i_d+9) or (i_a = i_d-9)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
			if not (saut_possible(i_d,i_dAncien,plato)) then begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
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

procedure deplacementCercle(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj : integer; nb_joueurs : integer);
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if (((i_a = i_d+1) or (i_a = i_d-1) or (i_a = i_d+9) or (i_a = i_d-9) or (i_a = i_d+10) or (i_a = i_d-10) or (i_a = i_d+11) or (i_a = i_d-11)) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
			selectione := false;
		end
		else if (saut_pion(plato,i_d,i_a,i_dAncien) and (saut = false)) then begin
			changement(plato,i_d,i_a);
			i_dAncien := i_d;
			i_d := i_a;
			saut := true;
			if not (saut_possible(i_d,i_dAncien,plato)) then begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
				selectione := false;
				i_dAncien := 0;
			end;
		end
		else if (saut_possible(i_d,i_dAncien,plato) and (saut = true)) then begin
			if saut_pion(plato,i_d,i_a,i_dAncien) then begin
				changement(plato,i_d,i_a);
				i_dAncien := i_d;
				i_d := i_a;
				if saut_possible(i_d,i_dAncien,plato) then saut := true
				else begin
					changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
					verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
					selectione := false;
					i_dAncien := 0;
					saut := false;
				end;
			end
			else begin
				saut := false;
				changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
				verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
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

procedure deplacement(var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_d, i_a,i_dAncien,cj : integer; nb_joueurs : integer);
begin
	//CreaArbre(plato);
////Carré
	if plato[i_d].p.identif = 1 then deplacementCarre(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj,nb_joueurs)
////Triangle
	else if plato[i_d].p.identif = 2 then deplacementTriangle(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj,nb_joueurs)
/////Losange
	else if plato[i_d].p.identif = 3 then deplacementLosange(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj,nb_joueurs)
//////Cercle
	else if plato[i_d].p.identif = 4 then deplacementCercle(plato,selectione,j1,j2,j3,j4,saut,i_d, i_a,i_dAncien,cj,nb_joueurs)
	else begin
		i_d := 0;
		i_a := 0;
		i_dAncien := 0;
		selectione := false;
	end;
	parcourToutTableau(plato);
end;
end.
