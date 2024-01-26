/* missionNamespace setVariable ["techeast", p0];
missionNamespace setVariable ["techwest", p0];
missionNamespace setVariable ["mediceast", p0];
missionNamespace setVariable ["medicwest", p0];
missionNamespace setVariable ["snipereast", p0];
missionNamespace setVariable ["sniperwest", p0];
missionNamespace setVariable ["scouteast", p0];
missionNamespace setVariable ["scoutwest", p0];
missionNamespace setVariable ["assassineast", p0];
missionNamespace setVariable ["assassinwest", p0];
missionNamespace setVariable ["distractoreast", p0];
missionNamespace setVariable ["distractorwest", p0]; */
waitUntil {(count (call BIS_fnc_listPlayers)) > 0};
_ctr = true;
while {_ctr} do {

	_allPlayers = call BIS_fnc_listPlayers;
	_inArea = allPlayers inAreaArray "gameStart";	
	_count1 = count _allPlayers;
	_count2 = count _inArea;
	[str _count2] remoteExec ["hint", 0]; // debug
	if (_count1 == _count2) then {

		execVM "mechanics\showGamePoints.sqf";
		execVM "mechanics\gameTime.sqf";
		sleep 3;
		_ctr = false;

	};
	sleep 1;

};