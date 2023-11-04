_ctr = true;
while {true} do {
	if ((playerSide == west) && (lifeState player) == "INCAPACITATED") then {
		hint "Bewustlos";
		_ctr = false;
		hint "Debugging - Spectator West";
		["Initialize", [player, [west], true, false, false, true, false, true, true, true]] call BIS_fnc_EGSpectator;
		sleep 1;
	};

	if ((playerSide == east) && (lifeState player) == "INCAPACITATED") then {
		hint "Bewustlos";
		_ctr = false;
		hint "Debugging - Spectator West";
		["Initialize", [player, [east], true, false, false, true, false, true, true, true]] call BIS_fnc_EGSpectator;
		sleep 1;
	};

	waitUntil { (lifeState player) == "HEALTHY"; };
	["Terminate", [player]] call BIS_fnc_EGSpectator; 
	_ctr = true;
	//hintSilent "Debugging - waitUntil wurde übersprungen";
	sleep 1;
};
