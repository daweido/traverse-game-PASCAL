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
function casesCote(plato : plateauDyn;i_a,i_d : integer): boolean;

Implementation

function casesj1(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 1) and ((i_a = 91) or (i_a = 92) or (i_a = 93) or (i_a = 94) or (i_a = 95) or (i_a = 96) or (i_a = 97) or (i_a = 98))) then casesj1 := false
	else casesj1 := true;
end;

function casesj2(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 2) and ((i_a = 1) or (i_a = 2) or (i_a = 3) or (i_a = 4) or (i_a = 5) or (i_a = 6) or (i_a = 7) or (i_a = 8))) then casesj2 := false
	else casesj2 := true;
end;

function casesj3(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 3) and ((i_a = 19) or (i_a = 29) or (i_a = 39) or (i_a = 49) or (i_a = 59) or (i_a = 69) or (i_a = 79) or (i_a = 89))) then casesj3 := false
	else casesj3 := true;
end;

function casesj4(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 4) and ((i_a = 10) or (i_a = 20) or (i_a = 30) or (i_a = 40) or (i_a = 50) or (i_a = 60) or (i_a = 70) or (i_a = 80))) then casesj4 := false
	else casesj4 := true;
end;

function casesCote(plato : plateauDyn;i_a,i_d : integer): boolean;
begin
	if  casesj1(plato,i_a,i_d) and casesj2(plato,i_a,i_d) and casesj3(plato,i_a,i_d) and casesj4(plato,i_a,i_d)  then casesCote := true
	else casesCote := false;
end;


function highlightDepart1(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 1) and ((i = 91) or (i = 92) or (i = 93) or (i = 94) or (i = 95) or (i = 96) or (i = 97) or (i = 98))) then highlightDepart1 := false
	else highlightDepart1 := true;
end;

function highlightDepart2(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 2) and ((i = 1) or (i = 2) or (i = 3) or (i = 4) or (i = 5) or (i = 6) or (i = 7) or (i = 8))) then highlightDepart2 := false
	else highlightDepart2 := true;
end;

function highlightDepart3(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 3) and ((i = 19) or (i = 29) or (i = 39) or (i = 49) or (i = 59) or (i = 69) or (i = 79) or (i = 89))) then highlightDepart3 := false
	else highlightDepart3 := true;
end;

function highlightDepart4(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if ((plato[i_d].p.clr <> 4) and ((i = 10) or (i = 20) or (i = 30) or (i = 40) or (i = 50) or (i = 60) or (i = 70) or (i = 80))) then highlightDepart4 := false
	else highlightDepart4 := true;
end;

function highlightDepart(plato : plateauDyn;i_d,i : integer): boolean;
begin
	if  highlightDepart1(plato,i_d,i) and highlightDepart2(plato,i_d,i) and highlightDepart3(plato,i_d,i) and highlightDepart4(plato,i_d,i)  then highlightDepart := true
	else highlightDepart := false;

end;


procedure highlightCarre(plato : plateauDyn;i_d : integer);
begin
  if i_d < 98 then if ((plato[i_d+1].p.identif = 0) and highlightDepart(plato,i_d,i_d+1)) then gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,125);
  if i_d > 1 then if ((plato[i_d-1].p.identif = 0) and highlightDepart(plato,i_d,i_d-1)) then gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,125);
  if i_d < 89 then if ((plato[i_d+10].p.identif = 0) and highlightDepart(plato,i_d,i_d+10)) then gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,125);
  if i_d > 10 then if ((plato[i_d-10].p.identif = 0) and highlightDepart(plato,i_d,i_d-10)) then gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,125);
end;

