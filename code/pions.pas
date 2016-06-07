unit pions;

interface
uses gLib2D,SDL_TTF,sysutils;

const
	width = 40;
	height = 40;


procedure carres(xc,yc : integer;color : integer);
procedure cercles(xc,yc : integer;color : integer);
procedure triangles(xc,yc : integer;color : integer);
procedure losanges(xc,yc : integer;color : integer);


Implementation

{Colors :
	1 : blue
	2 : red
	3 : green
	4 : purple}


procedure carres(xc,yc : integer;color : integer);
var
	sqr_blue,sqr_red,sqr_green,sqr_purple : gImage;
begin
	if color = 1 then begin
		sqr_blue := gTexLoad('./images/sqr_blue.png');
		gBeginRects(sqr_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		sqr_red := gTexLoad('./images/sqr_red.png');
		gBeginRects(sqr_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		sqr_green := gTexLoad('./images/sqr_green.png');
		gBeginRects(sqr_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		sqr_purple := gTexLoad('./images/sqr_purple.png');
		gBeginRects(sqr_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

procedure cercles(xc,yc : integer; color : integer);
var
 cir_blue,cir_red,cir_green,cir_purple : gImage;
begin
	if color = 1 then begin
		cir_blue := gTexLoad('./images/cir_blue.png');
		gBeginRects(cir_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		cir_red := gTexLoad('./images/cir_red.png');
		gBeginRects(cir_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		cir_green := gTexLoad('./images/cir_green.png');
		gBeginRects(cir_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		cir_purple := gTexLoad('./images/cir_purple.png');
		gBeginRects(cir_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

procedure triangles(xc,yc : integer;color : integer);
var
	tri_blue,tri_red,tri_green,tri_purple : gImage;
begin
	if color = 1 then begin
		tri_blue := gTexLoad('./images/tri_blue.png');
		gBeginRects(tri_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		tri_red := gTexLoad('./images/tri_red.png');
		gBeginRects(tri_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(180);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		tri_green := gTexLoad('./images/tri_green.png');
		gBeginRects(tri_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(270);
			gAdd();
		gEnd();
	end
	else begin
		tri_purple := gTexLoad('./images/tri_purple.png');
		gBeginRects(tri_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(90);
			gAdd();
		gEnd();
	end;
end;

procedure losanges(xc,yc : integer;color : integer);
var
	lo_blue,lo_red,lo_green,lo_purple : gImage;
begin
	if color = 1 then begin
		lo_blue := gTexLoad('./images/lo_blue.png');
		gBeginRects(lo_blue);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		lo_red := gTexLoad('./images/lo_red.png');
		gBeginRects(lo_red);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		lo_green := gTexLoad('./images/lo_green.png');
		gBeginRects(lo_green);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		lo_purple := gTexLoad('./images/lo_purple.png');
		gBeginRects(lo_purple);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

end.
