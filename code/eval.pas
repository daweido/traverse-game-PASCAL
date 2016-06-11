unit eval;

interface
uses highlights;
const
	val_cer = 1;
	val_car = 1.25;
	val_tri = 1.5;
	val_los = 1.75;

procedure parcourToutTableau(plato : plateauDyn);

Implementation

//Fonction d'évaluation

function evalDep_car1(plato : plateauDyn;i : integer): integer;
var
	res : integer;
begin
	res := 0;
		if (plato[i-10].p.identif = 0) then res += 1;
		if (((i > 20) and (plato[i-20].p.identif = 0)) and (plato[i-10].p.identif <> 0)) then res += 2;
	evalDep_car1 := res;
end;

function evalDep_car2(plato : plateauDyn;i : integer): integer;
var
	res : integer;
begin
	res := 0;
		if (plato[i+10].p.identif = 0) then res += 1;
		if (((i < 79) and (plato[i+20].p.identif = 0)) and (plato[i+10].p.identif <> 0)) then res += 2;
	evalDep_car2 := res;
end;

function evalDep_tri1(plato : plateauDyn;i : integer): integer;
var
	res : integer;
begin
	res := 0;
		if ((plato[i-9].p.identif = 0) or (plato[i-11].p.identif = 0)) then res += 1;
		if (((plato[i-9].p.identif <> 0) and ((i > 18) and (plato[i-18].p.identif = 0))) or
			((plato[i-11].p.identif <> 0) and ((i > 22) and (plato[i-22].p.identif = 0)))) then res += 2;
	evalDep_tri1 := res;
end;

function evalDep_tri2(plato : plateauDyn;i : integer): integer;
var
	res : integer;
begin
	res := 0;
		if ((plato[i+9].p.identif = 0) or (plato[i+11].p.identif = 0)) then res += 1;
		if (((plato[i+9].p.identif <> 0) and ((i < 81) and (plato[i+18].p.identif = 0))) or
			((plato[i+11].p.identif <> 0)
			 and ((i < 77) and (plato[i+22].p.identif = 0)))) then res += 2;
	evalDep_tri2 := res;
end;

function evalDep_los1(plato : plateauDyn;i : integer): integer;
var
	res : integer;
begin
	res := 0;
	if ((plato[i-11].p.identif = 0) or (plato[i-9].p.identif = 0)) then res += 1;
	if (((plato[i-9].p.identif <> 0) and ((i > 18) and (plato[i-18].p.identif = 0))) or
		 ((plato[i-11].p.identif <> 0) and ((i > 22) and (plato[i-22].p.identif = 0)))) then res += 2;
	evalDep_los1 := res;
end;

function evalDep_los2(plato : plateauDyn;i : integer): integer;
var
	res : integer;
begin
	res := 0;
	if ((plato[i+11].p.identif = 0) or (plato[i+9].p.identif = 0)) then res += 1;
	if (((plato[i+9].p.identif <> 0) and ((i < 81) and (plato[i+18].p.identif = 0))) or
		 ((plato[i+11].p.identif <> 0) and ((i < 77) and (plato[i+22].p.identif = 0)))) then res += 2;
	evalDep_los2 := res;
end;

function evalDep_cer1(plato : plateauDyn;i : integer):integer;
var
	res : integer;
begin
	res := 0;
	if ((plato[i-11].p.identif = 0) or (plato[i-9].p.identif = 0) or (plato[i-10].p.identif = 0)) then res += 1;
	if (((plato[i-9].p.identif <> 0) and ((i > 18) and (plato[i-18].p.identif = 0))) or
		 ((plato[i-11].p.identif <> 0) and ((i > 22) and (plato[i-22].p.identif = 0))) or ((i > 20) and ((plato[i-20].p.identif = 0) and (plato[i-10].p.identif <> 0)))) then res += 2;
	evalDep_cer1 := res;
end;

function evalDep_cer2(plato : plateauDyn;i : integer):integer;
var
	res : integer;
begin
	res := 0;
	if ((plato[i+11].p.identif = 0) or (plato[i+9].p.identif = 0) or (plato[i+10].p.identif = 0)) then res += 1;
	if (((plato[i+9].p.identif <> 0) and ((i < 81) and (plato[i+18].p.identif = 0))) or
		 ((plato[i+11].p.identif <> 0) and ((i < 77) and (plato[i+22].p.identif = 0))) or ((i < 79) and ((plato[i+20].p.identif = 0) and (plato[i+10].p.identif <> 0)))) then res += 2;
	evalDep_cer2 := res;
end;

function evalDep(plato : plateauDyn;i : integer):integer;
var
	evalDep_num : integer;
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

procedure parcourToutTableau(plato : plateauDyn);
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
	writeln('Valeur du plateau j1 : ',evalplato1:5:3);
	writeln('Valeur du plateau j2 : ',evalplato2:5:3);
	writeln('Valeur plateau général : ',evalplat:5:3);
end;
end.
