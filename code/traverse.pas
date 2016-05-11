program traverse;

uses gLib2D,SDL_TTF,sysutils,plateau,widget;

var
	plato : plateauDyn;
begin
	plato := creaPlateau();
	affiPlateau(plato);
	joueur12;
	gFlip();
	while true do begin
		while (sdl_update = 1) do begin
				if (sdl_do_quit) then (* Clic sur la croix pour fermer *)
						exit;
		end;
	end;
end.
