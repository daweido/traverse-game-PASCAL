program traverse;

uses gLib2D,SDL_TTF,sysutils,plateau,widget,menu;

var
	plato : plateauDyn;
	mens : men;
	i_d, i_a,nb_joueurs : integer;
	tampo,selectione,j1,j2,j3,j4 : boolean;
	menuJ,menuC,menuR : gImage;
begin
	j1 := true;
	j2 := false;
	j3 := false;
	j4 := false;
	nb_joueurs := 0;
	i_d:= 0;
	i_a := 0;
	plato := creaPlateau();
	menuJ := iniMenus(1);
	menuC := iniMenus(2);
	menuR := iniMenus(3);
	tampo := true;
	selectione := false;
	while true do begin
		//if tampo = true then writeln('TRUE')
		//else writeln('FALSE');
		if tampo = true then principalMenu(tampo,mens,plato,menuJ);
		if tampo = false then begin
			//writeln('21');
			if mens.id = 1 then begin
				//writeln('22');
				if nb_joueurs = 0 then def_nb_joueurs(plato,nb_joueurs);
				affiPlateau(plato,selectione,j1,j2,j3,j4,i_d,i_a,nb_joueurs);
			end;

			if mens.id = 2 then begin
				//writeln('23');
				commentMenu(tampo,mens,menuJ,menuC);
			end;

			if mens.id = 3 then begin
				//writeln('23');
				affiMenu(menuR);
			end;
			if mens.id = 4 then exit;
				//if tampo = true then writeln('TRUE')
				//else writeln('FALSE');
		end;

		//if tampo = true then writeln('TRUE')
		//else writeln('FALSE');
		gFlip();

		while (sdl_update = 1) do begin
				if (sdl_do_quit) then exit; (* Clic sur la croix pour fermer *)
		end;
	end;
end.
