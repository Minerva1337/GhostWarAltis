//Script nur auf dem Server ausführen:
//[[], "mechanics\gamePointsWest.sqf"] remoteExec ["execVM", 2];

"Debugging - gamePointsWest läuft!" remoteExec ["hint", 0];		//Debugging

GW_scoreDataWest = profileNamespace getVariable ["NS_scoreDataWest", 0]; 	//NS_scoreDataWest ist der Name des Namespaces welcher im Serverprofil gespeichert wird

GW_scoreDataWest = GW_scoreDataWest + 1;
publicVariable "GW_scoreDataWest"; //GW_scoreDataWest is broadcast to all clients
sleep 0.2;
profileNamespace setVariable ["NS_scoreDataWest", GW_scoreDataWest];	//GW_scoreDataWest is used to set the value of NS_scoreDataWest, both variables contain equal values
sleep 0.2;
		
//{hint str GW_scoreData;} remoteExec ["call", 0];

sleep 1;

if (GW_scoreDataWest == 3) then {
	profileNamespace setVariable ["NS_scoreDataWest", 0];		//NameSpce wird wieder auf Null gesetzt
	profileNamespace setVariable ["NS_scoreDataEast", 0];		//NameSpce wird wieder auf Null gesetzt
	["arma3"] remoteExec ["playSound", 0, true];
	sleep 4;
	{titleText ["<t color='#012269' size='5'>Blufor has won the game!</t><br/>", "PLAIN", 0, true, true];} remoteExec ["call", 0];
	sleep 22;
	{titleText ["<t color='#012269' size='5'></t><br/>", "PLAIN", 0, true, true];} remoteExec ["call", 0];
	//sleep 23.5;
	sleep 3;
	"trolly1" serverCommand "#missions";
} else {
	"Debugging - Blufor has won the round!" remoteExec ["hint", 0];
	sleep 2;
	"endBlufor" call BIS_fnc_endMissionServer;
	sleep 3;
	"trolly1" serverCommand "#mission GhostWar.Altis custom";		//ServerSidePassword = trolly1
};