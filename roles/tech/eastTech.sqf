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
	eastTechCooldown = missionNamespace getVariable "westTechCooldown";

	if ((watchtowerAvailable == true) && (eastTechActionAssigned == false) && (westTechActionActive == false) && (eastTechCooldown == false)) then {
		
		createAddAction = execVM "roles\tech\eastCreateAddAction.sqf";
		eastTechActionAssigned = true;
		publicVariable "eastTechActionAssigned";
		systemChat "Tech-Action available";
		
	};

	if (((watchtowerAvailable == false) && (eastTechActionAssigned == true)) or (westTechActionActive == true) or (eastTechCooldown == true)) then {
		
		removeAllActions player;
		eastTechActionAssigned = false;
		publicVariable "eastTechActionAssigned";
		systemChat "Tech-Action removed";

	};

	sleep 0.5;

};