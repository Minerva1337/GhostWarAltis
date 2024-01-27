_techEastInventory = [East, "techEast"] call BIS_fnc_addRespawnInventory;
_techWestInventory = [West, "techWest"] call BIS_fnc_addRespawnInventory;
_medicEastInventory = [East, "medicEast"] call BIS_fnc_addRespawnInventory;
_medicWestInventory = [West, "medicWest"] call BIS_fnc_addRespawnInventory;
_sniperEastInventory = [East, "sniperEast"] call BIS_fnc_addRespawnInventory;
_sniperWestInventory = [West, "sniperWest"] call BIS_fnc_addRespawnInventory;
_scoutEastInventory = [East, "scoutEast"] call BIS_fnc_addRespawnInventory;
_scoutWestInventory = [West, "scoutWest"] call BIS_fnc_addRespawnInventory;
_assassinEastInventory = [East, "assassinEast"] call BIS_fnc_addRespawnInventory;
_assassinWestInventory = [West, "assassinWest"] call BIS_fnc_addRespawnInventory;
_explosiveEastInventory = [East, "explosiveEast"] call BIS_fnc_addRespawnInventory;
_explosiveWestInventory = [West, "explosiveWest"] call BIS_fnc_addRespawnInventory;
_distractorEastInventory = [East, "distractorEast"] call BIS_fnc_addRespawnInventory;
_distractorWestInventory = [West, "distractorWest"] call BIS_fnc_addRespawnInventory;
while {true} do {

	eastRoles = missionNamespace getVariable "eastRoles";
	westRoles = missionNamespace getVariable "westRoles";
	switch (true) do {

		case ("tech" in eastRoles): {_techEastInventory call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "tech")};
		case ("medic" in eastRoles): {_medicEastInventory call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "medic")};
		case ("sniper" in eastRoles): {_sniperEastInventory call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "sniper")};
		case ("scout" in eastRoles): {_scoutEastInventory call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "scout")};
		case ("assassin" in eastRoles): {_assassinEastInventory call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "assassin")};
		case ("explosive" in eastRoles): {_explosiveEastInventory call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "explosive")};
		case ("distractor" in eastRoles): {_distractorEastInventory call BIS_fnc_removeRespawnInventory, eastRoles deleteAt (eastRoles find "distractor")};
		case ("tech" in westRoles): {_techWestInventory call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "tech")};
		case ("medic" in westRoles): {_medicWestInventory call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "medic")};
		case ("sniper" in westRoles): {_sniperWestInventory call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "sniper")};
		case ("scout" in westRoles): {_scoutWestInventory call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "scout")};
		case ("assassin" in westRoles): {_assassinWestInventory call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "assassin")};
		case ("explosive" in westRoles): {_explosiveWestInventory call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "explosive")};
		case ("distractor" in westRoles): {_distractorWestInventory call BIS_fnc_removeRespawnInventory, westRoles deleteAt (westRoles find "distractor")};

	};
	sleep 0.2;

};