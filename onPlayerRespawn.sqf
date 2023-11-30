player switchMove "HubSpectator_stand";
[[], "mechanics\spectator.sqf"] remoteExec ["execVM", 0, true];

if  ("30Rnd_9x21_Red_Mag" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["Engineer", true];
	if (side player == west) then {
		
		[[], "roles\tech\westTech.sqf"] remoteExec ["execVM", player, true];

	} else {

		[[], "roles\tech\eastTech.sqf"] remoteExec ["execVM", player, true];
		
	};
	hint "Tech";
	if (player == p1) then {p1TaskIcon = "intel";
	publicVariable "p1TaskIcon"};
	if (player == p2) then {p2TaskIcon = "intel";
	publicVariable "p2TaskIcon"};
	if (player == p3) then {p3TaskIcon = "intel";
	publicVariable "p3TaskIcon"};
	if (player == p4) then {p4TaskIcon = "intel";
	publicVariable "p4TaskIcon"};
	if (player == p5) then {p5TaskIcon = "intel";
	publicVariable "p5TaskIcon"};
	if (player == p6) then {p6TaskIcon = "intel";
	publicVariable "p6TaskIcon"};
	if (player == p7) then {p7TaskIcon = "intel";
	publicVariable "p7TaskIcon"};
	if (player == p8) then {p8TaskIcon = "intel";
	publicVariable "p8TaskIcon"};};

if  ("Medikit" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["Medic", true];
	hint "Medic";
	if (player == p1) then {p1TaskIcon = "heal";
	publicVariable "p1TaskIcon"};
	if (player == p2) then {p2TaskIcon = "heal";
	publicVariable "p2TaskIcon"};
	if (player == p3) then {p3TaskIcon = "heal";
	publicVariable "p3TaskIcon"};
	if (player == p4) then {p4TaskIcon = "heal";
	publicVariable "p4TaskIcon"};
	if (player == p5) then {p5TaskIcon = "heal";
	publicVariable "p5TaskIcon"};
	if (player == p6) then {p6TaskIcon = "heal";
	publicVariable "p6TaskIcon"};
	if (player == p7) then {p7TaskIcon = "heal";
	publicVariable "p7TaskIcon"};
	if (player == p8) then {p8TaskIcon = "heal";
	publicVariable "p8TaskIcon"};};

if  ("ACE_10Rnd_762x51_Mag_Tracer" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	/*player setUnitTrait ["Medic", true];*/
	hint "Sniper";
	if (player == p1) then {p1TaskIcon = "kill";
	publicVariable "p1TaskIcon"};
	if (player == p2) then {p2TaskIcon = "kill";
	publicVariable "p2TaskIcon"};
	if (player == p3) then {p3TaskIcon = "kill";
	publicVariable "p3TaskIcon"};
	if (player == p4) then {p4TaskIcon = "kill";
	publicVariable "p4TaskIcon"};
	if (player == p5) then {p5TaskIcon = "kill";
	publicVariable "p5TaskIcon"};
	if (player == p6) then {p6TaskIcon = "kill";
	publicVariable "p6TaskIcon"};
	if (player == p7) then {p7TaskIcon = "kill";
	publicVariable "p7TaskIcon"};
	if (player == p8) then {p8TaskIcon = "kill";
	publicVariable "p8TaskIcon"};};

if  ("ACE_HuntIR_monitor" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	/*player setUnitTrait ["Medic", true];*/
	hint "Scout";
	if (player == p1) then {p1TaskIcon = "scout";
	publicVariable "p1TaskIcon"};
	if (player == p2) then {p2TaskIcon = "scout";
	publicVariable "p2TaskIcon"};
	if (player == p3) then {p3TaskIcon = "scout";
	publicVariable "p3TaskIcon"};
	if (player == p4) then {p4TaskIcon = "scout";
	publicVariable "p4TaskIcon"};
	if (player == p5) then {p5TaskIcon = "scout";
	publicVariable "p5TaskIcon"};
	if (player == p6) then {p6TaskIcon = "scout";
	publicVariable "p6TaskIcon"};
	if (player == p7) then {p7TaskIcon = "scout";
	publicVariable "p7TaskIcon"};
	if (player == p8) then {p8TaskIcon = "scout";
	publicVariable "p8TaskIcon"};};

if  ("30Rnd_45ACP_Mag_SMG_01_Tracer_Red" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	/*player setUnitTrait ["Medic", true];*/
	hint "Assassin";
	if (player == p1) then {p1TaskIcon = "run";
	publicVariable "p1TaskIcon"};
	if (player == p2) then {p2TaskIcon = "run";
	publicVariable "p2TaskIcon"};
	if (player == p3) then {p3TaskIcon = "run";
	publicVariable "p3TaskIcon"};
	if (player == p4) then {p4TaskIcon = "run";
	publicVariable "p4TaskIcon"};
	if (player == p5) then {p5TaskIcon = "run";
	publicVariable "p5TaskIcon"};
	if (player == p6) then {p6TaskIcon = "run";
	publicVariable "p6TaskIcon"};
	if (player == p7) then {p7TaskIcon = "run";
	publicVariable "p7TaskIcon"};
	if (player == p8) then {p8TaskIcon = "run";
	publicVariable "p8TaskIcon"};};

if  ("ACE_M26_Clacker" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["ExplosiveSpecialist", true];
	hint "Explosive";
	if (player == p1) then {p1TaskIcon = "destroy";
	publicVariable "p1TaskIcon"};
	if (player == p2) then {p2TaskIcon = "destroy";
	publicVariable "p2TaskIcon"};
	if (player == p3) then {p3TaskIcon = "destroy";
	publicVariable "p3TaskIcon"};
	if (player == p4) then {p4TaskIcon = "destroy";
	publicVariable "p4TaskIcon"};
	if (player == p5) then {p5TaskIcon = "destroy";
	publicVariable "p5TaskIcon"};
	if (player == p6) then {p6TaskIcon = "destroy";
	publicVariable "p6TaskIcon"};
	if (player == p7) then {p7TaskIcon = "destroy";
	publicVariable "p7TaskIcon"};
	if (player == p8) then {p8TaskIcon = "destroy";
	publicVariable "p8TaskIcon"};};