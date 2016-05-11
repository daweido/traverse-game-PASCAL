unit widget;

interface

uses gLib2D,SDL_TTF,sysutils;

procedure joueur12;

Implementation

procedure joueur12;
var
	text : gImage;
	font : PTTF_Font;
begin
	font := TTF_OpenFont('font.ttf', 40);
	text := gTextLoad('Joueur 1',font,1);
	gBlit(450,675,text,text^.w,text^.h);
end;

end.
