unit profondeur1;

interface

uses highlights,changements,deplacementIA;

procedure accesFils1(sommet : pnoeud);

Implementation

procedure deplacementIaGene1(plato : plateauDyn;sommet : pnoeud);
var
	i : integer;
begin
	for i := 0 to 99 do begin
		writeln('deplacement i : ',i);
		if plato[i].p.clr = 2 then begin
			writeln('clr :2');
			if plato[i].p.identif = 1 then depICarr(plato,i,sommet);
			if plato[i].p.identif = 2 then depITria2(plato,i,sommet);
			if plato[i].p.identif = 3 then depILos(plato,i,sommet);
			if plato[i].p.identif = 4 then depICerc(plato,i,sommet);
		end;
	end;
end;

procedure accesFils1(sommet : pnoeud);
VAR
	tmp : pfils;
	fils1 : plateauDyn;
begin
	writeln('Acces fils 1');
	IF (sommet^.listefils<>nil) THEN
	BEGIN
			WRITELN('Début du PWNAGE : ', sommet^.valeur);
			tmp:=sommet^.listefils;
			WHILE (tmp<>nil) DO
			BEGIN
				writeln('While fils1');
				fils1 := copiePlat(tmp^.courant^.platEval);
				deplacementIaGene1(fils1,tmp^.courant);
				writeln('deplacement');
				tmp:=tmp^.suivant;
				writeln('TMPSUIVANT');
			END;
	END;
end;

end.
