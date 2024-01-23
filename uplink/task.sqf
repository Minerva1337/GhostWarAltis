uplinkATaskID = 0;
uplinkBTaskID = 99;
uplinkATaskID = uplinkATaskID + 1;
uplinkBTaskID = uplinkBTaskID + 1;
[true, str uplinkATaskID, [_description, _title, _waypoint], uplinkA, "CREATED", 0, true, "a", true] call BIS_fnc_taskCreate;
[true, str uplinkBTaskID, [_description, _title, _waypoint], uplinkB, "CREATED", 0, true, "b", true] call BIS_fnc_taskCreate;
while {true} do {

	_isHacking = missionNamespace getVariable "isHacking"; // States A, B and X
	switch (_isHacking) do {

		case A: {[str uplinkBTaskID, true, true] call BIS_fnc_deleteTask};
		case B: {[str uplinkATaskID, true, true] call BIS_fnc_deleteTask};
		case X: {switch (false) do {

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
