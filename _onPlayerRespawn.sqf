player switchMove "HubSpectator_stand";
execVM "mechanics\spectator.sqf";
switch (true) do {

	case ("30Rnd_9x21_Red_Mag" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {missionNamespace setVariable ["tech" + str side player, player]};
	case ("Medikit" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {}: {missionNamespace setVariable ["medic" + str side player, player]};
	case ("ACE_10Rnd_762x51_Mag_Tracer" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {missionNamespace setVariable ["sniper" + str side player, player]};
	case ("ACE_HuntIR_monitor" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {missionNamespace setVariable ["scout" + str side player, player]};
	case ("30Rnd_45ACP_Mag_SMG_01_Tracer_Red" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {missionNamespace setVariable ["assassin" + str side player, player]};
	case ("ACE_M26_Clacker" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {missionNamespace setVariable ["explosive" + str side player, player]};
	case ("XXX" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {missionNamespace setVariable ["distractor" + str side player, player]};

};

/*

techeast = p2
techwest = p7
...