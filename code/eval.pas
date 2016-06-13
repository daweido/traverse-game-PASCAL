unit eval;

interface
uses highlights;
const
	val_cer = 1;
	val_car = 1.25;
	val_tri = 1.5;
	val_los = 1.75;

function parcourToutTableau(plato : plateauDyn): real;

Implementation

//Fonction d'évaluation
//Si entourage non vide, alors regarder la nature du pion et voir si il peut nous sauter ou non.
//Passer les conditions d'entourage dans une fonction boolenne et qui ressort un boolean inclus avec sautable ou non. fonction pour joueur1 et 2 sont différentes.


function sautable1(i : integer;plato : plateauDyn): boolean;
var
	sauta : boolean;
begin
	sauta := false;
	if (i-11 >= 0) and (not sauta) then begin
		if (((plato[i-11].p.identif = 2) or (plato[i-11].p.identif = 3) or (plato[i-11].p.identif = 4)) and (plato[i-11].p.clr = 2)) then sauta := true;
	end;

	if (i-10 >= 0) and (not sauta) then begin
		if (((plato[i-10].p.identif = 1) or (plato[i-10].p.identif = 4)) and (plato[i-10].p.clr = 2)) then sauta := true;
	end;

	if (i-9 >= 0) and (not sauta) then begin
		if (((plato[i-9].p.identif = 2) or (plato[i-9].p.identif = 3) or (plato[i-9].p.identif = 4)) and (plato[i-9].p.clr = 2)) then sauta := true;
	end;

	if (i-1 >= 0) and (not sauta) then begin
		if (((plato[i-1].p.identif = 1) or (plato[i-1].p.identif = 4)) and (plato[i-1].p.clr = 2)) then sauta := true;
	end;

	if (i+1 <= 99) and (not sauta) then begin
		if (((plato[i+1].p.identif = 1) or (plato[i+1].p.identif = 4)) and (plato[i+1].p.clr = 2))  then sauta := true;
	end;

	sautable1 := sauta;
end;

function sautable2(i : integer;plato : plateauDyn): boolean;
var
	sauta : boolean;
begin
	sauta := false;
	if (i+11 <= 99) and (not sauta) then begin
		if (((plato[i+11].p.identif = 2) or (plato[i+11].p.identif = 3) or (plato[i+11].p.identif = 4)) and (plato[i+11].p.clr =1)) then sauta := true;
	end;

	if (i+10 <= 99) and (not sauta) then begin
		if (((plato[i+10].p.identif = 1) or (plato[i+10].p.identif = 4)) and (plato[i+10].p.clr =1)) then sauta := true;
	end;

	if (i+9 <= 99) and (not sauta) then begin
		if (((plato[i+9].p.identif = 2) or (plato[i+9].p.identif = 3) or (plato[i+9].p.identif = 4)) and (plato[i+9].p.clr =1)) then sauta := true;
	end;

	if (i+1 <= 99) and (not sauta) then begin
		if (((plato[i+1].p.identif = 1) or (plato[i+1].p.identif = 4)) and (plato[i+1].p.clr =1)) then sauta := true;
	end;

	if (i-1 >= 0) and (not sauta) then begin
		if (((plato[i-1].p.identif = 1) or (plato[i-1].p.identif = 4)) and (plato[i-1].p.clr =1)) then sauta := true;
	end;

	sautable2 := sauta;
end;

function evalDep_car1(plato : plateauDyn;i : integer): real;
var
	res : real;
begin
	res := 0;
		if (plato[i-10].p.identif = 0) then begin
			if sautable1(i-10,plato) then res += 0
			else res += 1;
		end;

		if (((i > 20) and (plato[i-20].p.identif = 0)) and (plato[i-10].p.identif <> 0)) then begin
			if sautable1(i-20,plato) then res += 0
			else res += 2;
		end;
	evalDep_car1 := res;
end;

function evalDep_car2(plato : plateauDyn;i : integer): real;
var
	res : real;
begin
	res := 0;
		if (plato[i+10].p.identif = 0) then begin
			if sautable2(i+10,plato) then res += 0
			else res += 1;
		end;

		if (((i < 79) and (plato[i+20].p.identif = 0)) and (plato[i+10].p.identif <> 0)) then begin
			if sautable2(i+20,plato) then res += 0
			else res += 2;
		end;
	evalDep_car2 := res;
end;

function evalDep_tri1(plato : plateauDyn;i : integer): real;
var
	res : real;
