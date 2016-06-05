unit saveLoad;
{$mode objfpc}
interface

uses highlights,sysutils;

Implementation

procedure sauvegarde(plato:plateauDyn);
var
	Fichier : TextFile;
	i : integer;
begin
	assignFile(fichier,'partie.txt');
	{$I+}
	try
		rewrite(fichier);
		for i := 0 to 99 do begin
			writeln(fichier, plato[i].p.identif,' ',plato[i].p.clr);
		end;
		closeFile(fichier);
	except
		on E: EInOutError do writeln('Erreur lors de la sauvegarde');
	end;
end;

procedure load_plateau(Var plato : plateauDyn; i : integer;str : string);
var
	len,j,l : integer;
	arg : string;
begin
	arg := '';
	j := 1;
	len := length(str);
	repeat
		arg += str[j];
		j += 1;
	until (str[j] = ' ');
	plato[i].p.identif := StrToInt(arg);
	arg := '';
	for l := j to len do begin
		arg += str[j];
	end;
	plato[i].p.clr := StrToInt(arg);
end;

procedure load(Var plato:plateauDyn);
var
	Fichier : TextFile;
	i : integer;
	str : string;
begin
	str := '';
	assignFile(fichier,'partie.txt');
	{$I+}
	try
		for i := 0 to 99 do begin
			reset(fichier);
			readln(fichier,str);
			load_plateau(plato,i,str);
			closeFile(fichier);
		end;
	except
		on E: EInOutError do writeln('Erreur lors du chargement');
	end;
end;

end.
