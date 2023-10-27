sleep 90;
tsk = format ["tsk%1", random 100];
publicVariable "tsk";	//macht, dass sowol der Server als auch der client Zugriff auf die Variable hat
[true, tsk,  ["Hack the watchtower to get information about the position of the opposing players!", "Watchtower", ""], laptop, "ASSIGNED", 99, true, "download", true] call BIS_fnc_taskCreate;

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
		if (_p5 or _p6 or _p7 or _p8) then {
			"YOU ARE MARKED ON THE MAP" remoteExec ["hint", east];	
			"ENEMIES ARE NOW MARKED ON THE MAP" remoteExec ["hint", west];
			} else {
			"YOU ARE MARKED ON THE MAP" remoteExec ["hint", west];
			"ENEMIES ARE NOW MARKED ON THE MAP" remoteExec ["hint", east];}; 
		nul = execVM "watchtower\gegner_markieren_v3.sqf";
		[tsk, "SUCCEEDED", true] remoteExec ["BIS_fnc_taskSetState", 0, true];	
		sleep 0.1;
		[tsk, true, true] remoteExec ["BIS_fnc_deleteTask", 0, true];
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


