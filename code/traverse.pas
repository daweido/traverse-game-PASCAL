program traverse;

uses gLib2D,SDL_TTF,sysutils,plateau,widget,menu;

var
	plato : plateauDyn;
	mens : men;
	tampo : boolean;
	menua : gImage;
begin
	plato := creaPlateau();
	menua := iniMenus;
	tampo := true;
	//joueur12;
	while true do begin
		while (sdl_update = 1) do begin
				if (sdl_do_quit) then exit; (* Clic sur la croix pour fermer *)
		end;
		principalMenu(tampo,mens,plato,menua);
		gFlip();
	end;
end.
