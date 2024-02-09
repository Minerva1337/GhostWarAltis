_title = "Watchtower";
_description = "Hack the watchtower to get information about the position of the opposing players!";
_waypoint = "";
watchtowerTaskID = watchtowerTaskID + 1;
publicVariable "watchtowerTaskID";
[true, str watchtowerTaskID, [_description, _title, _waypoint], [laptop, true], "ASSIGNED", 0, true, "download", true] call BIS_fnc_taskCreate;
[str watchtowerTaskID, true] call BIS_fnc_taskSetAlwaysVisible;
watchtowerAvailable = true;
publicVariable "watchtowerAvailable";
[

	laptop, 														//Objekt
	"Activate watchtower",											//Titel
	"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",	//Icon im Idle
	"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",	//Icon bei Benutzung
	"player distance laptop < 5",									//damit die Akrion angezeigt wird
	"player distance laptop < 3",									//damit die Aktion Ausgeführt werden kann

	{

		hackingInProgress = true;
		watchtowerAvailable = false;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		{

			playSound "watchtower" spawn { 
			
				waitUntil {

						sleep 0.5;
						_hackingInProgress = missionNamespace getVariable "hackingInProgress";
						_hackingInProgress == false;

				};
				deleteVehicle _this;
			
			};
			
		} remoteExec ["call", 0];
		
	}, //wird ausgeführt wenn Tätigkeit startet

	{}, //Ausgeführt für jeden Tick bei Tätigkeit

	{	

		params ["_target", "_caller", "_actionId", "_arguments"];
		hackingInProgress = false;
		watchtowerAvailable = false;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		[laptop, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0];
		watchtowerTaskID = missionNamespace getVariable "watchtowerTaskID";
		[str watchtowerTaskID, true, true] call BIS_fnc_deleteTask;
		if (_caller in [p5, p6, p7, p8]) then {

			[[], "watchtower\marking\markingEast.sqf"] remoteExec ["execVM", 2];
			[[], "ui\watchtowerMarking.sqf"] remoteExec ["execVM", west];
			[[], "ui\watchtowerMarked.sqf"] remoteExec ["execVM", east];

		} else {

			[[], "watchtower\marking\markingWest.sqf"] remoteExec ["execVM", 2];
			[[], "ui\watchtowerMarking.sqf"] remoteExec ["execVM", east];
			[[], "ui\watchtowerMarked.sqf"] remoteExec ["execVM", west];

		};
		[[], "watchtower\sleep.sqf"] remoteExec ["execVM", 2];
	
	}, // Ausgeführt wenn Aktion abgeschlossen

	{	

		hackingInProgress = false;
		watchtowerAvailable = true;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		
	}, // Ausgeführt wenn Aktion abgebrochen

	[],
	watchtowerHackingTime,
	0,
	true,
	false

] remoteExec ["bis_fnc_holdactionadd", 0];