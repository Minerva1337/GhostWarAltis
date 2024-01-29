_actionID02 = player addAction[
	"Spawn shooting sounds on the map!",	// title
	{
		civ1 enableAI "PATH";
		params ["_target", "_caller", "_actionId", "_arguments"];
		player removeAction _actionId;
		openMap true;
		mapclick = false;
		onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";
		player switchMove "HubSpectator_stand";
		waituntil {mapclick};
		player switchMove "";
		openMap false;

		_mapClick = clickpos;
		hint str _mapClick;

		//cutText ["Distraction will be placed", "BLACK OUT", 1];
		sleep 1;
		civ1 setPos _mapClick;
		//cutText ["", "BLACK IN", 1];
		waitUntil {(getpos civ1 select 2) < 2};

		createMarkerLocal ["shots1", getPosWorld civ1];
		"shots1" setMarkerShapeLocal "ELLIPSE";
		"shots1" setMarkerColorLocal "colorYellow";
		"shots1" setMarkerSizeLocal [25, 25];
		"shots1" setMarkerBrushLocal "BDiagonal";
		"shots1" setMarkerAlphaLocal 1;

		_delay = [0.1, 0.1, 0.1, 0.2, 0.2, 0.2, 0.4, 0.5, 0.6];
		
		_slctShots = selectRandom shotsDistractorNumber;
		civ1 doTarget soundPad;
		hint str _slctShots;
		sleep 0.5;
		for [{ _i = 0 }, { _i < _slctShots }, { _i = _i + 1 }] do {
			//sleep selectRandom _delay;
			_slct1 = selectRandom _delay;		//Debugging
			sleep _slct1;			//Debugging
			logic1 action ["useweapon",vehicle civ1, civ1, 2];
			hint str _slct1;	// Debugging
			if (_i == _slctShots - 1) then {
				sleep 2;
				deleteMarkerLocal "shots1";
				civ1 setPos getMarkerPos "shotsDistractorSpawn";
				civ1 setAmmo [primaryWeapon civ1, 1000000];
				sleep shotsDistracorSleep;
				playSound "notification";
				nul = execVM "roles\distractor\shotsDistractor.sqf";
				civ1 disableAI "PATH";
			};
		};
		//hint str _actionId;		//Debugging
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

