_title = "Watchtower";
_description = "Hack the watchtower to get information about the position of the opposing players!";
_waypoint = "";


_tsk = format ["tsk%1", random 9999999];
sleep watchtowerInitiate;
_task1 = [true, _tsk, [_description, _title, _waypoint], laptop, "ASSIGNED", 0, true, "download", true] call BIS_fnc_taskCreate, [_tsk, true] call BIS_fnc_taskSetAlwaysVisible;

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
		keyboardSound = playSound3D [getMissionPath "sounds\watchtower\laptopHacking.ogg", laptop];
		publicVariable "keyboardSound";
		{

			playSound "watchtower" spawn { 
			
				waitUntil {

						sleep 0.5;
						hackingInProgress = missionNamespace getVariable "hackingInProgress";
						hackingInProgress == false;

				};
				deleteVehicle _this;
			
			};
			
		} remoteExec ["call", -2];
		
	}, //wird ausgeführt wenn Tätigkeit startet

	{}, //Ausgeführt für jeden Tick bei Tätigkeit

	{	

		params ["_target", "_caller", "_actionId", "_arguments"];
		hackingInProgress = false;
		watchtowerAvailable = false;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		{keyboardSound} remoteExec ["stopSound", -2];
		["finish"] remoteExec ["playSound", -2];
		[laptop, _actionId] remoteExec ["BIS_fnc_holdActionRemove", -2];
		[_tsk, true, true] remoteExec ["BIS_fnc_deleteTask", -2];
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

] remoteExec ["bis_fnc_holdactionadd", -2, true];

["Watchtower is now available"] remoteExec ["hint", -2];
sleep 2;
[""] remoteExec ["hintSilent", -2];


