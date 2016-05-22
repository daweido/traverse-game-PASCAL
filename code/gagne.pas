unit gagne;

Interface
uses gLib2D,SDL_TTF,sysutils,pions,highlights;

function gagnant(var victoire : boolean;plato : plateauDyn):integer;

Implementation

function joueur1Gagne(plato : plateauDyn):boolean;
begin
	if (plato[1].p.clr = 1) and (plato[2].p.clr = 1) and (plato[3].p.clr = 1) and (plato[4].p.clr = 1) and (plato[5].p.clr = 1) and (plato[6].p.clr = 1) and (plato[7].p.clr = 1) and (plato[8].p.clr = 1) then joueur1Gagne := true
	else joueur1Gagne := false;
end;

function joueur2Gagne(plato : plateauDyn):boolean;
begin
	if (plato[91].p.clr = 1) and (plato[92].p.clr = 2) and (plato[93].p.clr = 2) and (plato[94].p.clr = 2) and (plato[95].p.clr = 2) and (plato[96].p.clr = 2) and (plato[97].p.clr = 2) and (plato[98].p.clr = 2) then joueur2Gagne := true
	else joueur2Gagne := false;
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

function gagnant(var victoire : boolean;plato : plateauDyn):integer;
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
