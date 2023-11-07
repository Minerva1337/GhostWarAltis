_actionID01 = player addAction
[
	"Revive near players!",	// title
	{
		player switchMove "ainvpknlmstpsnonwnondnon_medic3";
		player playMoveNow "ainvpknlmstpsnonwnondnon_medic3";
		sleep 7.5;
		player switchMove "";

		private _players = allUnits inAreaArray [getPos player, 10, 10];
		hint str _players;
		sleep 1;
		{
			[["#rev", 1, _x] call BIS_fnc_reviveOnState; ]remoteExec ["call", _players];
		} forEach _players;
		sleep 3;
		hintSilent ""; // script
		
		removeAllActions player;
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
