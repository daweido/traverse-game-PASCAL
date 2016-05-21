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

	const
		w = 60;
		h = 60;

procedure highlight(plato : plateauDyn;i_d : integer;Var selected_white,selected_dark,possible : gImage);

var
	selected_white,selected_dark,possible : gImage;
Implementation

procedure loadHighlights(Var selected_white,selected_dark,possible : gImage);
begin
	selected_white := gTexLoad('selected_white.png');
	selected_dark := gTexLoad('selected_dark.png');
	possible := gTexLoad('possible.png');
end;

procedure affiSelected(xc,yc : integer;selected: gImage);
begin
		gBeginRects(selected);
			gSetCoordMode(G_UP_LEFT);
			gSetScaleWH(w,h);
			gSetCoord(xc,yc);
			gAdd();
		gEnd();
end;

procedure affiPossible(xc,yc : integer;possible: gImage);
begin
	gBeginRects(possible);
		gSetCoordMode(G_UP_LEFT);
		gSetScaleWH(w,h);
		gSetCoord(xc,yc);
		gAdd();
	gEnd();
end;

procedure highlightCarre(plato : plateauDyn;i_d : integer);
begin
  if i_d < 98 then if (plato[i_d+1].p.identif = 0) then affiPossible(plato[i_d+1].x,plato[i_d+1].y,possible);
		//gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,100);
  if i_d > 1 then if (plato[i_d-1].p.identif = 0) then affiPossible(plato[i_d-1].x,plato[i_d-1].y,possible);
		//gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,100); //1 for Green //2 for Red
  if i_d < 89 then if (plato[i_d+10].p.identif = 0) then affiPossible(plato[i_d+10].x,plato[i_d+10].y,possible);
		//gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,100);
  if i_d > 10 then if(plato[i_d-10].p.identif = 0) then affiPossible(plato[i_d-10].x,plato[i_d-10].y,possible);
		//gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,100);
end;

procedure highlightTriangle(plato : plateauDyn;i_d : integer);
begin
  if (plato[i_d].p.clr = 1) then begin
    if i_d < 89 then if (plato[i_d+10].p.identif = 0) then affiPossible(plato[i_d+10].x,plato[i_d+10].y,possible);
			//gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,100);
    if i_d > 9 then if (plato[i_d-9].p.identif = 0) then affiPossible(plato[i_d-9].x,plato[i_d-9].y,possible);
			//gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,100); //1 for Green //2 for Red
    if i_d > 11 then if (plato[i_d-11].p.identif = 0) then affiPossible(plato[i_d-11].x,plato[i_d-11].y,possible);
			//gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,100);
  end
	else if (plato[i_d].p.clr = 2) then begin
    if i_d > 10 then if (plato[i_d-10].p.identif = 0) then affiPossible(plato[i_d-10].x,plato[i_d-10].y,possible);
			//gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,100);
    if i_d < 90 then if (plato[i_d+9].p.identif = 0) then affiPossible(plato[i_d+9].x,plato[i_d+9].y,possible);
			//gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,100);
    if i_d < 88 then if (plato[i_d+11].p.identif = 0) then affiPossible(plato[i_d+11].x,plato[i_d+11].y,possible);
			//gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,100);
  end
  else if (plato[i_d].p.clr = 3) then begin
    if i_d < 98 then if (plato[i_d+1].p.identif = 0) then affiPossible(plato[i_d+1].x,plato[i_d+1].y,possible);
			//gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,100);
    if i_d < 90 then if (plato[i_d+9].p.identif = 0) then affiPossible(plato[i_d+9].x,plato[i_d+9].y,possible);
			//gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,100);
    if i_d > 11 then if (plato[i_d-11].p.identif = 0) then affiPossible(plato[i_d-11].x,plato[i_d-11].y,possible);
			//gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,100);
  end
  else begin
    if i_d > 1 then if (plato[i_d-1].p.identif = 0) then affiPossible(plato[i_d-1].x,plato[i_d-1].y,possible);
			//gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,100);
    if i_d > 9 then if (plato[i_d-9].p.identif = 0) then affiPossible(plato[i_d-9].x,plato[i_d-9].y,possible);
			//gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,100);
    if i_d < 88 then if (plato[i_d+11].p.identif = 0) then affiPossible(plato[i_d+11].x,plato[i_d+11].y,possible);
			//gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,100);
  end;
end;

//////////////////////////////
procedure highlightLosange(plato : plateauDyn;i_d : integer);
begin
	if i_d < 88 then if (plato[i_d+11].p.identif = 0) then affiPossible(plato[i_d+11].x,plato[i_d+11].y,possible);
		//gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,100);
  if i_d > 11 then if (plato[i_d-11].p.identif = 0) then affiPossible(plato[i_d-11].x,plato[i_d-11].y,possible);
		//gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,100); //1 for Green //2 for Red
  if i_d < 90 then if (plato[i_d+9].p.identif = 0) then affiPossible(plato[i_d+9].x,plato[i_d+9].y,possible);
		//gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,100);
  if i_d > 9 then if (plato[i_d-9].p.identif = 0) then affiPossible(plato[i_d-9].x,plato[i_d-9].y,possible);
		//gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,100);
end;

procedure highlightCercle(plato : plateauDyn;i_d : integer);
begin
  if i_d < 98 then if (plato[i_d+1].p.identif = 0) then affiPossible(plato[i_d+1].x,plato[i_d+1].y,possible);
		//gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,100);
  if i_d > 1 then if (plato[i_d-1].p.identif = 0) then affiPossible(plato[i_d-1].x,plato[i_d-1].y,possible);
		//gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,100);
  if i_d < 90 then if (plato[i_d+9].p.identif = 0) then affiPossible(plato[i_d+9].x,plato[i_d+9].y,possible);
		//gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,100);
  if i_d > 9 then if (plato[i_d-9].p.identif = 0) then affiPossible(plato[i_d-9].x,plato[i_d-9].y,possible);
		//gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,100);
  if i_d < 89 then if (plato[i_d+10].p.identif = 0) then affiPossible(plato[i_d+10].x,plato[i_d+10].y,possible);
		//gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,100);
  if i_d > 10 then if (plato[i_d-10].p.identif = 0) then affiPossible(plato[i_d-10].x,plato[i_d-10].y,possible);
		//gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,100);
  if i_d < 88 then if (plato[i_d+11].p.identif = 0) then affiPossible(plato[i_d+11].x,plato[i_d+11].y,possible);
		//gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,100);
  if i_d > 11 then if (plato[i_d-11].p.identif = 0) then affiPossible(plato[i_d-11].x,plato[i_d-11].y,possible);
		//gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,100);
end;


//FAIRE APPARAITRE TOUT LES SAUTS POSSIBLES ET FAIRE QU'UN TOUR POUR LE SAUT

procedure highlight(plato : plateauDyn;i_d : integer;Var selected_white,selected_dark,possible : gImage);
begin
	loadHighlights(selected_white,selected_dark,possible);
	{if (plato[i_d].couleur = white) then }
	affiSelected(plato[i_d].x,plato[i_d].y,selected_dark);
	{else} //affiSelected(plato[i_d].x,plato[i_d].y,selected_white);
	gFillRectAlpha(plato[i_d].x,plato[i_d].y,60,60,WHITE,50);
  if plato[i_d].p.identif = 1 then highlightCarre(plato,i_d);
  if plato[i_d].p.identif = 2 then highlightTriangle(plato,i_d);
	if plato[i_d].p.identif = 3 then highlightLosange(plato,i_d);
  if plato[i_d].p.identif = 4 then highlightCercle(plato,i_d);
end;

end.
