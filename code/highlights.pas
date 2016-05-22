unit highlights;

interface
uses gLib2D,SDL_TTF,sysutils,pions;

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

procedure highlight(plato : plateauDyn;i_d : integer);

Implementation

procedure highlightCarre(plato : plateauDyn;i_d : integer);
begin
  if i_d < 98 then if (plato[i_d+1].p.identif = 0) then gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,125);
  if i_d > 1 then if (plato[i_d-1].p.identif = 0) then gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,125);
  if i_d < 89 then if (plato[i_d+10].p.identif = 0) then gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,125);
  if i_d > 10 then if(plato[i_d-10].p.identif = 0) then gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,125);
end;

procedure highlightTriangle(plato : plateauDyn;i_d : integer);
begin
  if (plato[i_d].p.clr = 1) then begin
    if i_d < 89 then if (plato[i_d+10].p.identif = 0) then gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,125);
    if i_d > 9 then if (plato[i_d-9].p.identif = 0) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
    if i_d > 11 then if (plato[i_d-11].p.identif = 0) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
  end
	else if (plato[i_d].p.clr = 2) then begin
    if i_d > 10 then if (plato[i_d-10].p.identif = 0) then gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,125);
    if i_d < 90 then if (plato[i_d+9].p.identif = 0) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
    if i_d < 88 then if (plato[i_d+11].p.identif = 0) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  end
  else if (plato[i_d].p.clr = 3) then begin
    if i_d < 98 then if (plato[i_d+1].p.identif = 0) then gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,125);
    if i_d < 90 then if (plato[i_d+9].p.identif = 0) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
    if i_d > 11 then if (plato[i_d-11].p.identif = 0) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
  end
  else begin
    if i_d > 1 then if (plato[i_d-1].p.identif = 0) then gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,125);
    if i_d > 9 then if (plato[i_d-9].p.identif = 0) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
    if i_d < 88 then if (plato[i_d+11].p.identif = 0) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  end;
end;

procedure highlightLosange(plato : plateauDyn;i_d : integer);
begin
	if i_d < 88 then if (plato[i_d+11].p.identif = 0) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  if i_d > 11 then if (plato[i_d-11].p.identif = 0) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
  if i_d < 90 then if (plato[i_d+9].p.identif = 0) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
  if i_d > 9 then if (plato[i_d-9].p.identif = 0) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
end;

procedure highlightCercle(plato : plateauDyn;i_d : integer);
begin
  if i_d < 98 then if (plato[i_d+1].p.identif = 0) then gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,125);
  if i_d > 1 then if (plato[i_d-1].p.identif = 0) then gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,125);
  if i_d < 90 then if (plato[i_d+9].p.identif = 0) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
  if i_d > 9 then if (plato[i_d-9].p.identif = 0) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
  if i_d < 89 then if (plato[i_d+10].p.identif = 0) then gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,125);
  if i_d > 10 then if (plato[i_d-10].p.identif = 0) then gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,125);
  if i_d < 88 then if (plato[i_d+11].p.identif = 0) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  if i_d > 11 then if (plato[i_d-11].p.identif = 0) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
end;
//FAIRE APPARAITRE TOUT LES SAUTS POSSIBLES ET FAIRE QU'UN TOUR POUR LE SAUT

procedure highlight(plato : plateauDyn;i_d : integer);
begin
	gFillRectAlpha(plato[i_d].x,plato[i_d].y,60,60,WHITE,125);
	gDrawRect(plato[i_d].x, plato[i_d].y,60,60,WHITE);
	gDrawRect(plato[i_d].x+1, plato[i_d].y+1,58,58,WHITE);
  if plato[i_d].p.identif = 1 then highlightCarre(plato,i_d);
  if plato[i_d].p.identif = 2 then highlightTriangle(plato,i_d);
	if plato[i_d].p.identif = 3 then highlightLosange(plato,i_d);
  if plato[i_d].p.identif = 4 then highlightCercle(plato,i_d);
end;

end.
