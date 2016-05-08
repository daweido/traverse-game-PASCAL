program traverse;

uses gLib2D,SDL_TTF,sysutils;

procedure creaPlateau;
var
	i,j,x,y : integer;
begin
	x := 200;
	y := 75;
	for i := 1 to 10 do begin
		for j := 1 to 10 do begin
			if (j mod 2 = 1) then begin
				if (i mod 2 = 1) then gFillRect(x,y,60,60,BLACK)
				else gFillRect(x,y,60,60,WHITE);
			end
			else begin
				if (i mod 2 = 0) then gFillRect(x,y,60,60,BLACK)
				else gFillRect(x,y,60,60,WHITE);
			end;
			x += 60;
		end;
		x := 200;
		y += 60;
	end;
	gDrawRect(200,75,600,600,BLACK);
end;

begin
	gclear(WHITE);
	creaPlateau;
	gFlip();
	while true do begin

		while (sdl_update = 1) do begin
				if (sdl_do_quit) then (* Clic sur la croix pour fermer *)
						exit;
		end;
	end;
end.
