_actionID01 = player addAction
[
	"Revive near players!",	// title
	{
		sleep 0.5;
		if (lifeState player == "INCAPACITATED") then {		//verhindert, dass Spieler während dem sterben sich selber wiederbelebt
			if (true) exitWith
			{
				hint "Bewustlos";	//Debugging
				removeAllActions player;
			};
			//hint "Bewustlos";	//Debugging
		} else {
			//hint "lebendig";	//Debugging
			params ["_target", "_caller", "_actionId", "_arguments"]; // script
			player switchMove "ainvpknlmstpsnonwnondnon_medic3";
			player playMoveNow "ainvpknlmstpsnonwnondnon_medic3";
			sleep 7.5;
			player switchMove "";

			private _players = allUnits inAreaArray [getPos player, medicHealingAreaX, medicHealingAreaY];
			hint str _players;
			sleep 1;
			{
				if (side player == side (group _x)) then {
				//_x setUnconscious false;	//Debugging
				[["#rev", 1, _x] call BIS_fnc_reviveOnState] remoteExec ["call", _players];
				};
			} forEach _players;
			sleep 3;
			hintSilent ""; 
			removeAllActions player;
			sleep healingMedicSleep;
			nul = execVM "roles\medic\medic.sqf";
			playSound "notification";
		};
	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];