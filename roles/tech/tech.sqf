watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
westTechIdle = true;
eastTechIdle = true;	
publicVariable "westTechIdle";
publicVariable "eastTechIdle";

if (side player == west) then {

		techCondition = "watchtowerAvailable && eastTechIdle";
		
} else {
		
		techCondition = "watchtowerAvailable && westTechIdle";

};

[
player,
"Mark enemies",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
techCondition,
"true",

{

	// systemChat "Started";

	if (side player == west) then {
					
		westTechIdle = false;
		publicVariable "westTechIdle";

	} else {
					
		eastTechIdle = false;
		publicVariable "eastTechIdle";

	};
			
},


{

	params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
	if (watchtowerAvailable == false) then {

		// systemChat "Aborted";
		if (side player == west) then {

			westTechIdle = true;
			publicVariable "westTechIdle";

		} else {

			eastTechIdle = true;
			publicVariable "eastTechIdle";

		};
		
	};

},


{ 

	// systemChat "Succesful";
	if (side player == west) then {

		techMarkingEast = execVM "watchtower\marking\techMarkingEast.sqf";

	} else {

		techMarkingWest = execVM "watchtower\marking\techMarkingWest.sqf";

	};

},


{

	// systemChat "Canceled";
	if (side player == west) then {

		westTechIdle = true;
		publicVariable "westTechIdle";

	} else {

		eastTechIdle = true;
		publicVariable "eastTechIdle";

	};

},

[],
5,
nil,
true,
false
] call BIS_fnc_holdActionAdd;