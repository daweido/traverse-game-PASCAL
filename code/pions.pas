unit pions;

interface
uses gLib2D,SDL_TTF,sysutils;

procedure carres(xc,yc : integer;color : gColor);
procedure cercles(xc,yc : integer;color : gColor);

Implementation

procedure carres(xc,yc : integer;color : gColor);
begin
	gFillRect(xc+10,yc+10,40,40,color);
end;

procedure cercles(xc,yc : integer;color : gColor);
begin
	gFillCircle(xc+30,yc+30,20,color);
end;

end.
