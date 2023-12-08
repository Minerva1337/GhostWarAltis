_title = "Watchtower";
_description = "Hack the watchtower to get information about the position of the opposing players!";
_waypoint = "";


tsk = format ["tsk%1", random 9999999];
publicVariable "tsk";	//macht, dass sowol der Server als auch der client Zugriff auf die Variable hat

sleep watchtowerInitiate;

_task1 = [true, tsk, [_description, _title, _waypoint], laptop, "ASSIGNED", 0, true, "download", true] call BIS_fnc_taskCreate, [tsk, "download"] call BIS_fnc_taskSetType, [tsk, true] call BIS_fnc_taskSetAlwaysVisible;
a0 = 0;

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
			
		} remoteExec ["call", 0];
		
	}, //wird ausgeführt wenn Tätigkeit startet

	{}, //Ausgeführt für jeden Tick bei Tätigkeit

	{	

		params ["_target", "_caller", "_actionId", "_arguments"];
		hackingInProgress = false;
		watchtowerAvailable = false;
		watchtowerActionID = _actionId;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		publicVariable "watchtowerActionID";
		{stopSound keyboardSound} remoteExec ["call", 0];
		["finish"] remoteExec ["playSound", 0, true];
		[laptop, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
		[tsk, true, true] remoteExec ["BIS_fnc_deleteTask", 0, true];
		if ((_caller == p5) or (_caller == p6) or (_caller == p7) or (_caller == p8)) then {

			//[[], "watchtower\marking\markingEast.sqf"] remoteExec ["execVM", 0];
			["watchtower\marking\markingEast.sqf"] remoteExec ["execVM", 0];
			[[], "ui\watchtowerMarking.sqf"] remoteExec ["execVM", west];
			[[], "ui\watchtowerMarked.sqf"] remoteExec ["execVM", east];

		} else {

			[[], "watchtower\marking\markingWest.sqf"] remoteExec ["execVM", 0];
			[[], "ui\watchtowerMarking.sqf"] remoteExec ["execVM", east];
			[[], "ui\watchtowerMarked.sqf"] remoteExec ["execVM", west];

		};

		[[], "watchtower\sleep.sqf"] remoteExec ["execVM", 0]
	
	}, // Ausgeführt wenn Aktion abgeschlossen

	{	

		hackingInProgress = false;
		watchtowerAvailable = true;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		{stopSound sound} remoteExec ["call", 0];
		
	}, // Ausgeführt wenn Aktion abgebrochen

	[],
	watchtowerHackingTime,
	0,
	true,
	false

] remoteExec ["bis_fnc_holdactionadd", 0, true];

["Watchtower is now available"] remoteExec ["hint", 0, true];
sleep 2;
[""] remoteExec ["hintSilent", 0, true];


