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

FUNCTION creerNoeud (elt : INTEGER) : ptr_noeud;
VAR
  nv : ptr_noeud;
BEGIN
  new(nv);
  nv^.valeur := elt;
  nv^.suivant := Nil;
  creerNoeud := nv;
END;

function joueur2Gagne(plato : plateauDyn):boolean;
begin
	if (plato[1].p.clr = 1) and (plato[2].p.clr = 1) and (plato[3].p.clr = 1) and (plato[4].p.clr = 1) and (plato[5].p.clr = 1) and (plato[6].p.clr = 1) and (plato[7].p.clr = 1) and (plato[8].p.clr = 1) then joueur2Gagne := true
	else joueur2Gagne := false;
end;

function joueur1Gagne(plato : plateauDyn):boolean;
begin
	if (plato[91].p.clr = 2) and (plato[92].p.clr = 2) and (plato[93].p.clr = 2) and (plato[94].p.clr = 2) and (plato[95].p.clr = 2) and (plato[96].p.clr = 2) and (plato[97].p.clr = 2) and (plato[98].p.clr = 2) then joueur1Gagne := true
	else joueur1Gagne := false;
end;

function joueur4Gagne(plato : plateauDyn):boolean;
begin
	if (plato[19].p.clr = 4) and (plato[29].p.clr = 4) and (plato[39].p.clr = 4) and (plato[49].p.clr = 4) and (plato[59].p.clr = 4) and (plato[69].p.clr = 4) and (plato[79].p.clr = 4) and (plato[89].p.clr = 4) then joueur4Gagne := true
	else joueur4Gagne := false;
end;

function joueur3Gagne(plato : plateauDyn):boolean;
begin
	if (plato[10].p.clr = 3) and (plato[20].p.clr = 3) and (plato[30].p.clr = 3) and (plato[40].p.clr = 3) and (plato[50].p.clr = 3) and (plato[60].p.clr = 3) and (plato[70].p.clr = 3) and (plato[80].p.clr = 3) then joueur3Gagne := true
	else joueur3Gagne := false;
end;

function pionRestant1(plato : plateauDyn):boolean;
begin
	if ((plato[91].p.identif <> 0) or (plato[92].p.identif <> 0) or (plato[93].p.identif <> 0) or (plato[94].p.identif <> 0) or (plato[95].p.identif <> 0) or (plato[96].p.identif <> 0) or (plato[97].p.identif <> 0) or (plato[98].p.identif <> 0)) then pionRestant1 := true
	else pionRestant1 := false;
end;

function pionRestant2(plato : plateauDyn):boolean;
begin
	if ((plato[1].p.identif <> 0) or (plato[2].p.identif <> 0) or (plato[3].p.identif <> 0) or (plato[4].p.identif <> 0) or (plato[5].p.identif <> 0) or (plato[6].p.identif <> 0) or (plato[7].p.identif <> 0) or (plato[8].p.identif <> 0)) then pionRestant2 := true
	else pionRestant2 := false;
end;

function pionRestant4(plato : plateauDyn):boolean;
begin
	if ((plato[10].p.identif <> 0) or (plato[20].p.identif <> 0) or (plato[30].p.identif <> 0) or (plato[40].p.identif <> 0) or (plato[50].p.identif <> 0) or (plato[60].p.identif <> 0) or (plato[70].p.identif <> 0) or (plato[80].p.identif <> 0)) then pionRestant4 := true
	else pionRestant4 := false;
end;

function pionRestant3(plato : plateauDyn):boolean;
begin
	if ((plato[19].p.identif <> 0) or (plato[29].p.identif <> 0) or (plato[39].p.identif <> 0) or (plato[49].p.identif <> 0) or (plato[59].p.identif <> 0) or (plato[69].p.identif <> 0) or (plato[79].p.identif <> 0) or (plato[89].p.identif <> 0)) then pionRestant3 := true
	else pionRestant3 := false;
end;

function effaceNil(VAR tmp2 : ptr_noeud;VAR nul : boolean;elt : integer): ptr_noeud;
begin
	dispose(tmp2);
	nul := false;
	effaceNil := creerNoeud(elt);
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
			tmp2 := creerNoeud(2);
			tmp2^.suivant := tmp1;
			tmp1 := tmp2;
		end;
	end;
	if pionRestant3(plato) then begin
		if nul = true then tmp2 := effaceNil(tmp2,nul,3)
		else begin
			tmp2 := creerNoeud(3);
			tmp2^.suivant := tmp1;
			tmp1 := tmp2;
		end;
	end;
	if pionRestant4(plato) then begin
		if nul = true then tmp2 := effaceNil(tmp2,nul,4)
		else begin
			tmp2 := creerNoeud(4);
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
