unit profondeur0;
interface
uses highlights,changements,deplacementIA;
procedure deplacementIaGene0(plato : plateauDyn;i : integer;sommet : pnoeud);

Implementation
procedure deplacementIaGene0(plato : plateauDyn;i : integer;sommet : pnoeud);
begin
	if plato[i].p.clr = 1 then begin
		if plato[i].p.identif = 1 then depICarr(plato,i,sommet);
		if plato[i].p.identif = 2 then depITria1(plato,i,sommet);
		if plato[i].p.identif = 3 then depILos(plato,i,sommet);
		if plato[i].p.identif = 4 then depICerc(plato,i,sommet);
	end;
end;
end.
