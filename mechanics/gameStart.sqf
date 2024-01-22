waitUntil {(count (call BIS_fnc_listPlayers)) > 0};
_ctr = true;
while {_ctr} do {

	_allPlayers = call BIS_fnc_listPlayers;
	_inArea = allPlayers inAreaArray "gameStart";	
	_count1 = count _allPlayers;
	_count2 = count _inArea;
	[str _count2] remoteExec ["hint", 0];
	if (_count1 == _count2) then {

		execVM "mechanics\showGamePoints.sqf";
		execVM "mechanics\gameTime.sqf";
		sleep 3;
		_ctr = false;

	};
	sleep 1;

};