_time = outOfMapKillTime;
while {_time > 0} do {

	if ((player inArea trigger1) or (player inArea trigger2) or (player inArea trigger3)) exitWith {};
	hint _time;
	_time = _time -1;
	sleep 1;

};

if (_time == 0) then {

	player setDamage 1;
	
};