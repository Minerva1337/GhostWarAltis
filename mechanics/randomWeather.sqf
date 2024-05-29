	_random = floor random 5;
	switch (_random) do {

		case 0: {

			skipTime 17.5;
			[0] call BIS_fnc_setOvercast;
			0 setFog [0.15, 0.1, 15];

		}; // Sonniger Morgen, mit Nebel und ohne Wolken
		case 1: { 

			skipTime 0;
			[1] call BIS_fnc_setOvercast;
			0 setRain 1;
			0 setFog [0.35, 0, 40];

		}; // Verregneter Tag, geringe Sichtweite und Wolkendecke
		case 2: {

			skipTime 6;
			[0.15] call BIS_fnc_setOvercast;

		}; // Sonniger Nachmittag, kein Nebel und vereinzelte Wolken
		case 3: {

			skipTime 14;

		}; // Nacht, klarer Sternenhimmel, keine Wolken, Halbmond
		case 4: {

			skipTime 16.15;
			[0.9] call BIS_fnc_setOvercast;
			0 setRain 0.15;
			0 setFog [0.2, 0, 0];

		}; // Früher Morgen, leichter Regen mit verringerter Sichtweite

	};