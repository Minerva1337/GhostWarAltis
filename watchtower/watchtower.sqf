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
		sound = playSound3D [getMissionPath "sounds\watchtower\laptopHacking.ogg", laptop];		
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

	{	params ["_target", "_caller", "_actionId", "_arguments"];
		hackingInProgress = false;
		watchtowerAvailable = false;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		stopSound sound;
		["finish"] remoteExec ["playSound", 0, true];
		_p5 = ((str _caller) isEqualTo "p5");
		_p6 = ((str _caller) isEqualTo "p6");
		_p7 = ((str _caller) isEqualTo "p7");
		_p8 = ((str _caller) isEqualTo "p8");
		if (_p5 or _p6 or _p7 or _p8) then {[[], "watchtower\marking\markingEast.sqf"] remoteExec ["execVM", 0]} else {[[], "watchtower\marking\markingWest.sqf"] remoteExec ["execVM", 0]};
		[tsk, "SUCCEEDED", true] remoteExec ["BIS_fnc_taskSetState", 0, true];	
		sleep 1;
		[tsk, true, true] remoteExec ["BIS_fnc_deleteTask", 0, true];
		watchtowerActionID = _actionId;
		publicVariable "watchtowerActionID";
		nul = execVM "watchtower\sleep.sqf";
	}, // Ausgeführt wenn Aktion abgeschlossen

	{	hackingInProgress = false;
		watchtowerAvailable = true;
		publicVariable "hackingInProgress";
		publicVariable "watchtowerAvailable";
		stopSound sound;
		["Hacking abgebrochen"] remoteExec ["hintSilent", 0, true];
		sleep 1;
		[""] remoteExec ["hintSilent", 0, true];
		
	}, // Ausgeführt wenn Aktion abgebrochen

	[],
	watchtowerHackingTime,
	0,
	false,
	false

] remoteExec ["bis_fnc_holdactionadd", 0, true];

["Watchtower is now available"] remoteExec ["hint", 0, true];
sleep 2;
[""] remoteExec ["hintSilent", 0, true];