begin
	res := 0;
		if (plato[i-9].p.identif = 0) then begin
			if sautable1(i-9,plato) then res += 0
			else res += 1;
		end;


		if (plato[i-11].p.identif = 0) then begin
			if sautable1(i-11,plato) then res += 0
			else res += 1;
		end;

		if ((plato[i-9].p.identif <> 0) and ((i > 18) and (plato[i-18].p.identif = 0))) then begin
			if sautable1(i-18,plato) then res += 0
			else res += 2;
		end;

			if ((plato[i-11].p.identif <> 0) and ((i > 22) and (plato[i-22].p.identif = 0))) then begin
				if sautable1(i-22,plato) then res += 0
				else res += 2;
			end;
	evalDep_tri1 := res;
end;

function evalDep_tri2(plato : plateauDyn;i : integer): real;
var
	res : real;
begin
	res := 0;
	if (plato[i+9].p.identif = 0) then begin
		if sautable2(i+9,plato) then res += 0
		else res += 1;
	end;

	if (plato[i+11].p.identif = 0) then begin
		if sautable2(i+11,plato) then res += 0
		else res += 1;
	end;

	if ((plato[i+9].p.identif <> 0) and ((i < 81) and (plato[i+18].p.identif = 0))) then begin
		if sautable2(i+18,plato) then res += 0
		else res += 2;
	end;

	if ((plato[i+11].p.identif <> 0) and ((i < 77) and (plato[i+22].p.identif = 0))) then begin
		if sautable2(i+22,plato) then res += 0
		else res += 2;
	end;
evalDep_tri2 := res;
end;

function evalDep_los1(plato : plateauDyn;i : integer): real;
var
	res : real;
begin
	res := 0;
	if (plato[i-11].p.identif = 0) then begin
		if sautable1(i-11,plato) then res += 0
		else res += 1;
	end;

	if (plato[i-9].p.identif = 0) then begin
		if sautable1(i-9,plato) then res += 0
		else res += 1;
	end;

	if ((plato[i-9].p.identif <> 0) and ((i > 18) and (plato[i-18].p.identif = 0))) then begin
		if sautable1(i-18,plato) then res += 0
		else res += 2;
	end;

	if ((plato[i-11].p.identif <> 0) and ((i > 22) and (plato[i-22].p.identif = 0))) then begin
		if sautable1(i-22,plato) then res += 0
		else res += 2;
	end;
	evalDep_los1 := res;
end;

function evalDep_los2(plato : plateauDyn;i : integer): real;
var
	res : real;
begin
	res := 0;

	if (plato[i+11].p.identif = 0) then begin
		if sautable2(i+11,plato) then res += 0
		else res += 1;
	end;

	if (plato[i+9].p.identif = 0) then begin
		if sautable2(i+9,plato) then res += 0
		else res += 1;
	end;

	if ((plato[i+9].p.identif <> 0) and ((i < 81) and (plato[i+18].p.identif = 0))) then begin
		if sautable2(i+18,plato) then res += 0
		else res += 2;
	end;

	if ((plato[i+11].p.identif <> 0) and ((i < 77) and (plato[i+22].p.identif = 0))) then begin
		if sautable2(i+22,plato) then res += 0
		else res += 2;
	end;

evalDep_los2 := res;
end;

function evalDep_cer1(plato : plateauDyn;i : integer):real;
var
	res : real;
begin
	res := 0;
	if (plato[i-11].p.identif = 0) then begin
		if sautable1(i-11,plato) then res += 0
		else res += 1;
	end;

	if (plato[i-9].p.identif = 0) then begin
		if sautable1(i-9,plato) then res += 0
		else res += 1;
	end;

	if (plato[i-10].p.identif = 0) then begin
		if sautable1(i-10,plato) then res += 0
		else res += 1;
	end;

	if ((plato[i-9].p.identif <> 0) and ((i > 18) and (plato[i-18].p.identif = 0))) then begin
		if sautable1(i-18,plato) then res += 0
		else res += 2;
	end;

	if ((plato[i-11].p.identif <> 0) and ((i > 22) and (plato[i-22].p.identif = 0))) then begin
		if sautable1(i-22,plato) then res += 0
		else res += 2;
	end;

	if ((i > 20) and ((plato[i-20].p.identif = 0) and (plato[i-10].p.identif <> 0))) then begin
		if sautable1(i-20,plato) then res += 0
		else res += 1;
	end;
	evalDep_cer1 := res;
end;

function evalDep_cer2(plato : plateauDyn;i : integer):real;
var
	res : real;
begin
	res := 0;
	if (plato[i+11].p.identif = 0) then begin
		if sautable2(i+11,plato) then res += 0
		else res += 1;
	end;

	if (plato[i+9].p.identif = 0) then begin
		if sautable2(i+9,plato) then res += 0
		else res += 1;
	end;

	if (plato[i+10].p.identif = 0) then begin
		if sautable2(i+10,plato) then res += 0
		else res += 1;
	end;

	if ((plato[i+9].p.identif <> 0) and ((i < 81) and (plato[i+18].p.identif = 0))) then begin
		if sautable2(i+18,plato) then res += 0
		else res += 2;
	end;

	if ((plato[i+11].p.identif <> 0) and ((i < 77) and (plato[i+22].p.identif = 0))) then begin
		if sautable2(i+22,plato) then res += 0
		else res += 2;
	end;

	if ((i < 79) and ((plato[i+20].p.identif = 0) and (plato[i+10].p.identif <> 0))) then begin
		if sautable2(i+20,plato) then res += 0
		else res += 2;
	end;

