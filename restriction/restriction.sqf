_time = outOfMapKillTime;
["restriction is on"] remoteExec ["hint", -2];
sleep 1;
[""] remoteExec ["hint", -2];
while {_time > 0} do {

	if ((player inArea trigger1)) exitWith {}; // or (player inArea trigger2) or (player inArea trigger3)		--> wird gebraucht wenn zwei extra Trigger beim Spawnbereich -> auf Malden nur ein großer trigger
	hint _time;
	_time = _time -1;
	sleep 1;

};

if (_time == 0) then {

	player setDamage 1;
	
};