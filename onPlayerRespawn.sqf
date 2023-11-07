player switchMove "HubSpectator_stand";
[[], "mechanics\spectator.sqf"] remoteExec ["execVM", 0, true];

if  ("XXXXXX" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["Engineer", true];
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
	if (player == p1) then {p1TaskIcon = "heal"};
	if (player == p2) then {p2TaskIcon = "heal"};
	if (player == p3) then {p3TaskIcon = "heal"};
	if (player == p4) then {p4TaskIcon = "heal"};
	if (player == p5) then {p5TaskIcon = "heal"};
	if (player == p6) then {p6TaskIcon = "heal"};
	if (player == p7) then {p7TaskIcon = "heal"};
	if (player == p8) then {p8TaskIcon = "heal"};};

if  ("7Rnd_408_Mag" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["Medic", true];
	hint "Sniper";
	if (player == p1) then {p1TaskIcon = "kill"};
	if (player == p2) then {p2TaskIcon = "kill"};
	if (player == p3) then {p3TaskIcon = "kill"};
	if (player == p4) then {p4TaskIcon = "kill"};
	if (player == p5) then {p5TaskIcon = "kill"};
	if (player == p6) then {p6TaskIcon = "kill"};
	if (player == p7) then {p7TaskIcon = "kill"};
	if (player == p8) then {p8TaskIcon = "kill"};};

if  ("ACE_HuntIR_monitor" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["Medic", true];
	hint "Scout";
	if (player == p1) then {p1TaskIcon = "scout"};
	if (player == p2) then {p2TaskIcon = "scout"};
	if (player == p3) then {p3TaskIcon = "scout"};
	if (player == p4) then {p4TaskIcon = "scout"};
	if (player == p5) then {p5TaskIcon = "scout"};
	if (player == p6) then {p6TaskIcon = "scout"};
	if (player == p7) then {p7TaskIcon = "scout"};
	if (player == p8) then {p8TaskIcon = "scout"};};

if  ("30Rnd_45ACP_Mag_SMG_01" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["Medic", true];
	hint "Assassin";
	if (player == p1) then {p1TaskIcon = "run"};
	if (player == p2) then {p2TaskIcon = "run"};
	if (player == p3) then {p3TaskIcon = "run"};
	if (player == p4) then {p4TaskIcon = "run"};
	if (player == p5) then {p5TaskIcon = "run"};
	if (player == p6) then {p6TaskIcon = "run"};
	if (player == p7) then {p7TaskIcon = "run"};
	if (player == p8) then {p8TaskIcon = "run"};};

if  ("APERSMineDispenser_Mag" in (vestItems player + uniformItems player + backpackItems player + assignedItems player)) then {
	player setUnitTrait ["ExplosiveSpecialist", true];
	hint "Explosive";
	if (player == p1) then {p1TaskIcon = "destroy"};
	if (player == p2) then {p2TaskIcon = "destroy"};
	if (player == p3) then {p3TaskIcon = "destroy"};
	if (player == p4) then {p4TaskIcon = "destroy"};
	if (player == p5) then {p5TaskIcon = "destroy"};
	if (player == p6) then {p6TaskIcon = "destroy"};
	if (player == p7) then {p7TaskIcon = "destroy"};
	if (player == p8) then {p8TaskIcon = "destroy"};};