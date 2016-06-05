unit paused;

interface
uses gLib2D;

procedure drawMenuPause;

Implementation

procedure loadPause(var pauseMenu : gImage);
begin
	pauseMenu := gTexLoad('pause.png');
	gBeginRects(pauseMenu);
		gSetCoordMode(G_CENTER);
		gSetScaleWH(500,375);
		gSetCoord(G_SCR_W div 2,G_SCR_H div 2);
		gAdd();
	gEnd();
end;

procedure drawMenuPause;
var
	pauseMenu : gImage;
begin
	gFillRectAlpha(0, 0, 1000, 750,BLACK,125);
	loadPause(pauseMenu);
end;

end.
