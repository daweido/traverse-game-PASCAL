program traverse;

uses gLib2D,SDL_TTF,sysutils,plateau,widget,menu,deplacements,highlights,fin,gagne,saveLoad;

var
	plato : plateauDyn;
	mens,mn,mNb,mCmt : men;
	i_d, i_a,i_dAncien,nb_joueurs,jGagnant,cj : integer;
	tampo,selectione,j1,j2,j3,j4,saut,victoire,pause,menJou,choixNbJ,retCmt,loaded : boolean;
	menuJ,menuC,menuR : gImage;
begin
	j1 := true;
	j2 := false;
	pause := false;
	j3 := false;
	j4 := false;
	i_d:= 0;
	i_a := 0;
	i_dAncien := 0;
	jGagnant := 0;
	plato := creaPlateau();
	loaded := false;
	menuJ := iniMenus(1);
	menuC := iniMenus(2);
	menuR := iniMenus(3);
	////////Menus
	tampo := true;
	menJou := true;
	choixNbJ := true;
	retCmt := true;
	victoire := false;
///////////////////
	selectione := false;
	saut := false;
	cj := 0;
	while true do begin
		//Pas oublié que si il fait rejoueur réinitialiser touts les paramètres ainsi que le plateau et les Booleans
		jGagnant := gagnant(victoire,plato,cj);
		if cj = 30 then effacePerdants(plato);

		while (sdl_update = 1) do begin
			if (sdl_do_quit) then exit; (* Clic sur la croix pour fermer *)
			if victoire = true then begin
				writeln('VICTOIREEEEE');
				menuFin(victoire,mens,tampo,nb_joueurs,jGagnant);
			end
			else if tampo = true then principalMenu(tampo,mens,menuJ)
			else begin
				if mens.id = 1 then begin
					if menJou = true then menuJouer(mn,menJou)
					else begin
						if mn.id = 1 then begin
							if choixNbJ = true then menuNvPartie(mNb,choixNbJ)
							else begin
								if mNb.id = 0 then affiPlateau(plato,tampo,selectione,j1,j2,j3,j4,saut,pause,menJou,choixNbJ,i_d,i_a,i_dAncien,cj,nb_joueurs);
								if mNb.id = 1 then begin
									def_nb_joueurs(plato,1);
									nb_joueurs := 1;
									mNb.id := 0;
								end;
								if mNb.id = 2 then begin
									def_nb_joueurs(plato,2);
									nb_joueurs := 2;
									mNb.id := 0;
								end;
								if mNb.id = 3 then begin
									def_nb_joueurs(plato,3);
									nb_joueurs := 3;
									mNb.id := 0;
								end;
								if mNb.id = 4 then begin
									def_nb_joueurs(plato,4);
									nb_joueurs := 4;
									mNb.id := 0;
								end;
								if mNb.id = 5 then begin
									mNb.menus := true;
									choixNbJ := true;
									menJou := true;
								end;
							end;
						end;
						if mn.id = 2 then begin
							if loaded = false then load(plato,nb_joueurs,cj,j1,j2,j3,j4,loaded)
							else affiPlateau(plato,tampo,selectione,j1,j2,j3,j4,saut,pause,menJou,choixNbJ,i_d,i_a,i_dAncien,cj,nb_joueurs);
						end;
						if mn.id = 3 then begin
							mn.menus := true;
							tampo := true;
							menJou := true;
						end;
					end;
				end;

				if mens.id = 2 then begin
					if retCmt = true then commentMenu(retCmt,mCmt,menuC)
					else begin
						if mCmt.id = 1 then begin
							tampo := true;
							retCmt := true;
						end;
					end;
				end;

				if mens.id = 3 then begin
					reglagesMenu(tampo,mens,menuJ,menuR);
				end;

				if mens.id = 4 then exit;
			end;
			gFlip();
		end;
	end;
end.
