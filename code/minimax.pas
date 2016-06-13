unit minimax;
interface
uses deplacementIA,highlights;

procedure parcourArbreMM(sommet : pnoeud);

Implementation

function MaxEqual(a,b : real):real;
begin
	if a > b then MaxEqual := a
	else MaxEqual := b;
end;

function MinEqual(a,b : real):real;
begin
	if a < b then MinEqual := a
	else MinEqual := b;
end;

procedure accesFilsPro4(tmp2 : pfils);
var
	tmp3 : pfils;
	b,s : real;
	first : boolean;
begin
	first := true;
	writeln('NiveauE');
	tmp3 := tmp2^.courant^.listefils;
	while (tmp3 <> nil) do begin
		b := tmp2^.courant^.valeur;
		s := tmp3^.courant^.valeur;
		if first then tmp2^.courant^.valeur := s
		else tmp2^.courant^.valeur := MinEqual(b,s);
		first := false;
		tmp3 := tmp3^.suivant;
	end;
end;

procedure accesFilsPro3(tmp1 : pfils);
var
	tmp2 : pfils;
	b,s : real;
	first : boolean;
begin
	first := true;
	tmp2 := tmp1^.courant^.listefils;
	while (tmp2 <> nil) do begin
		writeln('Niveau3M');
		accesFilsPro4(tmp2);
		tmp2 := tmp2^.suivant;
	end;
	tmp2 := tmp1^.courant^.listefils;
	while (tmp2 <> nil) do begin
		b := tmp1^.courant^.valeur;
		s := tmp2^.courant^.valeur;
		writeln('Niveau3E');
		if first then tmp1^.courant^.valeur := s
		else tmp1^.courant^.valeur := MaxEqual(b,s);
		first := false;
		tmp2 := tmp2^.suivant;
	end;
end;

procedure accesFilsPro2(tmp : pfils);
VAR
	tmp1 : pfils;
	b,s : real;
	first : boolean;
begin
	first := true;
	tmp1 := tmp^.courant^.listefils;
	while (tmp1 <> nil) do begin
		writeln('Niveau2M');
		accesFilsPro3(tmp1);
		tmp1 := tmp1^.suivant;
	end;
	tmp1 := tmp^.courant^.listefils;
	while (tmp1 <> nil) do begin
		b := tmp^.courant^.valeur;
		s := tmp1^.courant^.valeur;
		writeln('Niveau2E');
		if first then tmp^.courant^.valeur := s
		else tmp^.courant^.valeur := MinEqual(b,s);
		first := false;
		tmp1 := tmp1^.suivant;
	end;
end;

procedure parcourArbreMM(sommet : pnoeud);
VAR
	tmp:pfils;
	b,s : real;
	i_depart, i_arrive : integer;
	first : boolean;
begin
	first := true;
	writeln('ParcourArbreEval ENTER');
	if (sommet^.listefils <> Nil) then begin
		tmp := sommet^.listefils;
		WHILE (tmp <> nil) DO BEGIN
				writeln('Niveau1');
			accesFilsPro2(tmp);
			tmp := tmp^.suivant;
		END;
		tmp := sommet^.listefils;
		while (tmp <> nil) do begin
			writeln('Niveau1E');
			b := sommet^.valeur;
			s := tmp^.courant^.valeur;
			i_depart := tmp^.courant^.i_dep;
			i_arrive := tmp^.courant^.i_arr;
			if first then begin
				sommet^.valeur := s;
				sommet^.i_dep := i_depart;
				sommet^.i_arr := i_arrive;
			end
			else begin
				if s > b then begin
					sommet^.valeur := s;
					sommet^.i_dep := i_depart;
					sommet^.i_arr := i_arrive;
				end;
			end;
				first := false;
				tmp := tmp^.suivant;
		end;
	end;
	writeln('Déplacement choisis :    i_d : ',sommet^.i_dep,'   i_a : ',sommet^.i_arr);
	writeln('Valeur du plateau choisi : ',sommet^.valeur);
end;

end.
