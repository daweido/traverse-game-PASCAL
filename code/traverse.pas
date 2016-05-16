program traverse;

uses gLib2D,SDL_TTF,sysutils,plateau,widget,menu;

var
	plato : plateauDyn;
	mens : men;
	tampo,selectione : boolean;
	menuJ,menuC,menuR : gImage;
begin
	plato := creaPlateau();
	menuJ := iniMenus(1);
	menuC := iniMenus(2);
	menuR := iniMenus(3);
	tampo := true;
	selectione := false;
	//joueur12;
	while true do begin
		if tampo = true then writeln('TRUE')
		else writeln('FALSE');

		if tampo = true then principalMenu(tampo,mens,plato,menuJ);
		if tampo = false then begin
			writeln('21');
			if mens.id = 1 then begin
				writeln('22');
				affiPlateau(plato,selectione);
			end;

			if mens.id = 2 then begin
				writeln('23');
				commentMenu(tampo,mens,menuJ,menuC);
			end;

			if mens.id = 3 then begin
				writeln('23');
				affiMenu(menuR);
			end;
			if mens.id = 4 then exit;
				if tampo = true then writeln('TRUE')
				else writeln('FALSE');
		end;

		if tampo = true then writeln('TRUE')
		else writeln('FALSE');
		gFlip();

		while (sdl_update = 1) do begin
				if (sdl_do_quit) then exit; (* Clic sur la croix pour fermer *)
		end;
	end;
end.
