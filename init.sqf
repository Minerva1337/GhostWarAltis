if (isServer) then {

	[[], "gameConfig.sqf"] remoteExec ["execVM", 0];
	[] execVM "mechanics\gameStart.sqf";
	if (randomWeather) then {[] execVM "mechanics\randomWeather.sqf"};
	[] execVM "mechanics\loadoutManager.sqf";

};
loadedIn = false;