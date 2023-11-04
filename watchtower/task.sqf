sleep 90;
[true, (str watchtowerTaskID),  ["Hack the watchtower to get information about the position of the opposing players!", "Watchtower", ""], laptop, "ASSIGNED", 1, true, "download", true] call BIS_fnc_taskCreate;
watchtowerTaskID1 = watchtowerTaskID;
watchtowerTaskID = watchtowerTaskID + 1;
/*tsk = format ["tsk%1", random 100];
publicVariable "tsk";	//macht, dass sowol der Server als auch der client Zugriff auf die Variable hat
[true, tsk,  ["Hack the watchtower to get information about the position of the opposing players!", "Watchtower", ""], laptop, "ASSIGNED", 99, true, "download", true] call BIS_fnc_taskCreate;*/

[

	laptop, 														//Objekt
	"Activate watchtower",											//Titel
	"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",	//Icon im Idle
	"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",	//Icon bei Benutzung
	"player distance laptop < 5",									//damit die Akrion angezeigt wird
	"player distance laptop < 3",									//damit die Aktion Ausgeführt werden kann

	{
		a0 = 0;
		{playSound "hacking" spawn
            {waitUntil
                {sleep 0.5;
                a0 == 1};
            deleteVehicle _this}} remoteExec ["call", 0];

	}, //wird ausgeführt wenn Tätigkeit startet

	{}, //Ausgeführt für jeden Tick bei Tätigkeit

	{	params ["_target", "_caller", "_actionId", "_arguments"];
		a0 = 1;
		["finish"] remoteExec ["playSound", 0, true];
		_p5 = ((str _caller) isEqualTo "p5");
		_p6 = ((str _caller) isEqualTo "p6");
		_p7 = ((str _caller) isEqualTo "p7");
		_p8 = ((str _caller) isEqualTo "p8");
		if (_p5 or _p6 or _p7 or _p8) then {nul = execVM "watchtower\markingEast.sqf";} else {nul = execVM "watchtower\markingWest.sqf";};
		[(str watchtowerTaskID1), "SUCCEEDED", true] remoteExec ["BIS_fnc_taskSetState", 0, true];	
		sleep 0.1;
		[(str watchtowerTaskID1), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true];
		actionID = _actionID;
		nul = execVM "watchtower\sleep.sqf";
	}, // Ausgeführt wenn Aktion abgeschlossen

	{	a0 = 1,
		["Hacking abgebrochen"] remoteExec ["hintSilent", 0, true],
		sleep 1;
		[""] remoteExec ["hintSilent", 0, true],
		
	}, // Ausgeführt wenn Aktion abgebrochen

	[],
	10,
	0,
	false,
	false

] remoteExec ["bis_fnc_holdactionadd", 0, true];
["Watchtower is now available"] remoteExec ["hint", 0, true];
sleep 2;
[""] remoteExec ["hintSilent", 0, true];


