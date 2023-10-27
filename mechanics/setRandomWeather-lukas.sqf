if (!isServer) exitWith {};

_setRandom = [0,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1.0];
_setRandom2 = [0,0.1,0.2,0.25,0.3,0.35,0.4,0.45,0.5];
_setRandom3 = [12,7,-5,0,0]; //mission Zeit muss aus 12 Uhr sein

// Initial Weather
skipTime -24;
skipTime selectRandom _setRandom3;

0 setOvercast selectRandom _setRandom; // Initial Weather Set  Values: 0 = Sunny, clear skies   1 = Stormy, complete overcast

skipTime 24;

sleep 0.1; // Keep this at or above 0.1, or else simulWeatherSync command will not work properly.

simulWeatherSync; // This command will sync the selected weather pattern to appear as it should right away instead of having to wait.

0 setFog selectRandom _setRandom2;
// Random Weather
while { true } do {

    300 setOvercast selectRandom _setRandom; // selectRandom is the new engine solution to BIS_fnc_selectRandom. This will select a random weather pattern from the array. Values: 0 = Sunny, clear skies   1 = Stormy, complete overcast.
	
	sleep 0.1;

	if ( overcast < 0.7 ) then { 2 setRain 0 };

	if ( overcast >= 0.7 && overcast < 0.9 ) then { 2 setRain 0.2 };

	if ( overcast >= 0.9 ) then { 2 setRain 0.4 }; // Prevents heavy rain to help with FPS!


};

sleep 900; // Rests for 10 minutes real-life time before selecting new weather pattern. For 24 hour day cycles (1 in-game second = 1 real life second) or 				  whichever you prefer, you will want to update this to make sure weather shifts as appropriate.