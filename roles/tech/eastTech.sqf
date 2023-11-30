eastTechActionAssigned = false;
eastTechActionActive = false;
eastTechCooldown = false;
publicVariable "eastTechActionAssigned";
publicVariable "eastTechActionActive";
publicVariable "eastTechCooldown";

while {true} do {

	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
	westTechActionActive = missionNamespace getVariable "westTechActionActive";
	eastTechActionAssigned = missionNamespace getVariable "eastTechActionAssigned";

	if ((watchtowerAvailable == true) && (eastTechActionAssigned == false) && (westTechActionActive == false) && (eastTechCooldown == false)) then {
		
		createAddAction = execVM "roles\tech\eastCreateAddAction.sqf";
		eastTechActionAssigned = true;
		publicVariable "eastTechActionAssigned";
		
	};

	if (((watchtowerAvailable == false) && (eastTechActionAssigned == true)) or (westTechActionActive == true) or (eastTechCooldown = true)) then {
		
		removeAllActions player;
		eastTechActionAssigned = false;
		publicVariable "eastTechActionAssigned";

	};

	sleep 0.5;

};