//Variablen werden von gameTimer.sqf als globale Variable übergeben.

_ctr = true;
unconsciousTeamEast = [];
unconsciousTeamWest = [];		


while {_ctr} do {

	if (count unconsciousTeamWest == count teamWest) then {
		_ctr = false;
		//hint "Blufor has won!";
		"Blufor has won!" remoteExec ["hint", 0];	
		"endBlufor" call BIS_fnc_endMissionServer;		//Mission wird beendet
		sleep 3;
		"trolly1" serverCommand "#missions";		//ServerSidePassword = trolly1
		unconsciousTeamEast = unconsciousTeamEast - unconsciousTeamEast;	//Array wird wieder auf 0 Elemente gesetzt
		unconsciousTeamWest = unconsciousTeamWest - unconsciousTeamWest;
	};
	if (count unconsciousTeamEast == count teamEast) then {		//Wenn 
		_ctr = false;
		//hint "Opfor has won!";
		"Opfor has won!" remoteExec ["hint", 0];
		"endOpfor" call BIS_fnc_endMissionServer;		//Mission wird beendet
		sleep 3;
		"trolly1" serverCommand "#missions";
		unconsciousTeamEast = unconsciousTeamEast - unconsciousTeamEast;	//Array wird wieder auf 0 Elemente gesetzt
		unconsciousTeamWest = unconsciousTeamWest - unconsciousTeamWest;
	} else {
		unconsciousTeamEast = unconsciousTeamEast - unconsciousTeamEast;	//Array wird wieder auf 0 Elemente gesetzt
		unconsciousTeamWest = unconsciousTeamWest - unconsciousTeamWest;		//Array wird wieder auf 0 Elemente gesetzt
	};
	sleep 0.5;

	{	//teamEast in bewusstlose oder tote Spieler sortieren
		_selectEast = teamEast select _forEachIndex;
		_lifeStateEast = lifeState _selectEast;
		//hint str _lifeStateEast;		//Debugging
			
		if (_lifeStateEast == "INCAPACITATED") then {
			unconsciousTeamEast pushBack _lifeStateEast;	//Ein weiterer INCAPACITATED Status wird verschoben
			//hint "IF Funktioniert";
			//"IF Funktioniert" remoteExec ["hintSilent", 0];		//Debugging
			sleep 0.5;
			//hint str unconsciousTeamEast;
			//[hint str unconsciousTeamEast] remoteExec ["hintSilent", 0];	//Debugging
			//sleep 0.5;
			//hintSilent "";
		};
		if (_lifeStateEast == "DEAD-RESPAWN") then {
			unconsciousTeamEast pushBack _lifeStateEast;	//Ein weiterer INCAPACITATED Status wird verschoben
			//"IF2 Funktioniert" remoteExec ["hintSilent", 0];
			sleep 0.5;
			//hint str unconsciousTeamEast;
			//[hint str unconsciousTeamEast] remoteExec ["hintSilent", 0];
			//sleep 0.5;
			//hintSilent "";
		};	
			
		sleep 0.1;
	} forEach teamEast;

	{	//teamWest in bewusstlose oder tote Spieler sortieren
		_selectWest = teamWest select _forEachIndex;
		_lifeStateWest = lifeState _selectWest;
		//hint str _lifeStateWest;		//Debugging
			
		if (_lifeStateWest == "INCAPACITATED") then {
			unconsciousTeamWest pushBack _lifeStateWest;	//Ein weiterer INCAPACITATED Status wird verschoben
			//"IF Funktioniert" remoteExec ["hintSilent", 0];		//Debugging
			sleep 0.5;
			//hint str unconsciousTeamWest;	//Debugging
			//[hint str unconsciousTeamWest] remoteExec ["hintSilent", 0];
			//sleep 0.5;
			//hintSilent "";
		};
		if (_lifeStateWest == "DEAD-RESPAWN") then {
			unconsciousTeamWest pushBack _lifeStateWest;	//Ein weiterer INCAPACITATED Status wird verschoben
			//"IF2 Funktioniert" remoteExec ["hintSilent", 0];
			sleep 0.5;
			//hint str unconsciousTeamWest;
			//[hint str unconsciousTeamWest] remoteExec ["hintSilent", 0];
			//sleep 0.5;
			//hintSilent "";
		};	
			
		sleep 0.1;
	} forEach teamWest;

};