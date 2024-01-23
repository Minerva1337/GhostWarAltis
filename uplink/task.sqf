uplinkATaskID = 0;
uplinkBTaskID = 99;
uplinkATaskID = uplinkATaskID + 1;
uplinkBTaskID = uplinkBTaskID + 1;
isHacking = "x";
publicVariable "isHacking";
[true, str uplinkATaskID, [_description, _title, _waypoint], uplinkA, "CREATED", 0, true, "a", true] call BIS_fnc_taskCreate;
[true, str uplinkBTaskID, [_description, _title, _waypoint], uplinkB, "CREATED", 0, true, "b", true] call BIS_fnc_taskCreate;
while {true} do {

	isHacking = missionNamespace getVariable "isHacking"; // States a, b and x
	switch (isHacking) do {

		case "a": {[str uplinkBTaskID, true, true] call BIS_fnc_deleteTask};
		case "b": {[str uplinkATaskID, true, true] call BIS_fnc_deleteTask};
		case "x": {switch (false) do {

					case ([str uplinkATaskID] call BIS_fnc_taskExists): {
						
						uplinkATaskID = uplinkATaskID + 1;
						[true, str uplinkATaskID, [_description, _title, _waypoint], uplinkA, "CREATED", 0, true, "a", true] call BIS_fnc_taskCreate;
					
					};
					case ([str uplinkBTaskID] call BIS_fnc_taskExists): { 

						uplinkATaskID = uplinkATaskID + 1;
						[true, str uplinkBTaskID, [_description, _title, _waypoint], uplinkB, "CREATED", 0, true, "b", true] call BIS_fnc_taskCreate;

					};};

				};
		
	};
	sleep 0.5;

};
