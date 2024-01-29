player switchMove "HubSpectator_stand";
loadedIn = true;
execVM "mechanics\spectator.sqf";
switch (true) do {

	case ("30Rnd_9x21_Red_Mag" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {
		
		pickedRole = "tech";
		taskIcon = "intel";
		missionNamespace setVariable ["tech" + str side player, player];
			
	}; // Tech
	case ("Medikit" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {
		
		pickedRole = "medic";
		taskIcon = "heal";
		missionNamespace setVariable ["medic" + str side player, player];
		execVM "roles\medic\medic.sqf";
		
	}; // Medic
	case ("ACE_10Rnd_762x51_Mag_Tracer" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {
		
		pickedRole = "sniper";
		taskIcon = "kill";
		missionNamespace setVariable ["sniper" + str side player, player];
		
	}; // Sniper
	case ("ACE_HuntIR_monitor" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {
		
		pickedRole = "scout";
		taskIcon = "scout";
		missionNamespace setVariable ["scout" + str side player, player];
		
	}; // Scout
	case ("30Rnd_45ACP_Mag_SMG_01_Tracer_Red" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {
		
		pickedRole = "assassin";
		taskIcon = "run";
		missionNamespace setVariable ["assassin" + str side player, player];
		
	}; // Assassin
	case ("ACE_M26_Clacker" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {
		
		pickedRole = "explosive";
		taskIcon = "destroy";
		missionNamespace setVariable ["explosive" + str side player, player];
		
	}; // Explosive
	case ("ACE_Cellphone" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)): {
		
		pickedRole = "distractor";
		taskIcon = "listen";
		missionNamespace setVariable ["distractor" + str side player, player];
		execVM "roles\distractor\hackingDistractor.sqf";
		execVM "roles\distractor\shotsDistractor.sqf";
		
	}; // Distractor

};
switch (side player) do {

	case east: {eastRoles = missionNamespace getVariable "eastRoles", eastRoles pushBack pickedRole, publicVariable "eastRoles"};
	case west: {westRoles = missionNamespace getVariable "westRoles", westRoles pushBack pickedRole, publicVariable "westRoles"};

};
switch (player) do {

	case p1: {p1TaskIcon = taskIcon, publicVariable "p1TaskIcon";};
	case p2: {p2TaskIcon = taskIcon, publicVariable "p2TaskIcon";};
	case p3: {p3TaskIcon = taskIcon, publicVariable "p3TaskIcon";};
	case p4: {p4TaskIcon = taskIcon, publicVariable "p4TaskIcon";};
	case p5: {p5TaskIcon = taskIcon, publicVariable "p5TaskIcon";};
	case p6: {p6TaskIcon = taskIcon, publicVariable "p6TaskIcon";};
	case p7: {p7TaskIcon = taskIcon, publicVariable "p7TaskIcon";};
	case p8: {p8TaskIcon = taskIcon, publicVariable "p8TaskIcon";};

};