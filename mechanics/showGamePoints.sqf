DISP_scoreDataWest = profileNamespace getVariable ["NS_scoreDataWest", 0]; 	//NS_scoreDataWest ist der Name des Namespaces welcher im Serverprofil gespeichert wird
DISP_scoreDataEast = profileNamespace getVariable ["NS_scoreDataEast", 0];

publicVariable "DISP_scoreDataWest"; //DISP_scoreDataWest is broadcast to all clients
publicVariable "DISP_scoreDataEast"; //DISP_scoreDataEast is broadcast to all clients


sleep 0.2;
["Blufor points:"] remoteExec ["systemChat", 0, true];
[str DISP_scoreDataWest] remoteExec ["systemChat", 0, true];

["Opfor points:"] remoteExec ["systemChat", 0, true];
[str DISP_scoreDataEast] remoteExec ["systemChat", 0, true];
