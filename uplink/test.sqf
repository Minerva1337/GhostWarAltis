initiateTime = 60;
uplinkHackingTime = 10;

uplinkATaskID = 0;
uplinkBTaskID = 99;
uplinkATaskID = uplinkATaskID + 1;
sleep initiateTime;
[true, str uplinkATaskID, [_description, _title, _waypoint], uplinkA, "CREATED", 0, true, "a", true] call BIS_fnc_taskCreate;
[str uplinkATaskID, true] call BIS_fnc_taskSetAlwaysVisible;
uplinkAActionId = [

	uplinkA, 														//Objekt
	"Activate uplink",												//Titel
	"\a3\ui_f\data\igui\cfg\actions\unloadvehicle_ca.paa",			//Icon im Idle
	"\a3\ui_f\data\igui\cfg\actions\unloadvehicle_ca.paa",			//Icon bei Benutzung
	"player distance uplinkA < 5",									//damit die Akrion angezeigt wird
	"player distance uplinkA < 3",									//damit die Aktion Ausgeführt werden kann
	{

		_uplinkBActionId = missionNamespace getVariable "uplinkBActionId";
		[uplinkB, _uplinkBActionId] remoteExec ["BIS_fnc_holdActionRemove", 0];
		[str uplinkBTaskID, true, true] call BIS_fnc_deleteTask;
		
	}, //wird ausgeführt wenn Tätigkeit startet

	{}, //Ausgeführt für jeden Tick bei Tätigkeit

	{	

		params ["_target", "_caller", "_actionId", "_arguments"];
		[uplinkA, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0];
		[str watchtowerTaskID, true, true] call BIS_fnc_deleteTask;
	
	}, // Ausgeführt wenn Aktion abgeschlossen

	{}, // Ausgeführt wenn Aktion abgebrochen

	[],
	uplinkHackingTime,
	0,
	true,
	false

] remoteExec ["bis_fnc_holdactionadd", west];
publicVariable "uplinkAActionId";


uplinkBTaskID = uplinkBTaskID + 1;
[true, str uplinkBTaskID, [_description, _title, _waypoint], uplinkB, "CREATED", 0, true, "b", true] call BIS_fnc_taskCreate;
[str uplinkBTaskID, true] call BIS_fnc_taskSetAlwaysVisible;
uplinkBActionId = 

publicVariable "uplinkBActionId";