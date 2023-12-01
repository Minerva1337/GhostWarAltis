watchtowerActionID = missionNamespace getVariable "watchtowerAvailable";
[laptop, watchtowerActionID] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
sleep watchtowerCooldown;
terminate taskInit;
taskInit = execVM "watchtower\watchtower.sqf";