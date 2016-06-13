unit highlights;

interface
uses gLib2D,sysutils,pions,loadImages;

type pion = record
		identif : integer;
		clr : integer;
	end;


TYPE plat = record
		x,y: integer;
		p : pion;
		couleur : gColor;
	end;

type
	plateauDyn = array of plat;

function casesCote(plato : plateauDyn;i_a,i_d : integer): boolean;
procedure highlight(plato : plateauDyn;i_d,i_dAncien : integer;saut : boolean;theme : images);
function highlightDepart(plato : plateauDyn;i_d,i : integer): boolean;
function TraverseTableau(i_d,i_a : integer): boolean;


Implementation

procedure carres_alpha(xc,yc : integer;color : integer;theme : images);
var
	sqr_blue_alpha,sqr_red_alpha,sqr_green_alpha,sqr_purple_alpha : gImage;
begin
	if color = 1 then begin
		sqr_blue_alpha := theme.J1Alpha[1];
		gBeginRects(sqr_blue_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		sqr_red_alpha := theme.J2Alpha[1];
		gBeginRects(sqr_red_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		sqr_green_alpha := theme.J3Alpha[1];
		gBeginRects(sqr_green_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		sqr_purple_alpha := theme.J4Alpha[1];
		gBeginRects(sqr_purple_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

procedure cercles_alpha(xc,yc : integer; color : integer;theme : images);
var
 cir_blue_alpha,cir_red_alpha,cir_green_alpha,cir_purple_alpha : gImage;
begin
	if color = 1 then begin
		cir_blue_alpha := theme.J1Alpha[4];
		gBeginRects(cir_blue_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		cir_red_alpha := theme.J2Alpha[4];
		gBeginRects(cir_red_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		cir_green_alpha := theme.J3Alpha[4];
		gBeginRects(cir_green_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		cir_purple_alpha := theme.J4Alpha[4];
		gBeginRects(cir_purple_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;

procedure triangles_alpha(xc,yc : integer;color : integer;theme : images);
var
	tri_blue_alpha,tri_red_alpha,tri_green_alpha,tri_purple_alpha : gImage;
begin
	if color = 1 then begin
		tri_blue_alpha := theme.J1Alpha[2];
		gBeginRects(tri_blue_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		tri_red_alpha := theme.J2Alpha[2];
		gBeginRects(tri_red_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(180);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		tri_green_alpha := theme.J3Alpha[2];
		gBeginRects(tri_green_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(270);
			gAdd();
		gEnd();
	end
	else begin
		tri_purple_alpha := theme.J4Alpha[2];
		gBeginRects(tri_purple_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gSetRotation(90);
			gAdd();
		gEnd();
	end;
end;

procedure losanges_alpha(xc,yc : integer;color : integer;theme : images);
var
	lo_blue_alpha,lo_red_alpha,lo_green_alpha,lo_purple_alpha : gImage;
begin
	if color = 1 then begin
		lo_blue_alpha := theme.J1Alpha[3];
		gBeginRects(lo_blue_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 2 then begin
		lo_red_alpha := theme.J2Alpha[3];
		gBeginRects(lo_red_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else if color = 3 then begin
		lo_green_alpha := theme.J3Alpha[3];
		gBeginRects(lo_green_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end
	else begin
		lo_purple_alpha := theme.J4Alpha[3];
		gBeginRects(lo_purple_alpha);
			gSetCoordMode(G_CENTER);
			gSetScaleWH(width,height);
			gSetCoord(xc+30,yc+30);
			gAdd();
		gEnd();
	end;
end;
//////////Traversé du tableau//////////
function deplDroiteGauche(i_d,i_a : integer): boolean;
begin
	if (((i_a = 10) or
	(i_a = 1) or (i_a = 11) or (i_a = 20) or (i_a = 21) or (i_a = 30) or (i_a = 31) or
	(i_a = 40) or (i_a = 41) or (i_a = 50) or (i_a = 51) or (i_a = 60) or (i_a = 61) or
	(i_a = 70) or (i_a = 71) or (i_a = 80) or (i_a = 81) or (i_a = 91)) and ((i_d = 8) or
	(i_d = 18) or (i_d = 28) or (i_d = 38) or (i_d = 48) or (i_d = 58) or (i_d = 68) or
	(i_d = 78) or (i_d = 88) or (i_d = 19) or (i_d = 29) or (i_d = 39) or (i_d = 49) or
	(i_d = 59) or (i_d = 69) or (i_d = 79) or (i_d = 89) or (i_d = 98))) then deplDroiteGauche := true
	else deplDroiteGauche := false;
end;

function deplGaucheDroite(i_d,i_a : integer):boolean;
begin
	if (((i_d = 10) or (i_d = 1) or (i_d = 11) or (i_d = 20) or (i_d = 21) or (i_d = 30) or (i_d = 31) or
		(i_d = 40) or (i_d = 41) or (i_d = 50) or (i_d = 51) or (i_d = 60) or (i_d = 61) or
		(i_d = 70) or (i_d = 71) or (i_d = 80) or (i_d = 81) or (i_d = 91)) and ((i_a = 8) or
		(i_a = 18) or (i_a = 28) or (i_a = 38) or (i_a = 48) or (i_a = 58) or (i_a = 68) or
		(i_a = 78) or (i_a = 88) or (i_a = 19) or (i_a = 29) or (i_a = 39) or (i_a = 49) or
		(i_a = 59) or (i_a = 69) or (i_a = 79) or (i_a = 89) or (i_a = 98))) then deplGaucheDroite := true
	else deplGaucheDroite := false;
end;


function concerne(i_d,i_a : integer): boolean;
begin
	if (((i_d = 10) or (i_d = 1) or (i_d = 11) or (i_d = 20) or (i_d = 21) or (i_d = 30) or (i_d = 31) or
		(i_d = 40) or (i_d = 41) or (i_d = 50) or (i_d = 51) or (i_d = 60) or (i_d = 61) or
		(i_d = 70) or (i_d = 71) or (i_d = 80) or (i_d = 81) or (i_d = 91)) and ((i_a = 8) or
		(i_a = 18) or (i_a = 28) or (i_a = 38) or (i_a = 48) or (i_a = 58) or (i_a = 68) or
		(i_a = 78) or (i_a = 88) or (i_a = 19) or (i_a = 29) or (i_a = 39) or (i_a = 49) or
		(i_a = 59) or (i_a = 69) or (i_a = 79) or (i_a = 89) or (i_a = 98))) or ((i_a = 10) or
		(i_a = 1) or (i_a = 11) or (i_a = 20) or (i_a = 21) or (i_a = 30) or (i_a = 31) or
		(i_a = 40) or (i_a = 41) or (i_a = 50) or (i_a = 51) or (i_a = 60) or (i_a = 61) or
		(i_a = 70) or (i_a = 71) or (i_a = 80) or (i_a = 81) or (i_a = 91)) and ((i_d = 8) or
		(i_d = 18) or (i_d = 28) or (i_d = 38) or (i_d = 48) or (i_d = 58) or (i_d = 68) or
		(i_d = 78) or (i_d = 88) or (i_d = 19) or (i_d = 29) or (i_d = 39) or (i_d = 49) or
		(i_d = 59) or (i_d = 69) or (i_d = 79) or (i_d = 89) or (i_d = 98)) then concerne := true
		else concerne := false;
end;

function TraverseTableau(i_d,i_a : integer): boolean;
begin
	if concerne(i_d,i_a) then begin
		if deplGaucheDroite(i_d,i_a) or deplDroiteGauche(i_d,i_a) then TraverseTableau := true
		else TraverseTableau := false;
	end
	else TraverseTableau:= false;
end;


function casesj1(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((i_a = 91) or (i_a = 92) or (i_a = 93) or (i_a = 94) or (i_a = 95) or (i_a = 96) or (i_a = 97) or (i_a = 98)) then begin
		if ((plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2)) then casesj1 := true
		else casesj1 := false;
	end;
end;

function casesj2(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((i_a = 1) or (i_a = 2) or (i_a = 3) or (i_a = 4) or (i_a = 5) or (i_a = 6) or (i_a = 7) or (i_a = 8)) then begin
		if ((plato[i_d].p.clr = 2) or (plato[i_d].p.clr = 1)) then casesj2 := true
		else casesj2 := false;
	end;
end;

function casesj3(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((i_a = 19) or (i_a = 29) or (i_a = 39) or (i_a = 49) or (i_a = 59) or (i_a = 69) or (i_a = 79) or (i_a = 89)) then begin
		if ((plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4)) then casesj3 := true
		else casesj3 := false;
	end;
end;

function casesj4(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((i_a = 10) or (i_a = 20) or (i_a = 30) or (i_a = 40) or (i_a = 50) or (i_a = 60) or (i_a = 70) or (i_a = 80)) then begin
		if ((plato[i_d].p.clr = 4) or (plato[i_d].p.clr = 3)) then casesj4 := true
		else casesj4 := false;
	end;
end;

function casesCote(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if  casesj1(plato,i_a,i_d) and casesj2(plato,i_a,i_d) and casesj3(plato,i_a,i_d) and casesj4(plato,i_a,i_d)  then casesCote := true
	else casesCote := false;
end;


function highlightDepart1(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if (((i=91) or (i=92) or (i=93) or (i=94) or (i=95) or (i = 96) or (i=97) or (i=98)) and ((plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2))) then highlightDepart1 := true
	else highlightDepart1 := false
end;

function highlightDepart2(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if (((i=1) or (i=2) or (i=3) or (i=4) or (i=5) or (i = 6) or (i=7) or (i=8)) and ((plato[i_d].p.clr = 1) or (plato[i_d].p.clr = 2))) then highlightDepart2 := true
	else highlightDepart2 := false;
end;

function highlightDepart3(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if (((i=19) or (i=29) or (i=39) or (i=49) or (i=59) or (i = 69) or (i=79) or (i=89)) and ((plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4))) then highlightDepart3 := true
	else highlightDepart3 := false;
end;

function highlightDepart4(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if (((i=10) or (i=20) or (i=30) or (i=40) or (i=50) or (i = 60) or (i=70) or (i=80)) and ((plato[i_d].p.clr = 3) or (plato[i_d].p.clr = 4))) then highlightDepart4 := true
	else highlightDepart4 := false;
end;

function entrerHighDep(i : integer):boolean;
begin
	if ((i=91) or (i=92) or (i=93) or (i=94) or (i=95) or (i = 96) or (i=97) or
		(i=98) or (i=1) or (i=2) or (i=3) or (i=4) or (i=5) or (i = 6) or (i=7) or
		(i=8) or (i=19) or (i=29) or (i=39) or (i=49) or (i=59) or (i = 69) or (i=79)
		or (i=89) or (i=10) or (i=20) or (i=30) or (i=40) or (i=50) or (i = 60) or
		(i=70) or (i=80)) then entrerHighDep := true
		else entrerHighDep := false;
end;

function highlightDepart(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if entrerHighDep(i) then begin
		if highlightDepart1(plato,i_d,i) or highlightDepart2(plato,i_d,i) or highlightDepart3(plato,i_d,i) or highlightDepart4(plato,i_d,i) then highlightDepart := true
		else highlightDepart := false;
	end
	else highlightDepart := true;
end;

procedure highlightCarreSaut(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
  if i_d < 97 then if ((plato[i_d+2].p.identif = 0) and (i_d+2 <> i_dAncien) and (plato[i_d+1].p.identif <> 0) and highlightDepart(plato,i_d,i_d+2) and not(TraverseTableau(i_d,i_d+2))) then carres_alpha(plato[i_d+2].x,plato[i_d+2].y,plato[i_d].p.clr,theme);
  if i_d > 2 then if ((plato[i_d-2].p.identif = 0) and (i_d-2 <> i_dAncien) and (plato[i_d-1].p.identif <> 0) and highlightDepart(plato,i_d,i_d-2) and not(TraverseTableau(i_d,i_d-2))) then carres_alpha(plato[i_d-2].x,plato[i_d-2].y,plato[i_d].p.clr,theme);
  if i_d < 79 then if ((plato[i_d+20].p.identif = 0) and (i_d+20 <> i_dAncien) and (plato[i_d+10].p.identif <> 0) and highlightDepart(plato,i_d,i_d+20) and not(TraverseTableau(i_d,i_d+20))) then carres_alpha(plato[i_d+20].x,plato[i_d+20].y,plato[i_d].p.clr,theme);
  if i_d > 20 then if ((plato[i_d-20].p.identif = 0) and (i_d-20 <> i_dAncien) and (plato[i_d-10].p.identif <> 0) and highlightDepart(plato,i_d,i_d-20) and not(TraverseTableau(i_d,i_d-20))) then carres_alpha(plato[i_d-20].x,plato[i_d-20].y,plato[i_d].p.clr,theme);
end;

procedure highlightCarre(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
  if i_d < 98 then if ((plato[i_d+1].p.identif = 0) and highlightDepart(plato,i_d,i_d+1) and not(TraverseTableau(i_d,i_d+1))) then carres_alpha(plato[i_d+1].x,plato[i_d+1].y,plato[i_d].p.clr,theme);
  if i_d > 1 then if ((plato[i_d-1].p.identif = 0) and highlightDepart(plato,i_d,i_d-1) and not(TraverseTableau(i_d,i_d-1))) then carres_alpha(plato[i_d-1].x,plato[i_d-1].y,plato[i_d].p.clr,theme);
  if i_d < 89 then if ((plato[i_d+10].p.identif = 0) and highlightDepart(plato,i_d,i_d+10) and not(TraverseTableau(i_d,i_d+10))) then carres_alpha(plato[i_d+10].x,plato[i_d+10].y,plato[i_d].p.clr,theme);
  if i_d > 10 then if ((plato[i_d-10].p.identif = 0) and highlightDepart(plato,i_d,i_d-10) and not(TraverseTableau(i_d,i_d-10))) then carres_alpha(plato[i_d-10].x,plato[i_d-10].y,plato[i_d].p.clr,theme);
	highlightCarreSaut(plato,i_d,i_dAncien,theme);
end;

procedure highlightTriangleSaut(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
  if (plato[i_d].p.clr = 1) then begin
    if i_d < 79 then if ((plato[i_d+20].p.identif = 0) and (i_d+20 <> i_dAncien) and (plato[i_d+10].p.identif <> 0) and highlightDepart(plato,i_d,i_d+20) and not(TraverseTableau(i_d,i_d+20))) then triangles_alpha(plato[i_d+20].x,plato[i_d+20].y,plato[i_d].p.clr,theme);
    if i_d > 18 then if ((plato[i_d-18].p.identif = 0) and (i_d-18 <> i_dAncien) and (plato[i_d-9].p.identif <> 0) and highlightDepart(plato,i_d,i_d-18) and not(TraverseTableau(i_d,i_d-18))) then triangles_alpha(plato[i_d-18].x,plato[i_d-18].y,plato[i_d].p.clr,theme);
    if i_d > 22 then if ((plato[i_d-22].p.identif = 0) and (i_d-22 <> i_dAncien) and (plato[i_d-11].p.identif <> 0) and highlightDepart(plato,i_d,i_d-22) and not(TraverseTableau(i_d,i_d-22))) then triangles_alpha(plato[i_d-22].x,plato[i_d-22].y,plato[i_d].p.clr,theme);
  end
	else if (plato[i_d].p.clr = 2) then begin
    if i_d > 20 then if ((plato[i_d-20].p.identif = 0) and (i_d-20 <> i_dAncien) and (plato[i_d-10].p.identif <> 0) and highlightDepart(plato,i_d,i_d-20) and not(TraverseTableau(i_d,i_d-20))) then triangles_alpha(plato[i_d-20].x,plato[i_d-20].y,plato[i_d].p.clr,theme);
    if i_d < 81 then if ((plato[i_d+18].p.identif = 0) and (i_d+18 <> i_dAncien) and (plato[i_d+9].p.identif <> 0) and highlightDepart(plato,i_d,i_d+18) and not(TraverseTableau(i_d,i_d+18))) then triangles_alpha(plato[i_d+18].x,plato[i_d+18].y,plato[i_d].p.clr,theme);
    if i_d < 77 then if ((plato[i_d+22].p.identif = 0) and (i_d+22 <> i_dAncien) and (plato[i_d+11].p.identif <> 0) and highlightDepart(plato,i_d,i_d+22) and not(TraverseTableau(i_d,i_d+22))) then triangles_alpha(plato[i_d+22].x,plato[i_d+22].y,plato[i_d].p.clr,theme);
  end
  else if (plato[i_d].p.clr = 3) then begin
    if i_d < 97 then if ((plato[i_d+2].p.identif = 0) and (i_d+2 <> i_dAncien) and (plato[i_d+1].p.identif <> 0) and highlightDepart(plato,i_d,i_d+2) and not(TraverseTableau(i_d,i_d+2))) then triangles_alpha(plato[i_d+2].x,plato[i_d+2].y,plato[i_d].p.clr,theme);
    if i_d < 81 then if ((plato[i_d+18].p.identif = 0) and (i_d+18 <> i_dAncien) and (plato[i_d+9].p.identif <> 0) and highlightDepart(plato,i_d,i_d+18) and not(TraverseTableau(i_d,i_d+18))) then triangles_alpha(plato[i_d+18].x,plato[i_d+18].y,plato[i_d].p.clr,theme);
    if i_d > 22 then if ((plato[i_d-22].p.identif = 0) and (i_d-22 <> i_dAncien) and (plato[i_d-11].p.identif <> 0) and highlightDepart(plato,i_d,i_d-22) and not(TraverseTableau(i_d,i_d-22))) then triangles_alpha(plato[i_d-22].x,plato[i_d-22].y,plato[i_d].p.clr,theme);
  end
  else begin
    if i_d > 2 then if ((plato[i_d-2].p.identif = 0) and (i_d-2 <> i_dAncien) and (plato[i_d-1].p.identif <> 0) and highlightDepart(plato,i_d,i_d-2) and not(TraverseTableau(i_d,i_d-2))) then triangles_alpha(plato[i_d-2].x,plato[i_d-2].y,plato[i_d].p.clr,theme);
    if i_d > 18 then if ((plato[i_d-18].p.identif = 0) and (i_d-18 <> i_dAncien) and (plato[i_d-9].p.identif <> 0) and highlightDepart(plato,i_d,i_d-18) and not(TraverseTableau(i_d,i_d-18))) then triangles_alpha(plato[i_d-18].x,plato[i_d-18].y,plato[i_d].p.clr,theme);
    if i_d < 77 then if ((plato[i_d+22].p.identif = 0) and (i_d+22 <> i_dAncien) and (plato[i_d+11].p.identif <> 0) and highlightDepart(plato,i_d,i_d+22) and not(TraverseTableau(i_d,i_d+22))) then triangles_alpha(plato[i_d+22].x,plato[i_d+22].y,plato[i_d].p.clr,theme);
  end;
end;

procedure highlightTriangle(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
  if (plato[i_d].p.clr = 1) then begin
    if i_d < 89 then if ((plato[i_d+10].p.identif = 0) and highlightDepart(plato,i_d,i_d+10) and not(TraverseTableau(i_d,i_d+10))) then triangles_alpha(plato[i_d+10].x,plato[i_d+10].y,plato[i_d].p.clr,theme);
    if i_d > 9 then if ((plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9) and not(TraverseTableau(i_d,i_d-9))) then triangles_alpha(plato[i_d-9].x,plato[i_d-9].y,plato[i_d].p.clr,theme);
    if i_d > 11 then if ((plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11) and not(TraverseTableau(i_d,i_d-11))) then triangles_alpha(plato[i_d-11].x,plato[i_d-11].y,plato[i_d].p.clr,theme);
  end
	else if (plato[i_d].p.clr = 2) then begin
    if i_d > 10 then if ((plato[i_d-10].p.identif = 0) and highlightDepart(plato,i_d,i_d-10) and not(TraverseTableau(i_d,i_d-10))) then triangles_alpha(plato[i_d-10].x,plato[i_d-10].y,plato[i_d].p.clr,theme);
    if i_d < 90 then if ((plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9) and not(TraverseTableau(i_d,i_d+9))) then triangles_alpha(plato[i_d+9].x,plato[i_d+9].y,plato[i_d].p.clr,theme);
    if i_d < 88 then if ((plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11) and not(TraverseTableau(i_d,i_d+11))) then triangles_alpha(plato[i_d+11].x,plato[i_d+11].y,plato[i_d].p.clr,theme);
  end
  else if (plato[i_d].p.clr = 3) then begin
    if i_d < 98 then if ((plato[i_d+1].p.identif = 0) and highlightDepart(plato,i_d,i_d+1) and not(TraverseTableau(i_d,i_d+1))) then triangles_alpha(plato[i_d+1].x,plato[i_d+1].y,plato[i_d].p.clr,theme);
    if i_d < 90 then if ((plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9) and not(TraverseTableau(i_d,i_d+9))) then triangles_alpha(plato[i_d+9].x,plato[i_d+9].y,plato[i_d].p.clr,theme);
    if i_d > 11 then if ((plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11) and not(TraverseTableau(i_d,i_d-11))) then triangles_alpha(plato[i_d-11].x,plato[i_d-11].y,plato[i_d].p.clr,theme);
  end
  else begin
    if i_d > 1 then if ((plato[i_d-1].p.identif = 0) and highlightDepart(plato,i_d,i_d-1) and not(TraverseTableau(i_d,i_d-1))) then triangles_alpha(plato[i_d-1].x,plato[i_d-1].y,plato[i_d].p.clr,theme);
    if i_d > 9 then if ((plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9) and not(TraverseTableau(i_d,i_d-9))) then triangles_alpha(plato[i_d-9].x,plato[i_d-9].y,plato[i_d].p.clr,theme);
    if i_d < 88 then if ((plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11) and not(TraverseTableau(i_d,i_d+11))) then triangles_alpha(plato[i_d+11].x,plato[i_d+11].y,plato[i_d].p.clr,theme);
  end;
	highlightTriangleSaut(plato,i_d,i_dAncien,theme);
end;

procedure highlightLosangeSaut(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
	if i_d < 77 then if ((plato[i_d+22].p.identif = 0) and (i_d+22 <> i_dAncien) and (plato[i_d+11].p.identif <> 0) and highlightDepart(plato,i_d,i_d+22) and not(TraverseTableau(i_d,i_d+22))) then losanges_alpha(plato[i_d+22].x,plato[i_d+22].y,plato[i_d].p.clr,theme);
  if i_d > 22 then if ((plato[i_d-22].p.identif = 0) and (i_d-22 <> i_dAncien) and (plato[i_d-11].p.identif <> 0) and highlightDepart(plato,i_d,i_d-22) and not(TraverseTableau(i_d,i_d-22))) then losanges_alpha(plato[i_d-22].x,plato[i_d-22].y,plato[i_d].p.clr,theme);
  if i_d < 81 then if ((plato[i_d+18].p.identif = 0) and (i_d+18 <> i_dAncien) and (plato[i_d+9].p.identif <> 0) and highlightDepart(plato,i_d,i_d+18) and not(TraverseTableau(i_d,i_d+18))) then losanges_alpha(plato[i_d+18].x,plato[i_d+18].y,plato[i_d].p.clr,theme);
  if i_d > 18 then if ((plato[i_d-18].p.identif = 0) and (i_d-18 <> i_dAncien) and (plato[i_d-9].p.identif <> 0) and highlightDepart(plato,i_d,i_d-18) and not(TraverseTableau(i_d,i_d-18))) then losanges_alpha(plato[i_d-18].x,plato[i_d-18].y,plato[i_d].p.clr,theme);
end;

procedure highlightLosange(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
	if i_d < 88 then if ((plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11) and not(TraverseTableau(i_d,i_d+11))) then losanges_alpha(plato[i_d+11].x,plato[i_d+11].y,plato[i_d].p.clr,theme);
  if i_d > 11 then if ((plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11) and not(TraverseTableau(i_d,i_d-11))) then losanges_alpha(plato[i_d-11].x,plato[i_d-11].y,plato[i_d].p.clr,theme);
  if i_d < 90 then if ((plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9) and not(TraverseTableau(i_d,i_d+9))) then losanges_alpha(plato[i_d+9].x,plato[i_d+9].y,plato[i_d].p.clr,theme);
  if i_d > 9 then if ((plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9) and not(TraverseTableau(i_d,i_d-9))) then losanges_alpha(plato[i_d-9].x,plato[i_d-9].y,plato[i_d].p.clr,theme);
	highlightLosangeSaut(plato,i_d,i_dAncien,theme);
end;

procedure highlightCercleSaut(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
  if i_d < 97 then if (plato[i_d+2].p.identif = 0) and (i_d+2 <> i_dAncien) and (plato[i_d+1].p.identif <> 0) and highlightDepart(plato,i_d,i_d+2)  and not(TraverseTableau(i_d,i_d+2)) then cercles_alpha(plato[i_d+2].x,plato[i_d+2].y,plato[i_d].p.clr,theme);
  if i_d > 2 then if (plato[i_d-2].p.identif = 0) and (i_d-2 <> i_dAncien) and (plato[i_d-1].p.identif <> 0) and highlightDepart(plato,i_d,i_d-2) and not(TraverseTableau(i_d,i_d-2))  then cercles_alpha(plato[i_d-2].x,plato[i_d-2].y,plato[i_d].p.clr,theme);
  if i_d < 71 then if (plato[i_d+18].p.identif = 0) and (i_d+18 <> i_dAncien) and (plato[i_d+9].p.identif <> 0) and highlightDepart(plato,i_d,i_d+18) and not(TraverseTableau(i_d,i_d+18))  then cercles_alpha(plato[i_d+18].x,plato[i_d+18].y,plato[i_d].p.clr,theme);
  if i_d > 18 then if (plato[i_d-18].p.identif = 0) and (i_d-18 <> i_dAncien) and (plato[i_d-9].p.identif <> 0) and highlightDepart(plato,i_d,i_d-18) and not(TraverseTableau(i_d,i_d-18))  then cercles_alpha(plato[i_d-18].x,plato[i_d-18].y,plato[i_d].p.clr,theme);
  if i_d < 79 then if (plato[i_d+20].p.identif = 0) and (i_d+20 <> i_dAncien) and (plato[i_d+10].p.identif <> 0) and highlightDepart(plato,i_d,i_d+20) and not(TraverseTableau(i_d,i_d+20))  then cercles_alpha(plato[i_d+20].x,plato[i_d+20].y,plato[i_d].p.clr,theme);
  if i_d > 20 then if (plato[i_d-20].p.identif = 0) and (i_d-20 <> i_dAncien) and (plato[i_d-10].p.identif <> 0) and highlightDepart(plato,i_d,i_d-20) and not(TraverseTableau(i_d,i_d-20))  then cercles_alpha(plato[i_d-20].x,plato[i_d-20].y,plato[i_d].p.clr,theme);
  if i_d < 77 then if (plato[i_d+22].p.identif = 0) and (i_d+22 <> i_dAncien) and (plato[i_d+11].p.identif <> 0) and highlightDepart(plato,i_d,i_d+22) and not(TraverseTableau(i_d,i_d+22))  then cercles_alpha(plato[i_d+22].x,plato[i_d+22].y,plato[i_d].p.clr,theme);
  if i_d > 22 then if (plato[i_d-22].p.identif = 0) and (i_d-22 <> i_dAncien) and (plato[i_d-11].p.identif <> 0) and highlightDepart(plato,i_d,i_d-22) and not(TraverseTableau(i_d,i_d-22))  then cercles_alpha(plato[i_d-22].x,plato[i_d-22].y,plato[i_d].p.clr,theme);
end;

procedure highlightCercle(plato : plateauDyn;i_d,i_dAncien : integer;theme : images);
begin
  if i_d < 98 then if (plato[i_d+1].p.identif = 0) and highlightDepart(plato,i_d,i_d+1) and not(TraverseTableau(i_d,i_d+1))  then cercles_alpha(plato[i_d+1].x,plato[i_d+1].y,plato[i_d].p.clr,theme);
  if i_d > 1 then if (plato[i_d-1].p.identif = 0) and highlightDepart(plato,i_d,i_d-1) and not(TraverseTableau(i_d,i_d-1))  then cercles_alpha(plato[i_d-1].x,plato[i_d-1].y,plato[i_d].p.clr,theme);
  if i_d < 90 then if (plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9) and not(TraverseTableau(i_d,i_d+9))  then cercles_alpha(plato[i_d+9].x,plato[i_d+9].y,plato[i_d].p.clr,theme);
  if i_d > 9 then if (plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9) and not(TraverseTableau(i_d,i_d-9))  then cercles_alpha(plato[i_d-9].x,plato[i_d-9].y,plato[i_d].p.clr,theme);
  if i_d < 89 then if (plato[i_d+10].p.identif = 0) and highlightDepart(plato,i_d,i_d+10) and not(TraverseTableau(i_d,i_d+10))  then cercles_alpha(plato[i_d+10].x,plato[i_d+10].y,plato[i_d].p.clr,theme);
  if i_d > 10 then if (plato[i_d-10].p.identif = 0) and highlightDepart(plato,i_d,i_d-10)  and not(TraverseTableau(i_d,i_d-10)) then cercles_alpha(plato[i_d-10].x,plato[i_d-10].y,plato[i_d].p.clr,theme);
  if i_d < 88 then if (plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11)  and not(TraverseTableau(i_d,i_d+11)) then cercles_alpha(plato[i_d+11].x,plato[i_d+11].y,plato[i_d].p.clr,theme);
  if i_d > 11 then if (plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11) and not(TraverseTableau(i_d,i_d-11))  then cercles_alpha(plato[i_d-11].x,plato[i_d-11].y,plato[i_d].p.clr,theme);
	highlightCercleSaut(plato,i_d,i_dAncien,theme);
end;

procedure drawContour(i : integer;plato : plateauDyn); //1 : SPRING_GREEN, 2 : RED, 3 : BLUE
begin
		gDrawRect(plato[i].x+2, plato[i].y+2,57,57,SPRING_GREEN);
		gDrawRect(plato[i].x+3, plato[i].y+3,55,55,SPRING_GREEN);
end;

procedure highlight(plato : plateauDyn;i_d,i_dAncien : integer;saut : boolean;theme : images);
begin
	gFillRectAlpha(plato[i_d].x,plato[i_d].y,60,60,WHITE,125);
	drawContour(i_d,plato);
	if (saut = false) then begin
		if plato[i_d].p.identif = 1 then highlightCarre(plato,i_d,i_dAncien,theme);
	  if plato[i_d].p.identif = 2 then highlightTriangle(plato,i_d,i_dAncien,theme);
		if plato[i_d].p.identif = 3 then highlightLosange(plato,i_d,i_dAncien,theme);
		if plato[i_d].p.identif = 4 then highlightCercle(plato,i_d,i_dAncien,theme);
	end
	else begin
		if plato[i_d].p.identif = 1 then highlightCarreSaut(plato,i_d,i_dAncien,theme);
	  if plato[i_d].p.identif = 2 then highlightTriangleSaut(plato,i_d,i_dAncien,theme);
		if plato[i_d].p.identif = 3 then highlightLosangeSaut(plato,i_d,i_dAncien,theme);
		if plato[i_d].p.identif = 4 then highlightCercleSaut(plato,i_d,i_dAncien,theme);
	end;
end;

end.
