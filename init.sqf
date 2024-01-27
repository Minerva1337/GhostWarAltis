if (isServer) then {

	[[], "gameConfig.sqf"] remoteExec ["execVM", 0];
	[] execVM "mechanics\gameStart.sqf";
	[] execVM "mechanics\randomWeather.sqf";
	sleep 1;
	[] execVM "mechanics\loadoutManager.sqf";

};
loadedIn = false;