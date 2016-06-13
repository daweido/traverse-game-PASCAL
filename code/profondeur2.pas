unit profondeur2;

interface

uses highlights,changements,deplacementIA;

Implementation

procedure deplacementIaGene2(plato : plateauDyn;i : integer;sommet : pnoeud);
var
	i : integer;
begin
	for i := 0 to 99 do begin
		if plato[i].p.clr = 1 then begin
			if plato[i].p.identif = 1 then depICarr(plato,i,sommet);
			if plato[i].p.identif = 2 then depITria1(plato,i,sommet);
			if plato[i].p.identif = 3 then depILos(plato,i,sommet);
			if plato[i].p.identif = 4 then depICerc(plato,i,sommet);
		end;
	end;
end;


procedure accesFils2(sommet : pnoeud);
VAR
	tmp,tmp1 : pfils;
	fils1 : plateauDyn;
begin
	if (sommet^.listefils <> Nil) then begin
		tmp := sommet^.listefils;
		WHILE (tmp <> nil) DO BEGIN
			if tmp^.courant.listefils <> nil then begin
				tmp1 := tmp^.courant.listefils;
				while (tmp1 <> nil) then begin
					fils1 := copiePlat(tmp1^.courant^.platEval);
					deplacementIaGene1(fils1,tmp1^.courant);
					tmp1 := tmp1^.suivant;
				end;
			end;
			tmp := tmp^.suivant;
		END;
	end;
end;
