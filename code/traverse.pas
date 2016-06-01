program traverse;

uses gLib2D,SDL_TTF,sysutils,plateau,widget,menu,deplacements,highlights,fin,gagne;

var
	plato : plateauDyn;
	mens : men;
	i_d, i_a,i_dAncien,nb_joueurs,jGagnant,cj : integer;
	tampo,selectione,j1,j2,j3,j4,saut,victoire : boolean;
	menuJ,menuC,menuR : gImage;
begin
	j1 := true;
	j2 := false;
	j3 := false;
	j4 := false;
	nb_joueurs := 0;
	i_d:= 0;
	i_a := 0;
	i_dAncien := 0;
	jGagnant := 0;
	plato := creaPlateau();
	menuJ := iniMenus(1);
	menuC := iniMenus(2);
	menuR := iniMenus(3);
	tampo := true;
	victoire := false;
	selectione := false;
	saut := false;
	cj := 0;
	while true do begin
		//Pas oublié que si il fait rejoueur réinitialiser touts les paramètres ainsi que le plateau et les Booleans
		//if tampo = true then writeln('TRUE')
		//else writeln('FALSE');
		jGagnant := gagnant(victoire,plato,cj);
		if cj = 30 then effacePerdants(plato);


		//if tampo = true then writeln('TRUE')
		//else writeln('FALSE');

		while (sdl_update = 1) do begin
			if victoire = true then begin
				writeln('VICTOIREEEEE');
				menuFin(victoire,mens,tampo,nb_joueurs,jGagnant);
			end
			else if tampo = true then principalMenu(tampo,mens,plato,menuJ)
			else begin
				//writeln('21');
				if mens.id = 1 then begin
					//writeln('22');
					if nb_joueurs = 0 then def_nb_joueurs(plato,nb_joueurs);
					affiPlateau(plato,selectione,j1,j2,j3,j4,saut,i_d,i_a,i_dAncien,cj,nb_joueurs);
				end;

				if mens.id = 2 then begin
					//writeln('23');
					commentMenu(tampo,mens,menuJ,menuC);
				end;

				if mens.id = 3 then begin
					//writeln('23');
					reglagesMenu(tampo,mens,menuJ,menuR);
				end;

				if mens.id = 4 then exit;
					//if tampo = true then writeln('TRUE')
					//else writeln('FALSE');
			end;
			if (sdl_do_quit) then exit; (* Clic sur la croix pour fermer *)
			gFlip();
		end;
	end;
end.
