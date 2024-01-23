_random = random 1;
switch (_random) do {

	case 0: {sideOff = west, sideDef = east};
	case 1: {sideOff = east, sideDef = west};

};
publicVariable "sideOff";
publicVariable "sideDef";
execVM "uplink\task.sqf";
execVM "uplink\off.sqf";
execVM "uplink\def.sqf";
