unit loadImages;
interface
uses gLib2D,SDL;

TYPE
	mes = array[1..10] of gImage;
	pp = array[1..4] of gImage;
TYPE images = record
	menus : mes;
	J1Full,J1Alpha,J2Full,J2Alpha,J3Full,J3Alpha,J4Full,J4Alpha : pp;
	end;

procedure chargerImages(VAR theme1,theme2,theme3 : images);

Implementation

procedure chargeTheme1(VAR theme1 : images);
begin
	theme1.menus[1] := gTexLoad('./images/theme1/menus/menu.png');
	theme1.menus[2] := gTexLoad('./images/theme1/menus/commentJouer.png');
	theme1.menus[3] := gTexLoad('./images/theme1/menus/reglages.png');
	theme1.menus[4] := gTexLoad('./images/theme1/menus/jouer.png');
	theme1.menus[5] := gTexLoad('./images/theme1/menus/nouvellePartie.png');
	theme1.menus[6] := gTexLoad('./images/theme1/menus/pause.png');
	theme1.menus[7] := gTexLoad('./images/theme1/menus/finDePartieJ1.png');
	theme1.menus[8] := gTexLoad('./images/theme1/menus/finDePartieJ2.png');
	theme1.menus[9] := gTexLoad('./images/theme1/menus/finDePartieJ3.png');
	theme1.menus[10] := gTexLoad('./images/theme1/menus/finDePartieJ4.png');

	theme1.J1Full[1] := gTexLoad('./images/theme1/J1/sqr_blue.png');
	theme1.J1Full[2] := gTexLoad('./images/theme1/J1/tri_blue.png');
	theme1.J1Full[3] := gTexLoad('./images/theme1/J1/lo_blue.png');
	theme1.J1Full[4] := gTexLoad('./images/theme1/J1/cir_blue.png');
	theme1.J1Alpha[1] := gTexLoad('./images/theme1/J1/sqr_blue_alpha.png');
	theme1.J1Alpha[2] := gTexLoad('./images/theme1/J1/tri_blue_alpha.png');
	theme1.J1Alpha[3] := gTexLoad('./images/theme1/J1/lo_blue_alpha.png');
	theme1.J1Alpha[4] := gTexLoad('./images/theme1/J1/cir_blue_alpha.png');

	theme1.J2Full[1] := gTexLoad('./images/theme1/J2/sqr_red.png');
	theme1.J2Full[2] := gTexLoad('./images/theme1/J2/tri_red.png');
	theme1.J2Full[3] := gTexLoad('./images/theme1/J2/lo_red.png');
	theme1.J2Full[4] := gTexLoad('./images/theme1/J2/cir_red.png');
	theme1.J2Alpha[1] := gTexLoad('./images/theme1/J2/sqr_red_alpha.png');
	theme1.J2Alpha[2] := gTexLoad('./images/theme1/J2/tri_red_alpha.png');
	theme1.J2Alpha[3] := gTexLoad('./images/theme1/J2/lo_red_alpha.png');
	theme1.J2Alpha[4] := gTexLoad('./images/theme1/J2/cir_red_alpha.png');

	theme1.J3Full[1] := gTexLoad('./images/theme1/J3/sqr_green.png');
	theme1.J3Full[2] := gTexLoad('./images/theme1/J3/tri_green.png');
	theme1.J3Full[3] := gTexLoad('./images/theme1/J3/lo_green.png');
	theme1.J3Full[4] := gTexLoad('./images/theme1/J3/cir_green.png');
	theme1.J3Alpha[1] := gTexLoad('./images/theme1/J3/sqr_green_alpha.png');
	theme1.J3Alpha[2] := gTexLoad('./images/theme1/J3/tri_green_alpha.png');
	theme1.J3Alpha[3] := gTexLoad('./images/theme1/J3/lo_green_alpha.png');
	theme1.J3Alpha[4] := gTexLoad('./images/theme1/J3/cir_green_alpha.png');

	theme1.J4Full[1] := gTexLoad('./images/theme1/J4/sqr_purple.png');
	theme1.J4Full[2] := gTexLoad('./images/theme1/J4/tri_purple.png');
	theme1.J4Full[3] := gTexLoad('./images/theme1/J4/lo_purple.png');
	theme1.J4Full[4] := gTexLoad('./images/theme1/J4/cir_purple.png');
	theme1.J4Alpha[1] := gTexLoad('./images/theme1/J4/sqr_purple_alpha.png');
	theme1.J4Alpha[2] := gTexLoad('./images/theme1/J4/tri_purple_alpha.png');
	theme1.J4Alpha[3] := gTexLoad('./images/theme1/J4/lo_purple_alpha.png');
	theme1.J4Alpha[4] := gTexLoad('./images/theme1/J4/cir_purple_alpha.png');
