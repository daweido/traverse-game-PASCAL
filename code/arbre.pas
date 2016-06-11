unit arbre;

interface
uses highlights,changements,deplacementIA,profondeur0,profondeur1;
	//Simulation des coups, garder dans le noeud i_d/i_a
	//commencer par simple mouvement puis voir pour les sauts

procedure CreaArbre(plato : plateauDyn);

Implementation
/////////////Création de sous plateau
procedure sous_plateaux(sommet :pnoeud;plato:plateauDyn);
var
	profondeur,i : integer;
begin
	for profondeur := 0 to 3 do begin
		if profondeur = 0 then begin
			for i := 0 to 99 do deplacementIaGene0(plato,i,sommet);
		end
		else if profondeur = 1 then accesFils1(sommet)
		else if profondeur = 2 then writeln('profondeur2')
		else writeln('profondeur3');
	end;
end;
///////////ARBRE////////////

procedure CreaArbre(plato : plateauDyn);
VAR
    sommet:pnoeud;
BEGIN
    writeln('creation du plateau de base');
    sommet:=creerNoeudA(1,0,0,plato);
    writeln('contenu de l''arbre (1)');
    affiche(sommet);
    writeln('ajout des fils');
		sous_plateaux(sommet,plato);
    {sommet^.listefils^.courant:=ajoutfils(5,4,4,plato,sommet^.listefils^.courant);
    sommet^.listefils^.courant:=ajoutfils(6,5,5,plato,sommet^.listefils^.courant);
    writeln('contenu de l''arbre (3)');
    affiche(sommet);
    writeln('ajout de 7 et 8 au fils 2');
    sommet^.listefils^.suivant^.courant:=ajoutfils(7,6,6,plato,sommet^.listefils^.suivant^.courant);
    sommet^.listefils^.suivant^.courant:=ajoutfils(8,7,7,plato,sommet^.listefils^.suivant^.courant);
    writeln('contenu de l''arbre (4)');
    affiche(sommet);}
end;

end.
