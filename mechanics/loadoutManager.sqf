eastRoles = [];
westRoles = [];
publicVariable "eastRoles";
publicVariable "westRoles";
techEast = [East, "techEast"] call BIS_fnc_addRespawnInventory;
techWest = [West, "techWest"] call BIS_fnc_addRespawnInventory;
medicEast = [East, "medicEast"] call BIS_fnc_addRespawnInventory;
medicWest = [West, "medicWest"] call BIS_fnc_addRespawnInventory;
sniperEast = [East, "sniperEast"] call BIS_fnc_addRespawnInventory;
sniperWest = [West, "sniperWest"] call BIS_fnc_addRespawnInventory;
scoutEast = [East, "scoutEast"] call BIS_fnc_addRespawnInventory;
scoutWest = [West, "scoutWest"] call BIS_fnc_addRespawnInventory;
assassinEast = [East, "assassinEast"] call BIS_fnc_addRespawnInventory;
assassinWest = [West, "assassinWest"] call BIS_fnc_addRespawnInventory;
explosiveEast = [East, "explosiveEast"] call BIS_fnc_addRespawnInventory;
explosiveWest = [West, "explosiveWest"] call BIS_fnc_addRespawnInventory;
distractorEast = [East, "distractorEast"] call BIS_fnc_addRespawnInventory;
distractorWest = [West, "distractorWest"] call BIS_fnc_addRespawnInventory;
while {true} do {

	eastRoles = missionNamespace getVariable "eastRoles";
	westRoles = missionNamespace getVariable "westRoles";
	switch (true) do {

		case ("tech" in eastRoles): {techEast call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "tech")};
		case ("medic" in eastRoles): {medicEast call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "medic")};
		case ("sniper" in eastRoles): {sniperEast call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "sniper")};
		case ("scout" in eastRoles): {scoutEast call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "scout")};
		case ("assassin" in eastRoles): {assassinEast call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "assassin")};
		case ("explosive" in eastRoles): {explosiveEast call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "explosive")};
		case ("distractor" in eastRoles): {distractorEast call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "distractor")};
		case ("tech" in westRoles): {techWest call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "tech")};
		case ("medic" in westRoles): {medicWest call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "medic")};
		case ("sniper" in westRoles): {sniperWest call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "sniper")};
		case ("scout" in westRoles): {scoutWest call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "scout")};
		case ("assassin" in westRoles): {assassinWest call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "assassin")};
		case ("explosive" in westRoles): {explosiveWest call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "explosive")};
		case ("distractor" in westRoles): {distractorWest call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "distractor")};

	};
	sleep 0.2;

};