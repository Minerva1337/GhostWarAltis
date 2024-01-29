_actionID03 = player addAction[
	"Hacking sound!",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		{playSound "hacking"} remoteExec ["call", 0];
		//hint str _actionId;		//Debugging
		player removeAction _actionId;
		hint str hackingDistracorSleep;
		sleep hackingDistracorSleep;
		playSound "notification";
		nul = execVM "roles\distractor\hackingDistractor.sqf";
	},
	nil,		// arguments
	1.5,		// priority
	false,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

