unit profondeur1;

interface

uses highlights,changements,deplacementIA;

procedure accesFils1(sommet : pnoeud);
procedure deplacementIaGene0(plato : plateauDyn;i : integer;sommet : pnoeud);

Implementation

procedure deplacementIaGene0(plato : plateauDyn;i : integer;sommet : pnoeud);
begin
	if plato[i].p.clr = 2 then begin
		if plato[i].p.identif = 1 then depICarr(plato,i,sommet);
		if plato[i].p.identif = 2 then depITria2(plato,i,sommet);
		if plato[i].p.identif = 3 then depILos(plato,i,sommet);
		if plato[i].p.identif = 4 then depICerc(plato,i,sommet);
	end;
end;

procedure deplacementIaGeneJ2(plato : plateauDyn;sommet : pnoeud);
var
	i : integer;
begin
	for i := 0 to 99 do begin
		if plato[i].p.clr = 2 then begin
			if plato[i].p.identif = 1 then depICarr(plato,i,sommet);
			if plato[i].p.identif = 2 then depITria2(plato,i,sommet);
			if plato[i].p.identif = 3 then depILos(plato,i,sommet);
			if plato[i].p.identif = 4 then depICerc(plato,i,sommet);
		end;
	end;
end;

procedure deplacementIaGeneJ1(plato : plateauDyn;sommet : pnoeud);
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

procedure accesFils3(tmp1 : pfils);
var
	tmp2 : pfils;
	fils3 : plateauDyn;
begin
	tmp2 := tmp1^.courant^.listefils;
	while (tmp2 <> nil) do begin
		fils3 := copiePlat(tmp2^.courant^.platEval);
		deplacementIaGeneJ1(fils3,tmp2^.courant);
		tmp2 := tmp2^.suivant;
	end;
end;


procedure accesFils2(tmp : pfils);
VAR
	tmp1 : pfils;
	fils2 : plateauDyn;
begin
	tmp1 := tmp^.courant^.listefils;
	while (tmp1 <> nil) do begin
		fils2 := copiePlat(tmp1^.courant^.platEval);
		deplacementIaGeneJ2(fils2,tmp1^.courant);
		accesFils3(tmp1);
		tmp1 := tmp1^.suivant;
	end;
end;

procedure accesFils1(sommet : pnoeud);
VAR
	tmp:pfils;
	fils1 : plateauDyn;
begin
	if (sommet^.listefils <> Nil) then begin
		tmp := sommet^.listefils;
		WHILE (tmp <> nil) DO BEGIN
			fils1 := copiePlat(tmp^.courant^.platEval);
			deplacementIaGeneJ1(fils1,tmp^.courant);
			accesFils2(tmp);
			tmp := tmp^.suivant;
		END;
	end;
end;

end.