end;

procedure chargeTheme2(VAR theme2 : images);
begin
	theme2.menus[1] := gTexLoad('./images/theme2/menus/menu.png');
	theme2.menus[2] := gTexLoad('./images/theme2/menus/commentJouer.png');
	theme2.menus[3] := gTexLoad('./images/theme2/menus/reglages.png');
	theme2.menus[4] := gTexLoad('./images/theme2/menus/jouer.png');
	theme2.menus[5] := gTexLoad('./images/theme2/menus/nouvellePartie.png');
	theme2.menus[6] := gTexLoad('./images/theme2/menus/pause.png');
	theme2.menus[7] := gTexLoad('./images/theme2/menus/finDePartieJ1.png');
	theme2.menus[8] := gTexLoad('./images/theme2/menus/finDePartieJ2.png');
	theme2.menus[9] := gTexLoad('./images/theme2/menus/finDePartieJ3.png');
	theme2.menus[10] := gTexLoad('./images/theme2/menus/finDePartieJ4.png');

	theme2.J1Full[1] := gTexLoad('./images/theme2/J1/sqr_blue.png');
	theme2.J1Full[2] := gTexLoad('./images/theme2/J1/tri_blue.png');
	theme2.J1Full[3] := gTexLoad('./images/theme2/J1/lo_blue.png');
	theme2.J1Full[4] := gTexLoad('./images/theme2/J1/cir_blue.png');
	theme2.J1Alpha[1] := gTexLoad('./images/theme2/J1/sqr_blue_alpha.png');
	theme2.J1Alpha[2] := gTexLoad('./images/theme2/J1/tri_blue_alpha.png');
	theme2.J1Alpha[3] := gTexLoad('./images/theme2/J1/lo_blue_alpha.png');
	theme2.J1Alpha[4] := gTexLoad('./images/theme2/J1/cir_blue_alpha.png');

	theme2.J2Full[1] := gTexLoad('./images/theme2/J2/sqr_red.png');
	theme2.J2Full[2] := gTexLoad('./images/theme2/J2/tri_red.png');
	theme2.J2Full[3] := gTexLoad('./images/theme2/J2/lo_red.png');
	theme2.J2Full[4] := gTexLoad('./images/theme2/J2/cir_red.png');
	theme2.J2Alpha[1] := gTexLoad('./images/theme2/J2/sqr_red_alpha.png');
	theme2.J2Alpha[2] := gTexLoad('./images/theme2/J2/tri_red_alpha.png');
	theme2.J2Alpha[3] := gTexLoad('./images/theme2/J2/lo_red_alpha.png');
	theme2.J2Alpha[4] := gTexLoad('./images/theme2/J2/cir_red_alpha.png');

	theme2.J3Full[1] := gTexLoad('./images/theme2/J3/sqr_green.png');
	theme2.J3Full[2] := gTexLoad('./images/theme2/J3/tri_green.png');
	theme2.J3Full[3] := gTexLoad('./images/theme2/J3/lo_green.png');
	theme2.J3Full[4] := gTexLoad('./images/theme2/J3/cir_green.png');
	theme2.J3Alpha[1] := gTexLoad('./images/theme2/J3/sqr_green_alpha.png');
	theme2.J3Alpha[2] := gTexLoad('./images/theme2/J3/tri_green_alpha.png');
	theme2.J3Alpha[3] := gTexLoad('./images/theme2/J3/lo_green_alpha.png');
	theme2.J3Alpha[4] := gTexLoad('./images/theme2/J3/cir_green_alpha.png');

	theme2.J4Full[1] := gTexLoad('./images/theme2/J4/sqr_purple.png');
	theme2.J4Full[2] := gTexLoad('./images/theme2/J4/tri_purple.png');
	theme2.J4Full[3] := gTexLoad('./images/theme2/J4/lo_purple.png');
	theme2.J4Full[4] := gTexLoad('./images/theme2/J4/cir_purple.png');
	theme2.J4Alpha[1] := gTexLoad('./images/theme2/J4/sqr_purple_alpha.png');
	theme2.J4Alpha[2] := gTexLoad('./images/theme2/J4/tri_purple_alpha.png');
	theme2.J4Alpha[3] := gTexLoad('./images/theme2/J4/lo_purple_alpha.png');
	theme2.J4Alpha[4] := gTexLoad('./images/theme2/J4/cir_purple_alpha.png');
