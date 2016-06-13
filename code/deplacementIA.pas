unit deplacementIA;
interface
uses highlights,changements;

TYPE pnoeud = ^noeud;
pfils = ^fils;
fils=RECORD
		precedent : pnoeud;
    courant:pnoeud;
    suivant:pfils;
    END;
noeud = RECORD
    i_dep,i_arr:INTEGER;
		valeur : real;
		platEval : plateauDyn;
    listefils:pfils;
END;

FUNCTION creerNoeudA(val,id,ia:INTEGER;plat : plateauDyn):pnoeud;
FUNCTION ajoutfils(val,id,ia:INTEGER;plat : plateauDyn;sommet:pnoeud):pnoeud;
PROCEDURE affiche(sommet:pnoeud);
function copiePlat(plato : plateauDyn):plateauDyn;
procedure depICarr(plato : plateauDyn;i : integer;sommet : pnoeud);
procedure depITria1(plato : plateauDyn;i : integer;sommet : pnoeud);
procedure depITria2(plato : plateauDyn;i : integer;sommet : pnoeud);
procedure depILos(plato : plateauDyn;i : integer;sommet : pnoeud);
procedure depICerc(plato : plateauDyn;i : integer;sommet : pnoeud);




Implementation
///////////Copie tableau
function copiePlat(plato : plateauDyn):plateauDyn;
var
	i : integer;
	platS : plateauDyn;
begin
	for i :=0 to 99 do begin
		SetLength(platS,100);
		platS[i].x := plato[i].x;
		platS[i].y := plato[i].y;
		platS[i].couleur := plato[i].couleur;
		platS[i].p.identif := plato[i].p.identif;
		platS[i].p.clr := plato[i].p.clr;
	end;
	copiePlat := platS;
end;
/////////Procedures pour liste
FUNCTION creerNoeudA(val,id,ia:INTEGER;plat : plateauDyn):pnoeud;
VAR
    tmp:pnoeud;
BEGIN
    new(tmp);
    tmp^.valeur:=val;
		tmp^.i_dep := id;
		tmp^.i_arr := ia;
		tmp^.platEval := copiePlat(plat);
    tmp^.listefils:=nil;
    creerNoeudA:=tmp;
END;

FUNCTION ajoutfils(val,id,ia:INTEGER;plat : plateauDyn;sommet:pnoeud):pnoeud;
VAR
    tmp2,tmp3:pfils;
BEGIN
    new(tmp2);
    tmp2^.courant:=creerNoeudA(val,id,ia,plat);
    tmp2^.suivant:=nil;
		tmp2^.precedent := sommet;
    IF (sommet^.listefils = Nil) then
    begin
        sommet^.listefils:=tmp2;
    end
    else
    begin
        tmp3:=sommet^.listefils;
        while (tmp3^.suivant<>nil) do
            tmp3:=tmp3^.suivant;
        tmp3^.suivant:=tmp2;
    end;
    ajoutfils:=sommet;
END;

PROCEDURE affiche(sommet:pnoeud);
VAR
    tmp:pfils;
BEGIN
    WRITELN('Racine : ',sommet^.valeur);
		writeln('i_d : ',sommet^.i_dep,' i_a : ',sommet^.i_arr);
    IF (sommet^.listefils<>nil) THEN
    BEGIN
			writeln('Précédent de liste des fils de : ',sommet^.valeur);
			writeln(sommet^.listefils^.precedent^.valeur);
        WRITELN('liste des fils de : ', sommet^.valeur);
        tmp:=sommet^.listefils;
        WHILE(tmp<>nil) DO
        BEGIN
            affiche(tmp^.courant);
            tmp:=tmp^.suivant;
        END;
    END
    ELSE
        WRITELN('fin liste des fils de ',sommet^.valeur);
END;
////////////Carré
procedure depICarr(plato : plateauDyn;i : integer;sommet : pnoeud);
var
	platoC0 : plateauDyn;
begin
	if ((i <= 89) and (plato[i+10].p.identif = 0)) then begin
		platoC0 := copiePlat(plato);
		changement(platoC0,i,i+10);
		sommet := ajoutfils(0,i,i+10,platoC0,sommet);
	end;
	if ((i >= 10) and (plato[i-10].p.identif = 0)) then begin
		platoC0 := copiePlat(plato);
		changement(platoC0,i,i-10);
		sommet := ajoutfils(0,i,i-10,platoC0,sommet);
	end;
	if ((i <= 98) and (plato[i+1].p.identif = 0)) then begin
		platoC0 := copiePlat(plato);
		changement(platoC0,i,i+1);
		sommet := ajoutfils(0,i,i+1,platoC0,sommet);
	end;
	if ((i >= 1) and (plato[i-1].p.identif = 0)) then begin
		platoC0 := copiePlat(plato);
		changement(platoC0,i,i-1);
		sommet := ajoutfils(0,i,i-1,platoC0,sommet);
	end;
