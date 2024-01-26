_techEastInventory = [East, "techEast"] call BIS_fnc_addRespawnInventory;
_techWest = [West, "techWest"] call BIS_fnc_addRespawnInventory;
_medicEast = [East, "medicEast"] call BIS_fnc_addRespawnInventory;
_medicWest = [West, "medicWest"] call BIS_fnc_addRespawnInventory;
_sniperEast = [East, "sniperEast"] call BIS_fnc_addRespawnInventory;
_sniperWest = [West, "sniperWest"] call BIS_fnc_addRespawnInventory;
_scoutEast = [East, "scoutEast"] call BIS_fnc_addRespawnInventory;
_scoutWest = [West, "scoutWest"] call BIS_fnc_addRespawnInventory;
_assassinEast = [East, "assassinEast"] call BIS_fnc_addRespawnInventory;
_assassinWest = [West, "assassinWest"] call BIS_fnc_addRespawnInventory;
_explosiveEast = [East, "explosiveEast"] call BIS_fnc_addRespawnInventory;
_explosiveWest = [West, "explosiveWest"] call BIS_fnc_addRespawnInventory;
_distractorEast = [East, "distractorEast"] call BIS_fnc_addRespawnInventory;
_distractorWest = [West, "distractorWest"] call BIS_fnc_addRespawnInventory;

while {true} do {

	_techeast = missionNamespace getVariable "techeast";
	if (_techeast != p0) then {_techEastInventory call BIS_fnc_removeRespawnInventory};


};
switch (true) do {

	case (_techeast != p0): {_techEastInventory call BIS_fnc_removeRespawnInventory};
	
};