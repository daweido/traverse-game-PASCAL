unit sauts;

interface
uses gLib2D,SDL_TTF,sysutils,pions,highlights;

function saut_possible(i_d : integer;plato : plateauDyn):boolean;
function saut_pion(plato : plateauDyn; i_d,i_a : integer):boolean;

Implementation

function saut_pion_Carre(plato : plateauDyn; i_d,i_a : integer):boolean;
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((i_a = i_d+2) and (plato[i_d+1].p.identif <> 0)) or ((i_a = i_d-2) and (plato[i_d-1].p.identif <> 0)) or ((i_a = i_d+20) and (plato[i_d+10].p.identif <> 0)) or ((i_a = i_d-20) and (plato[i_d-10].p.identif <> 0)) then saut_pion_Carre := true
		else saut_pion_Carre := false;
	end;
end;

function saut_pion_Triangle(plato : plateauDyn; i_d,i_a : integer):boolean;
begin
	if (plato[i_d].p.clr = 1) then begin
		if ((i_a = i_d+20) and (plato[i_d+10].p.identif <> 0)) or
		((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) or
		((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) then saut_pion_Triangle := true
		else saut_pion_Triangle := false;
	end
	else if (plato[i_d].p.clr = 2) then begin
		if ((i_a = i_d-20) and (plato[i_d-10].p.identif <> 0)) or
		((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
		((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) then saut_pion_Triangle := true
		else saut_pion_Triangle := false;
	end
	else if (plato[i_d].p.clr = 3) then begin
		if ((i_a = i_d+2) and (plato[i_d+1].p.identif <> 0)) or
		((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
		((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) then saut_pion_Triangle := true
		else saut_pion_Triangle := false;
	end
	else begin
		if ((i_a = i_d-2) and (plato[i_d-1].p.identif <> 0)) or
		((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) or
		((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) then saut_pion_Triangle := true
		else saut_pion_Triangle := false;
	end;
end;

function saut_pion_Losange(plato : plateauDyn; i_d,i_a : integer):boolean;
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) or
		((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) or
		((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
		((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) then saut_pion_Losange := true
		else saut_pion_Losange := false;
	end;
end;

function saut_pion_Cercle(plato : plateauDyn; i_d,i_a : integer):boolean;
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((i_a = i_d+2) and (plato[i_d+1].p.identif <> 0))  or
		((i_a = i_d-2) and (plato[i_d-1].p.identif <> 0)) or
		((i_a = i_d+18) and (plato[i_d+9].p.identif <> 0)) or
		((i_a = i_d-18) and (plato[i_d-9].p.identif <> 0)) or
		((i_a = i_d+20) and (plato[i_d+10].p.identif <> 0)) or
		((i_a = i_d-20) and (plato[i_d-10].p.identif <> 0)) or
		((i_a = i_d+22) and (plato[i_d+11].p.identif <> 0)) or
		((i_a = i_d-22) and (plato[i_d-11].p.identif <> 0)) then saut_pion_Cercle := true
		else saut_pion_Cercle := false;
	end;
end;

function saut_pion(plato : plateauDyn; i_d,i_a : integer):boolean;
begin
///Carré
	if plato[i_d].p.identif = 1 then saut_pion := saut_pion_Carre(plato,i_d,i_a)
////Triangle
	else if plato[i_d].p.identif = 2 then saut_pion := saut_pion_Triangle(plato,i_d,i_a)
/////Losange
	else if plato[i_d].p.identif = 3 then saut_pion := saut_pion_Losange(plato,i_d,i_a)
//////Cercle
	else if plato[i_d].p.identif = 4 then saut_pion := saut_pion_Cercle(plato,i_d,i_a)
	else saut_pion := false;
end;

//Faire fonction qui vérifie si un saut de pion est possible et afficher les cases en verte léger les mouvements possibles
function saut_possible_Carre(i_d : integer;plato : plateauDyn):boolean;
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((plato[i_d+2].p.identif = 0) and (plato[i_d+1].p.identif <> 0)) or ((plato[i_d-2].p.identif = 0) and (plato[i_d-1].p.identif <> 0)) or ((plato[i_d+20].p.identif = 0) and (plato[i_d+10].p.identif <> 0)) or ((plato[i_d-20].p.identif = 0) and (plato[i_d-10].p.identif <> 0)) then saut_possible_Carre := true
		else saut_possible_Carre := false;
	end;
end;

function saut_possible_Triangle(i_d : integer;plato : plateauDyn):boolean;
begin
	if (plato[i_d].p.clr = 1) then begin
		if ((plato[i_d+20].p.identif = 0) and (plato[i_d+10].p.identif <> 0)) or
		((plato[i_d-18].p.identif = 0) and (plato[i_d-9].p.identif <> 0)) or
		((plato[i_d-22].p.identif = 0) and (plato[i_d-11].p.identif <> 0)) then saut_possible_Triangle := true
		else saut_possible_Triangle := false;
	end
	else if (plato[i_d].p.clr = 2) then begin
		if ((plato[i_d-20].p.identif = 0) and (plato[i_d-10].p.identif <> 0)) or
		((plato[i_d+18].p.identif = 0) and (plato[i_d+9].p.identif <> 0)) or
		((plato[i_d+22].p.identif = 0) and (plato[i_d+11].p.identif <> 0)) then saut_possible_Triangle := true
		else saut_possible_Triangle := false;
	end
	else if (plato[i_d].p.clr = 3) then begin
		if ((plato[i_d+2].p.identif = 0) and (plato[i_d+1].p.identif <> 0)) or
		((plato[i_d+18].p.identif = 0) and (plato[i_d+9].p.identif <> 0)) or
		((plato[i_d-22].p.identif = 0) and (plato[i_d-11].p.identif <> 0)) then saut_possible_Triangle := true
		else saut_possible_Triangle := false;
	end
	else begin
		if ((plato[i_d-2].p.identif = 0) and (plato[i_d-1].p.identif <> 0)) or
		((plato[i_d-18].p.identif = 0) and (plato[i_d-9].p.identif <> 0)) or
		((plato[i_d+22].p.identif = 0) and (plato[i_d+11].p.identif <> 0)) then saut_possible_Triangle := true
		else saut_possible_Triangle := false;
	end;
end;

function saut_possible_Losange(i_d : integer;plato : plateauDyn):boolean;
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((plato[i_d+22].p.identif = 0) and (plato[i_d+11].p.identif <> 0)) or
		((plato[i_d-22].p.identif = 0) and (plato[i_d-11].p.identif <> 0)) or
		((plato[i_d+18].p.identif = 0) and (plato[i_d+9].p.identif <> 0)) or
		((plato[i_d-18].p.identif = 0) and (plato[i_d-9].p.identif <> 0)) then saut_possible_Losange := true
		else saut_possible_Losange := false
	end;
end;

function saut_possible_Cercle(i_d : integer;plato : plateauDyn):boolean;
begin
	if (plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4) then begin
		if ((plato[i_d+2].p.identif = 0) and (plato[i_d+1].p.identif <> 0))  or
		((plato[i_d-2].p.identif = 0) and (plato[i_d-1].p.identif <> 0)) or
		((plato[i_d+18].p.identif = 0) and (plato[i_d+9].p.identif <> 0)) or
		((plato[i_d-18].p.identif = 0) and (plato[i_d-9].p.identif <> 0)) or
		((plato[i_d+20].p.identif = 0) and (plato[i_d+10].p.identif <> 0)) or
		((plato[i_d-20].p.identif = 0) and (plato[i_d-10].p.identif <> 0)) or
		((plato[i_d+22].p.identif = 0) and (plato[i_d+11].p.identif <> 0)) or
		((plato[i_d-22].p.identif = 0) and (plato[i_d-11].p.identif <> 0)) then saut_possible_Cercle := true
		else saut_possible_Cercle := false
	end;
end;

function saut_possible(i_d : integer;plato : plateauDyn):boolean;
begin
////Carré
	if plato[i_d].p.identif = 1 then  saut_possible := saut_possible_Carre(i_d,plato)
////Triangle
	else if plato[i_d].p.identif = 2 then saut_possible := saut_possible_Triangle(i_d,plato)
////Losange
	else if plato[i_d].p.identif = 3 then saut_possible := saut_possible_Losange(i_d,plato)
//////Cercle
	else if plato[i_d].p.identif = 4 then saut_possible := saut_possible_Cercle(i_d,plato)
/////Else
	else saut_possible := false;
end;
end.