evalDep_cer2 := res;
end;

function evalDep(plato : plateauDyn;i : integer):real;
var
	evalDep_num : real;
begin
	evalDep_num := 0;
	if plato[i].p.identif = 1 then begin
		if plato[i].p.clr = 1 then evalDep_num += evalDep_car1(plato,i);
		if plato[i].p.clr = 2 then evalDep_num += evalDep_car2(plato,i);
	end;
	if plato[i].p.identif = 2 then begin
		if plato[i].p.clr = 1 then evalDep_num += evalDep_tri1(plato,i);
		if plato[i].p.clr = 2 then evalDep_num += evalDep_tri2(plato,i);
	end;
	if plato[i].p.identif = 3 then begin
		if plato[i].p.clr = 1 then evalDep_num += evalDep_los1(plato,i);
		if plato[i].p.clr = 2 then evalDep_num += evalDep_los2(plato,i);
	end;
	if plato[i].p.identif = 4 then begin
		if plato[i].p.clr = 1 then evalDep_num += evalDep_cer1(plato,i);
		if plato[i].p.clr = 2 then evalDep_num += evalDep_cer2(plato,i);
	end;
	evalDep := evalDep_num;
end;

function evalEmp(plato : plateauDyn;i : integer): real;
var
	iMod : real;
begin
	iMod :=  i mod 10;
	if (iMod = 0) then begin
		if (plato[i].p.clr = 1) then evalEmp := 3.25;
		if (plato[i].p.clr = 2) then evalEmp := 1;
	end
	else if (iMod = 1) then begin
		if (plato[i].p.clr = 1) then evalEmp := 3;
		if (plato[i].p.clr = 2) then evalEmp := 1.25;
	end
	else if (iMod = 2) then begin
		if (plato[i].p.clr = 1) then evalEmp := 2.75;
		if (plato[i].p.clr = 2) then evalEmp := 1.5;
	end
	else if (iMod = 3) then begin
		if (plato[i].p.clr = 1) then evalEmp := 2.5;
		if (plato[i].p.clr = 2) then evalEmp := 1.75;
	end
	else if (iMod = 4) then begin
		if (plato[i].p.clr = 1) then evalEmp := 2.25;
		if (plato[i].p.clr = 2) then evalEmp := 2;
	end
	else if (iMod = 5) then begin
		if (plato[i].p.clr = 1) then evalEmp := 2;
		if (plato[i].p.clr = 2) then evalEmp := 2.25;
	end
	else if (iMod = 6) then begin
		if (plato[i].p.clr = 1) then evalEmp := 1.75;
		if (plato[i].p.clr = 2) then evalEmp := 2.5;
	end
	else if (iMod = 7) then begin
		if (plato[i].p.clr = 1) then evalEmp := 1.5;
		if (plato[i].p.clr = 2) then evalEmp := 2.75;
	end
	else if (iMod = 8) then begin
		if (plato[i].p.clr = 1) then evalEmp := 1.25;
		if (plato[i].p.clr = 2) then evalEmp := 3;
	end
	else begin
		if (plato[i].p.clr = 1) then evalEmp := 1;
		if (plato[i].p.clr = 2) then evalEmp := 3.25;
	end;
end;

function evalNat(plato : plateaudyn;i : integer):real;
begin
	if (plato[i].p.identif = 1) then evalNat := val_car
	else if (plato[i].p.identif = 2) then evalNat := val_tri
	else if (plato[i].p.identif = 3) then evalNat := val_los
	else evalNat := val_cer;
end;

function evalPion(plato : plateaudyn;i : integer): real;
var
  dep,emp,nat : real;
begin
dep := evalDep(plato,i);
emp := evalEmp(plato,i);
nat := evalNat(plato,i);
evalPion := nat*(dep+emp);
end;


function parcourToutTableau(plato : plateauDyn): real;
var
	i : integer;
	evalplato1,evalplato2,evalplat : real;
begin
	evalplato2 :=0;
	evalplato1 := 0;
	for i := 0 to 99 do begin
		if plato[i].p.clr = 1 then evalplato1 += evalPion(plato,i);
		if plato[i].p.clr = 2 then evalplato2 += evalPion(plato,i);
	end;
	evalplat := evalplato2 - evalplato1;
	writeln('Valeur plateau général : ',evalplat:5:3);
	parcourToutTableau := evalplat;
end;

end.
