switch (random 4) do {

	case 0: {

		skipTime 17.5;
		[0] call BIS_fnc_setOvercast;
		0 setRain 0;
		0 setFog [0.3, 1, 5];

	}; // Sonniger Morgen, mit Nebel und ohne Wolken
	case 1: { 

		skipTime 0;
		[1] call BIS_fnc_setOvercast;
		0 setRain 1;
		0 setFog [0.35, -0.8, 60];

	}; // Verregneter Tag, geringe Sichtweite und Wolkendecke
	case 2: {

		skipTime 6;
		[0.15] call BIS_fnc_setOvercast;
		0 setRain 0;
		0 setFog [0, 0, 0];

	}; // Sonniger Nachmittag, kein Nebel und vereinzelte Wolken
	case 3: {

		skipTime 14;
		[0] call BIS_fnc_setOvercast;
		0 setRain 0;
		0 setFog [0, 0, 0];

	}; // Nacht, klarer Sternenhimmel, keine Wolken, Halbmond

};