unit pions;

interface
uses gLib2D,SDL_TTF,sysutils,loadImages;

const
	width = 40;
	height = 40;


procedure carres(xc,yc : integer;color : integer;theme : images);
procedure cercles(xc,yc : integer;color : integer;theme : images);
procedure triangles(xc,yc : integer;color : integer;theme : images);
procedure losanges(xc,yc : integer;color : integer;theme : images);


Implementation

{Colors :
	1 : blue
	2 : red
	3 : green
	4 : purple}


procedure carres(xc,yc : integer;color : integer;theme : images);
var
	sqr_blue,sqr_red,sqr_green,sqr_purple : gImage;
begin
	if color = 1 then begin
		sqr_blue := theme.J1Full[1];
		gBeginRects(sqr_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		sqr_red := theme.J2Full[1];
		gBeginRects(sqr_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		sqr_green := theme.J3Full[1];
		gBeginRects(sqr_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		sqr_purple := theme.J4Full[1];
		gBeginRects(sqr_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

procedure cercles(xc,yc : integer; color : integer; theme : images);
var
 cir_blue,cir_red,cir_green,cir_purple : gImage;
begin
	if color = 1 then begin
		cir_blue := theme.J1Full[4];
		gBeginRects(cir_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		cir_red := theme.J2Full[4];
		gBeginRects(cir_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		cir_green := theme.J3Full[4];
		gBeginRects(cir_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		cir_purple := theme.J4Full[4];
		gBeginRects(cir_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

procedure triangles(xc,yc : integer;color : integer;theme : images);
var
	tri_blue,tri_red,tri_green,tri_purple : gImage;
begin
	if color = 1 then begin
		tri_blue := theme.J1Full[2];
		gBeginRects(tri_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		tri_red := theme.J2Full[2];
		gBeginRects(tri_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(180);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		tri_green := theme.J3Full[2];
		gBeginRects(tri_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(270);
			gAdd();
		gEnd();
	end
	else begin
		tri_purple := theme.J4Full[2];
		gBeginRects(tri_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(90);
			gAdd();
		gEnd();
	end;
end;

procedure losanges(xc,yc : integer;color : integer;theme : images);
var
	lo_blue,lo_red,lo_green,lo_purple : gImage;
begin
	if color = 1 then begin
		lo_blue := theme.J1Full[3];
		gBeginRects(lo_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		lo_red := theme.J2Full[3];
		gBeginRects(lo_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		lo_green := theme.J3Full[3];
		gBeginRects(lo_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		lo_purple := theme.J4Full[3];
		gBeginRects(lo_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

end.
