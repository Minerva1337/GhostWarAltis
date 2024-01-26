if (isServer) then {

	[[], "gameConfig.sqf"] remoteExec ["execVM", 0];
	[] execVM "mechanics\gameStart.sqf";
	[] execVM "mechanics\loadoutManager.sqf";
	[] execVM "mechanics\setRandomWeather-lukas.sqf";

};