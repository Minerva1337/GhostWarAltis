
	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
	eastTechIdle = true;
	publicVariable "eastTechIdle";

	[
		player,
		"Mark enemies",
		"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",
		"\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",
		"(watchtowerAvailable && eastTechIdle)", // condition shown
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
			

		},

		{

			params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
			watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
			if (watchtowerAvailable == false) then {
				
				systemChat "Aborted";
				[player, _actionId] call BIS_fnc_holdActionRemove;

			};

		},


		{ 

			systemChat "Succesful";
			if (side player == west) then {
				
				techMarkingEast = execVM "watchtower\marking\techMarkingEast.sqf";
				westTechIdle = true;
				publicVariable "westTechIdle";

			} else {

				techMarkingWest = execVM "watchtower\marking\techMarkingWest.sqf";
				eastTechIdle = true;
				publicVariable "eastTechIdle";

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

		},


		[], 5, nil, true, false

	] call BIS_fnc_holdActionAdd;