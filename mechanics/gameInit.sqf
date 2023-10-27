//Lukas Code:
ctr = true;

while {ctr} do {
	sleep 3;		//sleep 3 muss rein weil scriot läuft zu schnell und wird sofot von init.sqf ausgeführt. count allPlayers = 0 und inArea auch = 0 -> if Funktion ist wahr
	_allPlayers = call BIS_fnc_listPlayers;		//allPlayers ließt Daten von aktieven Spielern nicht schnell genug aus -> BIS_fnc_listPlayers ist schneller
	_inArea = allPlayers inAreaArray "gameStart";	
	_cnt1 = count _allPlayers;
	_cnt2 = count _inArea;
	sleep 2;
	if (_cnt1 == _cnt2) then {
		
		execVM "mechanics\gameTimer.sqf";
		sleep 3;
		
		ctr = false;
	};
};



/*
hint format ["%1", _cnt1];		//Debugging
sleep 1;
hint format ["%1", _cnt1];
sleep 1;
hintSilent "";
*/