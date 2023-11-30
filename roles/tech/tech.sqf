watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
if (side player == west) then {

		_condition = "watchtowerAvailable && eastTechIdle";
		westTechIdle = true;
		publicVariable "westTechIdle";
		
} else {
		
		_condition = "watchtowerAvailable && westTechIdle";
		eastTechIdle = true;
		publicVariable "eastTechIdle";

};

[
player,
"Mark enemies",
"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",
"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",
_condition,
"true",

{

	systemChat "Started";

	if (side player == west) then {
					
		westTechIdle = false;
		publicVariable "westTechIdle";

	} else {
					
		eastTechIdle = false;
		publicVariable "eastTechIdle";

	};

	if (isServer) then {
		
		[player, "KNEEL_TREAT"] remoteExecCall ["BIS_fnc_ambientAnim"]; 
		
	};
			
},


{

	params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
	if (watchtowerAvailable == false) then {

		systemChat "Aborted";
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

	systemChat "Succesful";
	if (side player == west) then {

		techMarkingEast = execVM "watchtower\marking\techMarkingEast.sqf";

	} else {

		techMarkingWest = execVM "watchtower\marking\techMarkingWest.sqf";

	};

	if (isServer) then {
		
		[player] remoteExecCall ["BIS_fnc_ambientAnim__terminate"]; 
		
	};

},


{

	systemChat "Canceled";
	if (side player == west) then {

		westTechIdle = true;
		publicVariable "westTechIdle";

	} else {

		eastTechIdle = true;
		publicVariable "eastTechIdle";

	};

	if (isServer) then {
		
		[player] remoteExecCall ["BIS_fnc_ambientAnim__terminate"]; 
		
	};

},

[],
5,
nil,
true,
false
] call BIS_fnc_holdActionAdd;