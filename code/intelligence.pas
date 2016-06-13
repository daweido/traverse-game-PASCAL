unit intelligence;

interface
uses highlights,deplacements,tours,eval,arbre;


procedure IA(Var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_dAncien,cj : integer; nb_joueurs : integer);

Implementation

procedure finSautIA(var saut,selectione : boolean;VAR j1,j2,j3,j4 : boolean;nb_joueurs : integer;VAR cj,i_dAncien : integer);
begin
	saut := false;
	changemenTours(j1,j2,j3,j4,nb_joueurs,cj);
	selectione := false;
	i_dAncien := 0;
end;

procedure premier_depl(VAR cj,i_dd,i_aa,i_dAncien : integer;var saut,selectione : boolean;VAR j1,j2,j3,j4 : boolean;nb_joueurs : integer);
begin
	if cj=0 then begin
		i_dd := 2;
		i_aa := 11;
	end
	else if cj=1 then begin
		i_dd := 7;
		i_aa := 18;
	end
	else if cj=2 then begin
		i_dd := 1;
		i_aa := 21;
	end
	else if cj=3 then begin
		i_dd := 8;
		i_aa := 28;
	end
	else if cj=4 then begin
		i_dd := 6;
		i_aa := 15;
	end
	else if cj=5 then begin
		i_dd := 5;
		i_aa := 25;
	end
	else if cj=6 then begin
		i_dd := 3;
		i_aa := 14;
	end
	else if cj=7 then begin
		i_dd := 4;
		i_aa := 24;
		finSautIA(saut,selectione,j1,j2,j3,j4,nb_joueurs,cj,i_dAncien);
	end
	else if cj=8 then begin
		i_dd := 15;
		i_aa := 26;
	end
	else if cj=9 then begin
		i_dd := 18;
		i_aa := 27;
	end
	else if cj=10 then begin
		i_dd := 14;
		i_aa := 23;
	end
	else begin
		i_dd := 11;
		i_aa := 22;
	end;
end;

// Pour savoir quelle pions chercher dans le tableau passer avec un test qui vérifie si j1 = true or false
//Faire jouer l'ordinateur en premier;

procedure IA(Var plato : plateauDyn;var selectione,j1,j2,j3,j4,saut : boolean; VAR i_dAncien,cj : integer; nb_joueurs : integer);
var
	i_dd,i_aa : integer;
begin
	writeln('cj =',cj);
	if cj < 12 then premier_depl(cj,i_dd,i_aa,i_dAncien,saut,selectione,j1,j2,j3,j4,nb_joueurs)
	else CreaArbre(plato,i_dd,i_aa);
	deplacement(plato,selectione,j1,j2,j3,j4,saut,i_dd,i_aa,i_dAncien,cj,nb_joueurs);
	if j1 = true then writeln('J1 TRUE')
	else writeln('J2 TRUE');
end;
end.
