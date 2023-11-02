//Script nur auf dem Server ausführen:
//[[], "mechanics\gamePointsWest.sqf"] remoteExec ["execVM", 2];

"Debugging - Script läuft!" remoteExec ["hint", 0];		//Debugging


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
	"Blufor has won!2" remoteExec ["hint", 0];
	sleep 0.5;
	hintSilent "";
};