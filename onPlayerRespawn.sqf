player switchMove "HubSpectator_stand";
[[], "mechanics\spectator.sqf"] remoteExec ["execVM", 0, true];

if  ("30Rnd_9x21_Red_Mag" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {

	player setUnitTrait ["Engineer", true];
	[[], "roles\tech\tech.sqf"] remoteExec ["execVM", player, true];
	hint "Tech";
	switch (side player) do {

		case east: {eastRoles = missionNamespace getVariable "eastRoles", eastRoles pushBack "tech", publicVariable "eastRoles"};
		case west: {westRoles = missionNamespace getVariable "westRoles", westRoles pushBack "tech", publicVariable "westRoles"};

	};
	switch (player) do {

		case p1: {p1TaskIcon = "intel", publicVariable "p1TaskIcon"};
		case p2: {p2TaskIcon = "intel", publicVariable "p2TaskIcon"};
		case p3: {p3TaskIcon = "intel", publicVariable "p3TaskIcon"};
		case p4: {p4TaskIcon = "intel", publicVariable "p4TaskIcon"};
		case p5: {p5TaskIcon = "intel", publicVariable "p5TaskIcon"};
		case p6: {p6TaskIcon = "intel", publicVariable "p6TaskIcon"};
		case p7: {p7TaskIcon = "intel", publicVariable "p7TaskIcon"};
		case p8: {p8TaskIcon = "intel", publicVariable "p8TaskIcon"};

	};

};

if  ("Medikit" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {

	player setUnitTrait ["Medic", true];
	hint "Medic";
	switch (side player) do {

		case east: {eastRoles = missionNamespace getVariable "eastRoles", eastRoles pushBack "medic", publicVariable "eastRoles"};
		case west: {westRoles = missionNamespace getVariable "westRoles", westRoles pushBack "medic", publicVariable "westRoles"};

	};
	switch (player) do {

		case p1: {p1TaskIcon = "heal", publicVariable "p1TaskIcon"};
		case p2: {p2TaskIcon = "heal", publicVariable "p2TaskIcon"};
		case p3: {p3TaskIcon = "heal", publicVariable "p3TaskIcon"};
		case p4: {p4TaskIcon = "heal", publicVariable "p4TaskIcon"};
		case p5: {p5TaskIcon = "heal", publicVariable "p5TaskIcon"};
		case p6: {p6TaskIcon = "heal", publicVariable "p6TaskIcon"};
		case p7: {p7TaskIcon = "heal", publicVariable "p7TaskIcon"};
		case p8: {p8TaskIcon = "heal", publicVariable "p8TaskIcon"};

	};

};

if  ("ACE_10Rnd_762x51_Mag_Tracer" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {

	/*player setUnitTrait ["Medic", true];*/
	hint "Sniper";
	switch (side player) do {

		case east: {eastRoles = missionNamespace getVariable "eastRoles", eastRoles pushBack "sniper", publicVariable "eastRoles"};
		case west: {westRoles = missionNamespace getVariable "westRoles", westRoles pushBack "sniper", publicVariable "westRoles"};

	};
	switch (player) do {

		case p1: {p1TaskIcon = "heal", publicVariable "p1TaskIcon"};
		case p2: {p2TaskIcon = "heal", publicVariable "p2TaskIcon"};
		case p3: {p3TaskIcon = "heal", publicVariable "p3TaskIcon"};
		case p4: {p4TaskIcon = "heal", publicVariable "p4TaskIcon"};
		case p5: {p5TaskIcon = "heal", publicVariable "p5TaskIcon"};
		case p6: {p6TaskIcon = "heal", publicVariable "p6TaskIcon"};
		case p7: {p7TaskIcon = "heal", publicVariable "p7TaskIcon"};
		case p8: {p8TaskIcon = "heal", publicVariable "p8TaskIcon"};

	};

};

if  ("ACE_HuntIR_monitor" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {

	/*player setUnitTrait ["Medic", true];*/
	hint "Scout";
	switch (side player) do {

		case east: {eastRoles = missionNamespace getVariable "eastRoles", eastRoles pushBack "scout", publicVariable "eastRoles"};
		case west: {westRoles = missionNamespace getVariable "westRoles", westRoles pushBack "scout", publicVariable "westRoles"};

	};
	switch (player) do {

		case p1: {p1TaskIcon = "scout", publicVariable "p1TaskIcon"};
		case p2: {p2TaskIcon = "scout", publicVariable "p2TaskIcon"};
		case p3: {p3TaskIcon = "scout", publicVariable "p3TaskIcon"};
		case p4: {p4TaskIcon = "scout", publicVariable "p4TaskIcon"};
		case p5: {p5TaskIcon = "scout", publicVariable "p5TaskIcon"};
		case p6: {p6TaskIcon = "scout", publicVariable "p6TaskIcon"};
		case p7: {p7TaskIcon = "scout", publicVariable "p7TaskIcon"};
		case p8: {p8TaskIcon = "scout", publicVariable "p8TaskIcon"};

	};

};

if  ("30Rnd_45ACP_Mag_SMG_01_Tracer_Red" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {

	/*player setUnitTrait ["Medic", true];*/
	hint "Assassin";
	switch (side player) do {

		case east: {eastRoles = missionNamespace getVariable "eastRoles", eastRoles pushBack "assassin", publicVariable "eastRoles"};
		case west: {westRoles = missionNamespace getVariable "westRoles", westRoles pushBack "assassin", publicVariable "westRoles"};

	};
	switch (player) do {

		case p1: {p1TaskIcon = "run", publicVariable "p1TaskIcon"};
		case p2: {p2TaskIcon = "run", publicVariable "p2TaskIcon"};
		case p3: {p3TaskIcon = "run", publicVariable "p3TaskIcon"};
		case p4: {p4TaskIcon = "run", publicVariable "p4TaskIcon"};
		case p5: {p5TaskIcon = "run", publicVariable "p5TaskIcon"};
		case p6: {p6TaskIcon = "run", publicVariable "p6TaskIcon"};
		case p7: {p7TaskIcon = "run", publicVariable "p7TaskIcon"};
		case p8: {p8TaskIcon = "run", publicVariable "p8TaskIcon"};

	};

};

if  ("ACE_M26_Clacker" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {

	player setUnitTrait ["ExplosiveSpecialist", true];
	hint "Explosive";
	switch (side player) do {

		case east: {eastRoles = missionNamespace getVariable "eastRoles", eastRoles pushBack "explosive", publicVariable "eastRoles"};
		case west: {westRoles = missionNamespace getVariable "westRoles", westRoles pushBack "explosive", publicVariable "westRoles"};

	};
	switch (player) do {

		case p1: {p1TaskIcon = "destroy", publicVariable "p1TaskIcon"};
		case p2: {p2TaskIcon = "destroy", publicVariable "p2TaskIcon"};
		case p3: {p3TaskIcon = "destroy", publicVariable "p3TaskIcon"};
		case p4: {p4TaskIcon = "destroy", publicVariable "p4TaskIcon"};
		case p5: {p5TaskIcon = "destroy", publicVariable "p5TaskIcon"};
		case p6: {p6TaskIcon = "destroy", publicVariable "p6TaskIcon"};
		case p7: {p7TaskIcon = "destroy", publicVariable "p7TaskIcon"};
		case p8: {p8TaskIcon = "destroy", publicVariable "p8TaskIcon"};

	};

};