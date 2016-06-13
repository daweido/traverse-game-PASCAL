unit arbre;

interface
uses highlights,changements,eval,deplacementIA,profondeur1,minimax;
	//Simulation des coups, garder dans le noeud i_d/i_a
	//commencer par simple mouvement puis voir pour les sauts

procedure CreaArbre(plato : plateauDyn;var i_dd,i_aa : integer);

Implementation
procedure parcourArbreEval(sommet : pnoeud;var j : integer);forward;

/////////////Création de sous plateau
procedure sous_plateaux(sommet :pnoeud;plato:plateauDyn);
var
	i : integer;
begin
	for i := 0 to 99 do deplacementIaGene0(plato,i,sommet);
	accesFils1(sommet)
end;
///////////ARBRE////////////
procedure CreaArbre(plato : plateauDyn;var i_dd,i_aa : integer);
VAR
    sommet:pnoeud;
		j : integer;
BEGIN
		j := 0;
    writeln('creation du plateau de base');
    sommet:=creerNoeudA(1,0,0,plato);
    writeln('contenu de l''arbre (1)');
    affiche(sommet);
    writeln('ajout des fils');
		sous_plateaux(sommet,plato);
		parcourArbreEval(sommet,j);
		parcourArbreMM(sommet);
		i_dd := sommet^.i_dep;
		i_aa := sommet^.i_arr;
		writeln('Nombre de tableau : ',j);
end;

procedure accesFilsPro4(tmp2 : pfils;var j : integer);
var
	tmp3 : pfils;
	i : integer;
begin
	writeln('Niveau4');
	i := 0;
	tmp3 := tmp2^.courant^.listefils;
	while (tmp3 <> nil) do begin
		i += 1;
		tmp3^.courant^.valeur := parcourToutTableau(tmp3^.courant^.platEval);
		j += 1;
		tmp3 := tmp3^.suivant;
	end;
end;

procedure accesFilsPro3(tmp1 : pfils;var j : integer);
var
	tmp2 : pfils;
begin
	tmp2 := tmp1^.courant^.listefils;
	while (tmp2 <> nil) do begin
		writeln('Niveau3');
		accesFilsPro4(tmp2,j);
		tmp2 := tmp2^.suivant;
	end;
end;

procedure accesFilsPro2(tmp : pfils;var j : integer);
VAR
	tmp1 : pfils;
begin
	tmp1 := tmp^.courant^.listefils;
	while (tmp1 <> nil) do begin
		writeln('Niveau2');
		accesFilsPro3(tmp1,j);
		tmp1 := tmp1^.suivant;
	end;
end;

procedure parcourArbreEval(sommet : pnoeud;var j : integer);
VAR
	tmp:pfils;
begin
	writeln('ParcourArbreEval ENTER');
	if (sommet^.listefils <> Nil) then begin
		tmp := sommet^.listefils;
		WHILE (tmp <> nil) DO BEGIN
			writeln('Niveau1');
			accesFilsPro2(tmp,j);
			tmp := tmp^.suivant;
		END;
	end;
end;

end.
