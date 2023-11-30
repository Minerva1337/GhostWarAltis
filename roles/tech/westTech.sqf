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
	westTechCooldown = missionNamespace getVariable "westTechCooldown";

	if ((watchtowerAvailable == true) && (westTechActionAssigned == false) && (eastTechActionActive == false) && (westTechCooldown == false)) then {
		
		createAddAction = execVM "roles\tech\westCreateAddAction.sqf";
		westTechActionAssigned = true;
		publicVariable "westTechActionAssigned";
		systemChat "Tech-Action available";
		
	};

	if (((watchtowerAvailable == false) && (westTechActionAssigned == true)) or (eastTechActionActive == true)) then {

		removeAllActions player;
		westTechActionAssigned = false;
		publicVariable "westTechActionAssigned";
		systemChat "Tech-Action removed";

	};

	sleep 0.5;

};