end;
//////////Triangle
procedure depITria1(plato : plateauDyn;i : integer;sommet : pnoeud);
var
	platoT0 : plateauDyn;
begin
	if ((i <= 89) and (plato[i+10].p.identif = 0)) then begin
		platoT0 := copiePlat(plato);
		changement(platoT0,i,i+10);
		sommet := ajoutfils(0,i,i+10,platoT0,sommet);
	end;
	if ((i >= 9) and (plato[i-9].p.identif = 0)) then begin
		platoT0 := copiePlat(plato);
		changement(platoT0,i,i-9);
		sommet := ajoutfils(0,i,i-9,platoT0,sommet);
	end;
	if ((i >= 11) and (plato[i-11].p.identif = 0)) then begin
		platoT0 := copiePlat(plato);
		changement(platoT0,i,i-11);
		sommet := ajoutfils(0,i,i-11,platoT0,sommet);
	end;
end;

procedure depITria2(plato : plateauDyn;i : integer;sommet : pnoeud);
var
	platoT0 : plateauDyn;
begin
	if ((i >= 10) and (plato[i-10].p.identif = 0)) then begin
		platoT0 := copiePlat(plato);
		changement(platoT0,i,i+10);
		sommet := ajoutfils(0,i,i-10,platoT0,sommet);
	end;

	if ((i <= 90) and (plato[i+9].p.identif = 0)) then begin
		platoT0 := copiePlat(plato);
		changement(platoT0,i,i+9);
		sommet := ajoutfils(0,i,i+9,platoT0,sommet);
	end;
	if ((i <= 88) and (plato[i+11].p.identif = 0)) then begin
		platoT0 := copiePlat(plato);
		changement(platoT0,i,i+11);
		sommet := ajoutfils(0,i,i+11,platoT0,sommet);
	end;

end;
////////Losange
procedure depILos(plato : plateauDyn;i : integer;sommet : pnoeud);
var
	platoL0 : plateauDyn;
begin
	if ((i <= 88) and (plato[i+11].p.identif = 0)) then begin
		platoL0 := copiePlat(plato);
		changement(platoL0,i,i+11);
		sommet := ajoutfils(0,i,i+11,platoL0,sommet);
	end;
	if ((i >= 11) and (plato[i-11].p.identif = 0)) then begin
		platoL0 := copiePlat(plato);
		changement(platoL0,i,i-11);
		sommet := ajoutfils(0,i,i-11,platoL0,sommet);
	end;
	if ((i <= 9) and (plato[i+9].p.identif = 0)) then begin
		platoL0 := copiePlat(plato);
		changement(platoL0,i,i+9);
		sommet := ajoutfils(0,i,i+9,platoL0,sommet);
	end;
	if ((i >= 9) and (plato[i-9].p.identif = 0)) then begin
		platoL0 := copiePlat(plato);
		changement(platoL0,i,i-9);
		sommet := ajoutfils(0,i,i-9,platoL0,sommet);
	end;
end;
//////Cercle
procedure depICerc(plato : plateauDyn;i : integer;sommet : pnoeud);
var
	platoCe0 : plateauDyn;
begin
	if ((i <= 98) and (plato[i+1].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i+1);
		sommet := ajoutfils(0,i,i+1,platoCe0,sommet);
	end;
	if ((i >= 1) and (plato[i-1].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i-1);
		sommet := ajoutfils(0,i,i-1,platoCe0,sommet);
	end;
	if ((i <= 90) and (plato[i+9].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i+9);
		sommet := ajoutfils(0,i,i+9,platoCe0,sommet);
	end;
	if ((i >= 9) and (plato[i-9].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i-9);
		sommet := ajoutfils(0,i,i-9,platoCe0,sommet);
	end;
	if ((i <= 89) and (plato[i+10].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i+10);
		sommet := ajoutfils(0,i,i+10,platoCe0,sommet);
	end;
	if ((i >= 10) and (plato[i-10].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i-10);
		sommet := ajoutfils(0,i,i-10,platoCe0,sommet);
	end;
	if ((i <= 88) and (plato[i+11].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i+11);
		sommet := ajoutfils(0,i,i+11,platoCe0,sommet);
	end;
	if ((i >= 11) and (plato[i-11].p.identif = 0)) then begin
		platoCe0 := copiePlat(plato);
		changement(platoCe0,i,i-11);
		sommet := ajoutfils(0,i,i-11,platoCe0,sommet);
	end;
end;

end.
