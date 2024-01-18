nul = [[], "gameConfig.sqf"] remoteExec ["execVM", 0];
nul = execVM "mechanics\setRandomWeather-lukas.sqf";
watchtowerAvailable = false;
publicVariable "watchtowerAvailable";