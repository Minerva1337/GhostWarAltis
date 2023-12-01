isAliveP1 = ((lifeState p1) isEqualTo "HEALTHY" or (lifeState p1) isEqualTo "INJURED");
isAliveP2 = ((lifeState p2) isEqualTo "HEALTHY" or (lifeState p2) isEqualTo "INJURED");
isAliveP3 = ((lifeState p3) isEqualTo "HEALTHY" or (lifeState p3) isEqualTo "INJURED");
isAliveP4 = ((lifeState p4) isEqualTo "HEALTHY" or (lifeState p4) isEqualTo "INJURED");
_title = "Enemy";
_description = "Position of the enemy";
_waypoint = "";
_loop = 0; 

if (isAliveP1) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p1, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p1TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible;
eastTaskID1 = taskID;
taskID = taskID + 1;
if (isAliveP2) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p2, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p2TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible;
eastTaskID2 = taskID;
taskID = taskID + 1;
if (isAliveP3) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p3, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p3TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible;
eastTaskID3 = taskID;
taskID = taskID + 1;
if (isAliveP4) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p4, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p4TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible;
eastTaskID4 = taskID;
taskID = taskID + 1;

while {_loop != techMarkingTime} do {
	isAliveP1 = ((lifeState p1) isEqualTo "HEALTHY" or (lifeState p1) isEqualTo "INJURED");
	isAliveP2 = ((lifeState p2) isEqualTo "HEALTHY" or (lifeState p2) isEqualTo "INJURED");
	isAliveP3 = ((lifeState p3) isEqualTo "HEALTHY" or (lifeState p3) isEqualTo "INJURED");
	isAliveP4 = ((lifeState p4) isEqualTo "HEALTHY" or (lifeState p4) isEqualTo "INJURED");
	if (isAliveP1 == false) then {[(str eastTaskID1), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
	if (isAliveP2 == false) then {[(str eastTaskID2), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
	if (isAliveP3 == false) then {[(str eastTaskID3), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
	if (isAliveP4 == false) then {[(str eastTaskID4), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};	
	if ((isAliveP1 == true) and (([str eastTaskID1] call BIS_fnc_taskExists) != true)) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p1, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p1TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, eastTaskID1 = taskID, taskID = taskID + 1;};
	if ((isAliveP2 == true) and (([str eastTaskID2] call BIS_fnc_taskExists) != true)) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p2, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p2TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, eastTaskID2 = taskID, taskID = taskID + 1;};
	if ((isAliveP3 == true) and (([str eastTaskID3] call BIS_fnc_taskExists) != true)) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p3, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p3TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, eastTaskID3 = taskID, taskID = taskID + 1;};
	if ((isAliveP4 == true) and (([str eastTaskID4] call BIS_fnc_taskExists) != true)) then {_task1 = [west, (str taskID), [_description, _title, _waypoint], p4, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p4TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, eastTaskID4 = taskID, taskID = taskID + 1;};
	_loop = _loop + 1;
	sleep 0.5;
};
isAliveP1 = ((lifeState p1) isEqualTo "HEALTHY" or (lifeState p1) isEqualTo "INJURED");
isAliveP2 = ((lifeState p2) isEqualTo "HEALTHY" or (lifeState p2) isEqualTo "INJURED");
isAliveP3 = ((lifeState p3) isEqualTo "HEALTHY" or (lifeState p3) isEqualTo "INJURED");
isAliveP4 = ((lifeState p4) isEqualTo "HEALTHY" or (lifeState p4) isEqualTo "INJURED");
if (isAliveP1) then {[(str eastTaskID1), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
if (isAliveP2) then {[(str eastTaskID2), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
if (isAliveP3) then {[(str eastTaskID3), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
if (isAliveP4) then {[(str eastTaskID4), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};

westTechIdle = true;
publicVariable "westTechIdle";
sleep techCooldown;

if ((player getUnitTrait "Engineer" != true) or (side player == east)) exitWith {};
{[] execVM "roles\tech\tech.sqf"} remoteExec ["bis_fnc_call",0]; 