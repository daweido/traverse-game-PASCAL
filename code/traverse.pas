program traverse;

uses gLib2D,SDL_TTF,sysutils,plateau,menu,deplacements,highlights,fin,gagne,saveLoad,tours;

var
	plato : plateauDyn;
	mens,mn,mNb,mCmt,mnR : men;
	i_d, i_a,i_dAncien,nb_joueurs,jGagnant,cj : integer;
	cjb,nbb : longint;
	tampo,selectione,j1,j2,j3,j4,saut,victoire,pause,menJou,choixNbJ,retCmt,loaded,
	retReg : boolean;
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
	retReg := true;
	victoire := false;
///////////////////
	selectione := false;
	saut := false;
	cj := 0;
	nb_joueurs := 0;
	while true do begin
		if cj = 30 then begin
			effacePerdants(plato);
			verifTours(plato,j1,j2,j3,j4,nb_joueurs,cj);
		end;
		while (sdl_update = 1) do begin
			if (sdl_do_quit) then exit; (* Clic sur la croix pour fermer *)
			if victoire = true then begin
				writeln('VICTOIRE');
				menuFin(mens,victoire,tampo,menJou,choixNbJ,j1,j2,j3,j4,nb_joueurs,cj,jGagnant,plato);
			end
			else if tampo = true then principalMenu(tampo,mens,menuJ)
			else begin
				if mens.id = 1 then begin
					if menJou = true then menuJouer(mn,menJou)
					else begin
						if mn.id = 1 then begin
							if choixNbJ = true then menuNvPartie(mNb,choixNbJ)
							else begin
								if mNb.id = 0 then begin
									jGagnant := gagnant(victoire,plato,cj);
									affiPlateau(plato,tampo,selectione,j1,j2,j3,j4,saut,pause,menJou,choixNbJ,loaded,i_d,i_a,i_dAncien,cj,nb_joueurs);
								end;
								if mNb.id = 1 then begin
									j1 :=false;
									j2 := true;
									writeln('Début du jeu à 1 joueur');
									def_nb_joueurs(plato,2);
									nb_joueurs := 1;
									mNb.id := 0;
								end;
								if mNb.id = 2 then begin
									writeln('Début du jeu à 2 joueur');
									def_nb_joueurs(plato,2);
									nb_joueurs := 2;
									mNb.id := 0;
								end;
								if mNb.id = 3 then begin
									writeln('Début du jeu à 3 joueur');
									def_nb_joueurs(plato,3);
									nb_joueurs := 3;
									mNb.id := 0;
								end;
								if mNb.id = 4 then begin
									writeln('Début du jeu à 4 joueur');
									def_nb_joueurs(plato,4);
									nb_joueurs := 4;
									mNb.id := 0;
								end;
								if mNb.id = 5 then begin
									writeln('Retour Menu Jouer');
									mNb.menus := true;
									choixNbJ := true;
									menJou := true;
								end;
							end;
						end;
						if mn.id = 2 then begin
							if loaded = false then begin
								cjb := cj;
								nbb := nb_joueurs;
								load(plato,nbb,cjb,j1,j2,j3,j4,loaded);
							end
							else begin
								affiPlateau(plato,tampo,selectione,j1,j2,j3,j4,saut,pause,menJou,choixNbJ,loaded,i_d,i_a,i_dAncien,cj,nb_joueurs);
							end;
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
					if retReg = true then reglagesMenu(retReg,mnR,menuR)
					else begin
						if mnR.id = 1 then begin
							writeln('Thème1');
							retReg := true;
							mnR.id := 0;
							mnR.menus := true;
						end;
						if mnR.id = 2 then begin
							writeln('Thème2');
							retReg := true;
							mnR.id := 0;
							mnR.menus := true;
						end;
						if mnR.id = 3 then begin
							writeln('Thème3');
							retReg := true;
							mnR.id := 0;
							mnR.menus := true;
						end;
						if mnR.id = 4 then begin
							tampo := true;
							retReg := true;
						end;
					end;

				end;

				if mens.id = 4 then exit;
			end;
			gFlip();
		end;
	end;
end.