end;

procedure chargeTheme3(VAR theme3 : images);
begin
	theme3.menus[1] := gTexLoad('./images/theme3/menus/menu.png');
	theme3.menus[2] := gTexLoad('./images/theme3/menus/commentJouer.png');
	theme3.menus[3] := gTexLoad('./images/theme3/menus/reglages.png');
	theme3.menus[4] := gTexLoad('./images/theme3/menus/jouer.png');
	theme3.menus[5] := gTexLoad('./images/theme3/menus/nouvellePartie.png');
	theme3.menus[6] := gTexLoad('./images/theme3/menus/pause.png');
	theme3.menus[7] := gTexLoad('./images/theme3/menus/finDePartieJ1.png');
	theme3.menus[8] := gTexLoad('./images/theme3/menus/finDePartieJ2.png');
	theme3.menus[9] := gTexLoad('./images/theme3/menus/finDePartieJ3.png');
	theme3.menus[10] := gTexLoad('./images/theme3/menus/finDePartieJ4.png');

	theme3.J1Full[1] := gTexLoad('./images/theme3/J1/sqr_blue.png');
	theme3.J1Full[2] := gTexLoad('./images/theme3/J1/tri_blue.png');
	theme3.J1Full[3] := gTexLoad('./images/theme3/J1/lo_blue.png');
	theme3.J1Full[4] := gTexLoad('./images/theme3/J1/cir_blue.png');
	theme3.J1Alpha[1] := gTexLoad('./images/theme3/J1/sqr_blue_alpha.png');
	theme3.J1Alpha[2] := gTexLoad('./images/theme3/J1/tri_blue_alpha.png');
	theme3.J1Alpha[3] := gTexLoad('./images/theme3/J1/lo_blue_alpha.png');
	theme3.J1Alpha[4] := gTexLoad('./images/theme3/J1/cir_blue_alpha.png');

	theme3.J2Full[1] := gTexLoad('./images/theme3/J2/sqr_red.png');
	theme3.J2Full[2] := gTexLoad('./images/theme3/J2/tri_red.png');
	theme3.J2Full[3] := gTexLoad('./images/theme3/J2/lo_red.png');
	theme3.J2Full[4] := gTexLoad('./images/theme3/J2/cir_red.png');
	theme3.J2Alpha[1] := gTexLoad('./images/theme3/J2/sqr_red_alpha.png');
	theme3.J2Alpha[2] := gTexLoad('./images/theme3/J2/tri_red_alpha.png');
	theme3.J2Alpha[3] := gTexLoad('./images/theme3/J2/lo_red_alpha.png');
	theme3.J2Alpha[4] := gTexLoad('./images/theme3/J2/cir_red_alpha.png');

	theme3.J3Full[1] := gTexLoad('./images/theme3/J3/sqr_green.png');
	theme3.J3Full[2] := gTexLoad('./images/theme3/J3/tri_green.png');
	theme3.J3Full[3] := gTexLoad('./images/theme3/J3/lo_green.png');
	theme3.J3Full[4] := gTexLoad('./images/theme3/J3/cir_green.png');
	theme3.J3Alpha[1] := gTexLoad('./images/theme3/J3/sqr_green_alpha.png');
	theme3.J3Alpha[2] := gTexLoad('./images/theme3/J3/tri_green_alpha.png');
	theme3.J3Alpha[3] := gTexLoad('./images/theme3/J3/lo_green_alpha.png');
	theme3.J3Alpha[4] := gTexLoad('./images/theme3/J3/cir_green_alpha.png');

	theme3.J4Full[1] := gTexLoad('./images/theme3/J4/sqr_purple.png');
	theme3.J4Full[2] := gTexLoad('./images/theme3/J4/tri_purple.png');
	theme3.J4Full[3] := gTexLoad('./images/theme3/J4/lo_purple.png');
	theme3.J4Full[4] := gTexLoad('./images/theme3/J4/cir_purple.png');
	theme3.J4Alpha[1] := gTexLoad('./images/theme3/J4/sqr_purple_alpha.png');
	theme3.J4Alpha[2] := gTexLoad('./images/theme3/J4/tri_purple_alpha.png');
	theme3.J4Alpha[3] := gTexLoad('./images/theme3/J4/lo_purple_alpha.png');
	theme3.J4Alpha[4] := gTexLoad('./images/theme3/J4/cir_purple_alpha.png');
end;

procedure chargerImages(VAR theme1,theme2,theme3 : images);
begin
	chargeTheme1(theme1);
	chargeTheme2(theme2);
	chargeTheme3(theme3);
end;

end.
