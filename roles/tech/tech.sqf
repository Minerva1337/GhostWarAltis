actionAssigned = false;
while {true} do {

	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";

	if ((watchtowerAvailable == true) && (actionAssigned == false)) then {
		
		test = execVM "roles\tech\createAddAction.sqf";
		actionAssigned = true;
	};

	if ((watchtowerAvailable == false) && (actionAssigned == true)) then {
		
		removeAllActions player;
		actionAssigned = false;

	};

	sleep 0.5;

	};