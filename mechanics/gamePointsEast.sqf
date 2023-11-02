sleep 0.5;
"Debugging - gamePointsEast läuft!" remoteExec ["hint", 0];		//Debugging

GW_scoreDataEast = profileNamespace getVariable ["NS_scoreDataEast", 0];	//NS_scoreDataEast ist der Name des Namespaces welcher im Serverprofil gespeichert wird

GW_scoreDataEast = GW_scoreDataEast + 1;
publicVariable "GW_scoreDataEast"; //GW_scoreDataEast is broadcast to all clients
sleep 0.2;
profileNamespace setVariable ["NS_scoreDataEast", GW_scoreDataEast];	//GW_scoreDataEast is used to set the value of NS_scoreDataEast, both variables contain equal values
sleep 0.2;
		
//{hint str GW_scoreData;} remoteExec ["call", 0];

sleep 1;

if (GW_scoreDataEast == 3) then {
	profileNamespace setVariable ["NS_scoreDataEast", 0];		//NameSpce wird wieder auf Null gesetzt
	profileNamespace setVariable ["NS_scoreDataWest", 0];		//NameSpce wird wieder auf Null gesetzt
	"Opfor has won!2" remoteExec ["hint", 0];
	sleep 0.5;
	hintSilent "";
};