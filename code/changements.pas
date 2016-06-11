unit changements;
Interface
uses highlights;
procedure changement(var plato : plateauDyn;i_d,i_a : integer);

Implementation
procedure changement(var plato : plateauDyn;i_d,i_a : integer);
begin
	plato[i_a].p.identif := plato[i_d].p.identif;
	plato[i_a].p.clr := plato[i_d].p.clr;
	plato[i_d].p.identif := 0;
	plato[i_d].p.clr := 0;
end;
end.
