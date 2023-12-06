isAliveP5 = ((lifeState p5) isEqualTo "HEALTHY" or (lifeState p5) isEqualTo "INJURED"); // "true" wenn Unit lebt.
isAliveP6 = ((lifeState p6) isEqualTo "HEALTHY" or (lifeState p6) isEqualTo "INJURED");
isAliveP7 = ((lifeState p7) isEqualTo "HEALTHY" or (lifeState p7) isEqualTo "INJURED");
isAliveP8 = ((lifeState p8) isEqualTo "HEALTHY" or (lifeState p8) isEqualTo "INJURED");
_title = "Enemy";
_description = "Position of the enemy";
_waypoint = "";
_loop = 0;
{playsound "marked"} remoteExec ["call", west];
// "taskID" wird bei Spielstart in der "gameTimer.sqf" auf 10 gesetzt
if (isAliveP5) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p5, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p5TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible; // Erstellt Task auf Unit, wenn diese nicht bewusstlos ist
westTaskID1 = taskID; // Überträgt die "taskID" auf Variable "westTaskID1" um diese Task später trotz geanderter "taskID" ansteuern zu können
taskID = taskID + 1; // erhöht "taskID" um + 1 damit die darauffolgende Task eine neue ID bekommt
if (isAliveP6) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p6, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p6TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible;
westTaskID2 = taskID;
taskID = taskID + 1;
if (isAliveP7) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p7, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p7TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible;
westTaskID3 = taskID;
taskID = taskID + 1;
if (isAliveP8) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p8, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate}, [str taskID, "p8TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible;
westTaskID4 = taskID;
taskID = taskID + 1;

while {_loop != watchtowerMarkingTime} do {// Für 30 Sekunden wird diese while-Funktion 60 Mal ausgewertet, um Tasks zu löschen, falls Units sterben und um Tasks hinzuzufügen, falls Units wiederbelebt werden. 
	isAliveP5 = ((lifeState p5) isEqualTo "HEALTHY" or (lifeState p5) isEqualTo "INJURED"); // "true" wenn Unit lebt.
	if ((p5TaskIcon == "run") && (_loop > 10)) then {isAliveP5 = false};
	isAliveP6 = ((lifeState p6) isEqualTo "HEALTHY" or (lifeState p6) isEqualTo "INJURED");
	if ((p6TaskIcon == "run") && (_loop > 10)) then {isAliveP6 = false};
	isAliveP7 = ((lifeState p7) isEqualTo "HEALTHY" or (lifeState p7) isEqualTo "INJURED");
	if ((p7TaskIcon == "run") && (_loop > 10)) then {isAliveP7 = false};
	isAliveP8 = ((lifeState p8) isEqualTo "HEALTHY" or (lifeState p8) isEqualTo "INJURED");
	if ((p8TaskIcon == "run") && (_loop > 10)) then {isAliveP8 = false};
	if (isAliveP5 == false) then {[(str westTaskID1), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]}; // Wenn Unit stirbt, wird ihre Task gelöscht.
	if (isAliveP6 == false) then {[(str westTaskID2), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
	if (isAliveP7 == false) then {[(str westTaskID3), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
	if (isAliveP8 == false) then {[(str westTaskID4), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};	
	if ((isAliveP5 == true) and (([str westTaskID1] call BIS_fnc_taskExists) != true)) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p5, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p5TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, westTaskID1 = taskID, taskID = taskID + 1;}; // Wenn Unit lebt und noch keine Task auf sich hat, wird eine Task mit neuer "taskID" erstellt. 
	if ((isAliveP6 == true) and (([str westTaskID2] call BIS_fnc_taskExists) != true)) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p6, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p6TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, westTaskID2 = taskID, taskID = taskID + 1;}; // Außerdem: Überträgt die "taskID" auf Variable "westTaskID1" um diese Task später trotz geanderter "taskID" ansteuern zu können.
	if ((isAliveP7 == true) and (([str westTaskID3] call BIS_fnc_taskExists) != true)) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p7, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p7TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, westTaskID3 = taskID, taskID = taskID + 1;};
	if ((isAliveP8 == true) and (([str westTaskID4] call BIS_fnc_taskExists) != true)) then {_task1 = [east, (str taskID), [_description, _title, _waypoint], p8, "CREATED", 0, false, "", true] call BIS_fnc_taskCreate, [str taskID, "p8TaskIcon"] call BIS_fnc_taskSetType, [str taskID, true] call BIS_fnc_taskSetAlwaysVisible, westTaskID4 = taskID, taskID = taskID + 1;};
	_loop = _loop + 1;
	sleep 0.5;
};
isAliveP5 = ((lifeState p5) isEqualTo "HEALTHY" or (lifeState p5) isEqualTo "INJURED"); // Überprüft abschließend welche Units leben.
if ((p5TaskIcon == "run") && (_loop > 10)) then {isAliveP5 = false};
isAliveP6 = ((lifeState p6) isEqualTo "HEALTHY" or (lifeState p6) isEqualTo "INJURED");
if ((p6TaskIcon == "run") && (_loop > 10)) then {isAliveP6 = false};
isAliveP7 = ((lifeState p7) isEqualTo "HEALTHY" or (lifeState p7) isEqualTo "INJURED");
if ((p7TaskIcon == "run") && (_loop > 10)) then {isAliveP7 = false};
isAliveP8 = ((lifeState p8) isEqualTo "HEALTHY" or (lifeState p8) isEqualTo "INJURED");
if ((p8TaskIcon == "run") && (_loop > 10)) then {isAliveP8 = false};
if (isAliveP5) then {[(str westTaskID1), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]}; // Löscht alle Tasks.
if (isAliveP6) then {[(str westTaskID2), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
if (isAliveP7) then {[(str westTaskID3), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};
if (isAliveP8) then {[(str westTaskID4), true, true] remoteExec ["BIS_fnc_deleteTask", 0, true]};