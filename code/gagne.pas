unit gagne;

Interface
uses gLib2D,SDL_TTF,sysutils,pions,highlights;

TYPE
ptr_noeud = ^noeud;
noeud = RECORD
  valeur : INTEGER;
  suivant : ptr_noeud;
END;

function gagnant(var victoire : boolean;plato : plateauDyn;cj : integer):integer;
procedure effacePerdants(VAR plato : plateauDyn);

Implementation

FUNCTION creerNoeudG(elt : INTEGER) : ptr_noeud;
VAR
  nv : ptr_noeud;
BEGIN
  new(nv);
  nv^.valeur := elt;
  nv^.suivant := Nil;
  creerNoeudG := nv;
END;

function joueur1Gagne(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	for j := 1 to 8 do begin
		if (plato[j].p.clr = 1) then valeur := true
		else begin
			valeur := false;
			break;
		end;
	end;

	for j := 0 to 99 do begin
		if ((plato[j].p.clr <> 2) and (plato[j].p.clr <> 3) and (plato[j].p.clr <> 4)) then valeur := true
		else begin
			valeur := false;
			break;
		end;

	end;

	joueur1Gagne := valeur;
end;

function joueur2Gagne(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	for j := 91 to 98 do begin
		if (plato[j].p.clr = 2) then valeur := true
		else begin
			valeur := false;
			break;
		end;
	end;

	for j := 0 to 99 do begin
		if (plato[j].p.clr <> 1) and (plato[j].p.clr <> 3) and (plato[j].p.clr <> 4) then valeur := true
		else begin
			valeur := false;
			break;
		end;

	end;

	joueur2Gagne := valeur;
end;

function joueur3Gagne(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	j := 0;
	repeat
		j += 10;
		if (plato[j].p.clr = 3) then valeur := true
		else begin
			valeur := false;
			break;
		end;
	until (j = 80);

	for j := 0 to 99 do begin
		if (plato[j].p.clr <> 2) and (plato[j].p.clr <> 1) and (plato[j].p.clr <> 4) then valeur := true
		else begin
			valeur := false;
			break;
		end;

	end;

	joueur3Gagne := valeur;
end;

function joueur4Gagne(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	j := 9;
	repeat
		j += 10;
		if (plato[j].p.clr = 4) then valeur := true
		else begin
			valeur := false;
			break;
		end;
	until (j = 89);

	for j := 0 to 99 do begin
		if (plato[j].p.clr <> 2) and (plato[j].p.clr <> 3) and (plato[j].p.clr <> 1) then valeur := true
		else begin
			valeur := false;
			break;
		end;

	end;

	joueur4Gagne := valeur;
end;

function pionRestant1(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	valeur := false;
	for j := 91 to 98 do begin
		if (plato[j].p.identif <> 0) and (plato[j].p.clr = 1) then begin
			valeur := true;
			break;
		end;
	end;
	pionRestant1 := valeur;
end;

function pionRestant2(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	valeur := false;
	for j := 1 to 8 do begin
		if (plato[j].p.identif <> 0) and (plato[j].p.clr = 2) then begin
			valeur := true;
			break;
		end;
	end;
	pionRestant2 := valeur;
end;

function pionRestant3(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	valeur := false;
	j := 9;
	repeat
		j += 10;
		if (plato[j].p.identif <> 0) and (plato[j].p.clr = 3) then begin
			valeur := true;
			break;
		end;
	until (j = 89);
	pionRestant3 := valeur;
end;

function pionRestant4(plato : plateauDyn):boolean;
var
	j : integer;
	valeur : boolean;
begin
	valeur := false;
	j := 0;
	repeat
		j += 10;
		if (plato[j].p.identif <> 0) and (plato[j].p.clr = 4) then begin
			valeur := true;
			break;
		end;
	until (j = 80);
	pionRestant4 := valeur;
end;

function effaceNil(VAR tmp2 : ptr_noeud;VAR nul : boolean;elt : integer): ptr_noeud;
begin
	dispose(tmp2);
	nul := false;
	effaceNil := creerNoeudG(elt);
end;

function perdant(plato : plateauDyn):ptr_noeud;
VAR
	tmp1, tmp2 : ptr_noeud;
	nul : boolean;
begin
	tmp2 := NIL;
	tmp1 := NIL;
	nul := true;
	if pionRestant1(plato) then tmp2 := effaceNil(tmp2,nul,1);
	if pionRestant2(plato) then begin
		if nul = true then tmp2 := effaceNil(tmp2,nul,2)
		else begin
			tmp2 := creerNoeudG(2);
			tmp2^.suivant := tmp1;
			tmp1 := tmp2;
		end;
	end;
	if pionRestant3(plato) then begin
		if nul = true then tmp2 := effaceNil(tmp2,nul,3)
		else begin
			tmp2 := creerNoeudG(3);
			tmp2^.suivant := tmp1;
			tmp1 := tmp2;
		end;
	end;
	if pionRestant4(plato) then begin
		if nul = true then tmp2 := effaceNil(tmp2,nul,4)
		else begin
			tmp2 := creerNoeudG(4);
			tmp2^.suivant := tmp1;
		end;
	end;
	perdant := tmp2;
end;

procedure effacePerdants(VAR plato : plateauDyn);
var
	i,perd : integer;
	liste_perdants : ptr_noeud;
begin
	liste_perdants := perdant(plato);
	while liste_perdants <> nil do begin
		perd := liste_perdants^.valeur;
		for i := 0 to 99 do begin
			if plato[i].p.clr = perd then begin
				plato[i].p.identif := 0;
				plato[i].p.clr := 0;
			end;
		end;
		liste_perdants := liste_perdants^.suivant;
	end;
end;


function gagnant(var victoire : boolean;plato : plateauDyn;cj : integer):integer;
begin
	if joueur1Gagne(plato) then begin
		victoire := true;
		gagnant := 1;
	end
	else if joueur2Gagne(plato) then begin
		victoire := true;
		gagnant := 2;
	end
	else if joueur3Gagne(plato) then begin
		victoire := true;
		gagnant := 3;
	end
	else if joueur4Gagne(plato) then begin
		victoire := true;
		gagnant := 4;
	end
	else begin
		victoire := false;
		gagnant := 0;
	end;
end;
end.
