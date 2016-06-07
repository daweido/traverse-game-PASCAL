unit saveLoad;
{$mode objfpc}
interface

uses highlights,sysutils;

procedure sauvegarde(plato:plateauDyn;j1,j2,j3,j4 : boolean;nb_joueurs,cj : integer);
procedure load(Var plato : plateauDyn;VAR nb_joueurs,cj : integer; var j1,j2,j3,j4,loaded : boolean);


Implementation

function sortie_tour(j1,j2,j3,j4 : boolean):integer;
begin
	if j1 = true then sortie_tour := 1
	else if j2 = true then sortie_tour := 2
	else if j3 = true then sortie_tour := 3
	else sortie_tour := 4;
end;


procedure sauvegarde(plato:plateauDyn;j1,j2,j3,j4 : boolean;nb_joueurs,cj : integer);
var
	Fichier : TextFile;
	i : integer;
begin
	assignFile(fichier,'./sauvegarde/partie.txt');
	{$I+}
	try
		rewrite(fichier);
		for i := 0 to 99 do begin
			writeln(fichier, plato[i].p.identif,' ',plato[i].p.clr);
		end;
		writeln(fichier,nb_joueurs);
		writeln(fichier,sortie_tour(j1,j2,j3,j4));
		writeln(fichier,cj);
		closeFile(fichier);
		writeln('Sauvegarde terminé !');
	except
		on E: EInOutError do writeln('Erreur lors de la sauvegarde');
	end;
end;

procedure load_plateau(Var plato : plateauDyn; i : integer;str : string);
var
	arg : integer;
begin
	arg := StrToInt(str[1]);
	plato[i].p.identif := arg;
	arg := StrToInt(str[3]);
	plato[i].p.clr := arg;
end;

procedure load_tours(VAR j1,j2,j3,j4 : boolean;strTour : string);
begin
	if strTour = '1' then begin
		j1 := true;
		j2 := false;
		j3 := false;
		j4 := false;
	end
	else if strTour = '2' then begin
		j1 := false;
		j2 := true;
		j3 := false;
		j4 := false;
	end
	else if strTour = '3' then begin
		j1 := false;
		j2 := false;
		j3 := true;
		j4 := false;
	end
	else begin
		j1 := false;
		j2 := false;
		j3 := false;
		j4 := true;
	end;
end;

procedure load_params(VAR nb_joueurs,cj : integer; var j1,j2,j3,j4 : boolean;strnb,strCj,strTour : string);
begin
	nb_joueurs := StrToInt(strnb);
	cj := StrToInt(strCj);
	load_tours(j1,j2,j3,j4,strTour);
end;

procedure load(Var plato : plateauDyn;VAR nb_joueurs,cj : integer; var j1,j2,j3,j4,loaded : boolean);
var
	Fichier : TextFile;
	i : integer;
	str,strnb,strCj,strTour : string;
begin
	str := '';
	assignFile(fichier,'./sauvegarde/partie.txt');
	{$I+}
	try
		reset(fichier);
		for i := 0 to 99 do begin
			readln(fichier,str);
			load_plateau(plato,i,str);
		end;
		readln(fichier,strNb);
		writeln(strNb);
		readln(fichier,strTour);
		writeln(strTour);
		readln(fichier,strCj);
		writeln(strCj);
		load_params(nb_joueurs,cj,j1,j2,j3,j4,strnb,strCj,strTour);
		closeFile(fichier);
		writeln('Chargement finis');
		loaded := true;
	except
		on E: EInOutError do writeln('Erreur lors du chargement');
	end;
end;

end.
