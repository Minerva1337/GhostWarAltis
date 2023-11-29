watchtowerActionID = missionNamespace getVariable "watchtowerAvailable";
[laptop, watchtowerActionID] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
sleep 1;
terminate taskInit;
sleep 29;
taskInit = execVM "watchtower\watchtower.sqf";