watchtowerTaskID = missionNamespace getVariable "watchtowerTaskID";
watchtowerTaskID = watchtowerTaskID + 1;
publicVariable "watchtowerTaskID";
if (scriptDone watchtowerInit) then {
	
	sleep watchtowerCooldown;
	execVM "watchtower\watchtower.sqf";

 } else {

	terminate watchtowerInit;
	sleep watchtowerCooldown;
	execVM "watchtower\watchtower.sqf";
	
 };