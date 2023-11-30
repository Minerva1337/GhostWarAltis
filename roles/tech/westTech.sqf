westTechActionAssigned = false;
westTechActionActive = false;
westTechCooldown = false;
publicVariable "westTechActionAssigned";
publicVariable "westTechActionActive";
publicVariable "westTechCooldown";

while {true} do {

	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
	eastTechActionActive = missionNamespace getVariable "eastTechActionActive";
	westTechActionAssigned = missionNamespace getVariable "westTechActionAssigned";

	if ((watchtowerAvailable == true) && (westTechActionAssigned == false) && (eastTechActionActive == false) && (westTechCooldown == false)) then {
		
		createAddAction = execVM "roles\tech\westCreateAddAction.sqf";
		westTechActionAssigned = true;
		publicVariable "westTechActionAssigned";
		
	};

	if (((watchtowerAvailable == false) && (westTechActionAssigned == true)) or (eastTechActionActive == true) or (westTechCooldown = true)) then {
		
		removeAllActions player;
		westTechActionAssigned = false;
		publicVariable "westTechActionAssigned";

	};

	sleep 0.5;

};