procedure highlightTriangle(plato : plateauDyn;i_d : integer);
begin
  if (plato[i_d].p.clr = 1) then begin
    if i_d < 89 then if ((plato[i_d+10].p.identif = 0) and highlightDepart(plato,i_d,i_d+10)) then gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,125);
    if i_d > 9 then if ((plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9)) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
    if i_d > 11 then if ((plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11)) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
  end
	else if (plato[i_d].p.clr = 2) then begin
    if i_d > 10 then if ((plato[i_d-10].p.identif = 0) and highlightDepart(plato,i_d,i_d-10)) then gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,125);
    if i_d < 90 then if ((plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9)) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
    if i_d < 88 then if ((plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11)) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  end
  else if (plato[i_d].p.clr = 3) then begin
    if i_d < 98 then if ((plato[i_d+1].p.identif = 0) and highlightDepart(plato,i_d,i_d+1)) then gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,125);
    if i_d < 90 then if ((plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9)) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
    if i_d > 11 then if ((plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11)) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
  end
  else begin
    if i_d > 1 then if ((plato[i_d-1].p.identif = 0) and highlightDepart(plato,i_d,i_d-1)) then gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,125);
    if i_d > 9 then if ((plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9)) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
    if i_d < 88 then if ((plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11)) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  end;
end;

procedure highlightLosange(plato : plateauDyn;i_d : integer);
begin
	if i_d < 88 then if ((plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11)) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  if i_d > 11 then if ((plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11)) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
  if i_d < 90 then if ((plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9)) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
  if i_d > 9 then if ((plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9)) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
end;

procedure highlightCercle(plato : plateauDyn;i_d : integer);
begin
  if i_d < 98 then if (plato[i_d+1].p.identif = 0) and highlightDepart(plato,i_d,i_d+1) then gFillRectAlpha(plato[i_d+1].x,plato[i_d+1].y,60,60,CHARTREUSE,125);
  if i_d > 1 then if (plato[i_d-1].p.identif = 0) and highlightDepart(plato,i_d,i_d-1) then gFillRectAlpha(plato[i_d-1].x,plato[i_d-1].y,60,60,CHARTREUSE,125);
  if i_d < 90 then if (plato[i_d+9].p.identif = 0) and highlightDepart(plato,i_d,i_d+9) then gFillRectAlpha(plato[i_d+9].x,plato[i_d+9].y,60,60,CHARTREUSE,125);
  if i_d > 9 then if (plato[i_d-9].p.identif = 0) and highlightDepart(plato,i_d,i_d-9) then gFillRectAlpha(plato[i_d-9].x,plato[i_d-9].y,60,60,CHARTREUSE,125);
  if i_d < 89 then if (plato[i_d+10].p.identif = 0) and highlightDepart(plato,i_d,i_d+10) then gFillRectAlpha(plato[i_d+10].x,plato[i_d+10].y,60,60,CHARTREUSE,125);
  if i_d > 10 then if (plato[i_d-10].p.identif = 0) and highlightDepart(plato,i_d,i_d-10) then gFillRectAlpha(plato[i_d-10].x,plato[i_d-10].y,60,60,CHARTREUSE,125);
  if i_d < 88 then if (plato[i_d+11].p.identif = 0) and highlightDepart(plato,i_d,i_d+11) then gFillRectAlpha(plato[i_d+11].x,plato[i_d+11].y,60,60,CHARTREUSE,125);
  if i_d > 11 then if (plato[i_d-11].p.identif = 0) and highlightDepart(plato,i_d,i_d-11) then gFillRectAlpha(plato[i_d-11].x,plato[i_d-11].y,60,60,CHARTREUSE,125);
end;
//FAIRE APPARAITRE TOUT LES SAUTS POSSIBLES ET FAIRE QU'UN TOUR POUR LE SAUT

procedure highlight(plato : plateauDyn;i_d : integer);
begin
	gFillRectAlpha(plato[i_d].x,plato[i_d].y,60,60,WHITE,125);
  if plato[i_d].p.identif = 1 then highlightCarre(plato,i_d);
  if plato[i_d].p.identif = 2 then highlightTriangle(plato,i_d);
	if plato[i_d].p.identif = 3 then highlightLosange(plato,i_d);
  if plato[i_d].p.identif = 4 then highlightCercle(plato,i_d);
end;

end.
