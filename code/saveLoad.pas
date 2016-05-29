unit saveLoad;
{$mode objfpc}
interface


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

procedure load_plateau(Var plato : plateauDyn; i : integer);
var



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
			//Mettre fonction qui lis premier mot puis deuxième et fait un StrToInt
			closeFile(fichier);
		end;
	except
		on E: EInOutError do writeln('Erreur lors du chargement');
	end;
end;

end.
