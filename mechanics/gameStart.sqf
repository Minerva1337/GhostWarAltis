ctr = true;
sleep 3;				//sleep 3 muss rein weil scriot läuft zu schnell und wird sofot von init.sqf ausgeführt. count allPlayers = 0 und inArea auch = 0 -> if Funktion ist wahr
while {ctr} do {

	_allPlayers = call BIS_fnc_listPlayers;		//allPlayers ließt Daten von aktieven Spielern nicht schnell genug aus -> BIS_fnc_listPlayers ist schneller
	_inArea = allPlayers inAreaArray "gameStart";	
	_cnt1 = count _allPlayers;
	_cnt2 = count _inArea;
	sleep 2;
	if (_cnt1 == _cnt2) then {

		[[], "mechanics\showGamePoints.sqf"] remoteExec ["execVM", 2];
		[[], "mechanics\gameTimer.sqf"] remoteExec ["execVM", 2];
		sleep 3;
		ctr = false;

	};

};