_arr = [];
switch ("intel") do {

	case p1TaskIcon: {_arr pushBack = p1};
	case p2TaskIcon: {_arr pushBack = p2};
	case p3TaskIcon: {_arr pushBack = p3};
	case p4TaskIcon: {_arr pushBack = p4};
	default {_arr pushBack = nil};

};

switch ("intel") do {
	
	case p5TaskIcon: {_arr pushBack = p5};
	case p6TaskIcon: {_arr pushBack = p6};
	case p7TaskIcon: {_arr pushBack = p7};
	case p8TaskIcon: {_arr pushBack = p8};
	default {_arr pushBack = nil};
	
};
waitUntil {	
	
	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
	watchtowerAvailable == true,
	sleep 0.2,
		
};
if (nil in _arr) then {

	switch (true) do {

		case ((_arr select 0) == (_arr select 1)): {};
		case ((_arr select 0) == nil): {
			
			soloTechSide = west;
			soloTech = _arr select 1;
		
		};
		case ((_arr select 1) == nil): {
			
			soloTechSide = east;
			soloTech = _arr select 0;
		
		};
		
	}; // Sortierung ob east oder west ist solo-Tech
	
	soloHoldActionID = [

		soloTech,
		"Mark enemies",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{},
		{},
		{ 

			// systemChat "Succesful";
			params ["_target", "_caller", "_actionId", "_arguments"];
			switch (_caller) do {

				case p1 or p2 or p3 or p4: {techMarkingWest = [[], "roles\tech\techMarkingWest.sqf"] remoteExec ["execVM", 2];};
				case p5 or p6 or p7 or p8: {techMarkingEast = [[], "roles\tech\techMarkingEast.sqf"] remoteExec ["execVM", 2];};

			};				
			soloHoldActionExists = false;
			publicVariable "soloHoldActionExists";
		
		},			
		{},
		[],
		techActionTime,
		nil,
		true,
		false,
		false
				
	] call BIS_fnc_holdActionAdd; // holdAction für solo-Spieler
	soloHoldActionExists = true;
	publicVariable "soloHoldActionExists";
	while {true} do {

		watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
		soloHoldActionExists = missionNamespace getVariable "soloHoldActionExists",
		if ((watchtowerAvailable == false) && (soloHoldActionExists == true)) then {

			[soloTech, soloHoldActionID] call BIS_fnc_holdActionRemove;
			soloHoldActionExists = false;
			publicVariable "soloHoldActionExists";

		}; // Wenn Watchtower gehackt wird -> entfernen
		if ((watchtowerAvailable == true) && (soloHoldActionExists == false) && (soloTechCooldown == false)) then {
			
			soloHoldActionID = [

				soloTech,
				"Mark enemies",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
				"true",
				"true",
				{},
				{},
				{ 
		
					// systemChat "Succesful";
					params ["_target", "_caller", "_actionId", "_arguments"];
					switch (_caller) do {
		
						case p1 or p2 or p3 or p4: {techMarkingWest = [[], "roles\tech\techMarkingWest.sqf"] remoteExec ["execVM", 2];};
						case p5 or p6 or p7 or p8: {techMarkingEast = [[], "roles\tech\techMarkingEast.sqf"] remoteExec ["execVM", 2];};
		
					};				
					soloHoldActionExists = false;
					publicVariable "soloHoldActionExists";
				
				},			
				{},
				[],
				techActionTime,
				nil,
				true,
				false,
				false
						
			] call BIS_fnc_holdActionAdd; // holdAction für solo-Spieler
			soloHoldActionExists = true;
			publicVariable "soloHoldActionExists";

		}; // Wenn Bedinungen erfüllt -> holdAction für solo-Spieler
	};
	
} else {

	eastHoldActionID = [

		_arr select 1, // p1 / p2 / p3 / p4 (east)
		"Mark enemies",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{
		
			// systemChat "Started";			
			eastTechHacking = true;
			publicVariable "eastTechHacking";
					
		},
		{},
		{ 
		
			// systemChat "Succesful";		
			techMarkingWest = [[], "roles\tech\techMarkingWest.sqf"] remoteExec ["execVM", 2];
			eastHoldActionExists = false;
			publicVariable "eastHoldActionExists";

		
		},
		
		
		{
		
			// systemChat "Canceled";
			eastTechHacking = false;
			publicVariable "eastTechHacking";
		
		},
		
		[],
		techActionTime,
		nil,
		true,
		false,
		false
		
	] call BIS_fnc_holdActionAdd; // holdAction für east-Spieler
	eastHoldActionExists = true;

	westHoldActionID = [

		_arr select 0, // p5 / p6 / p7 / p8 (west)
		"Mark enemies",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{
		
			// systemChat "Started";			
			westTechHacking = true;
			publicVariable "westTechHacking";
					
		},
		{},
		{ 
		
			// systemChat "Succesful";		
			techMarkingEast = [[], "roles\tech\techMarkingEast.sqf"] remoteExec ["execVM", 2];
			westHoldActionExists = false;
			publicVariable "westHoldActionExists";
		
		},
		
		
		{
		
			// systemChat "Canceled";
			westTechHacking = false;
			publicVariable "westTechHacking";
		
		},
		
		[],
		techActionTime,
		nil,
		true,
		false,
		false
		
	] call BIS_fnc_holdActionAdd; // holdAction für west-Spieler
	westHoldActionExists = true;

	while {true} do {

		watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
		eastTechHacking = missionNamespace getVariable "eastTechHacking",
		westTechHacking = missionNamespace getVariable "westTechHacking",
		if (watchtowerAvailable == false) then {

			if (eastHoldActionExists == true) then {
				
				[_arr select 1, eastHoldActionID] call BIS_fnc_holdActionRemove;
				eastHoldActionExists = false;
				eastTechHacking = false;
				publicVariable "eastTechHacking";

			};
			if (westHoldActionExists == true) then {
				
				[_arr select 0, westHoldActionID] call BIS_fnc_holdActionRemove;
				westHoldActionExists = false;
				westTechHacking = false;	
				publicVariable "westTechHacking";

			};
			

		}; // Wenn Watchtower gehackt wird -> beide entfernen

		if ((eastTechHacking == true) && (westHoldActionExists = true)) then {

			[_arr select 0, westHoldActionID] call BIS_fnc_holdActionRemove;
			westHoldActionExists = false;

		}; // Wenn east-Spieler Fähigkeit benutzt -> west-Spieler entfernen

		if ((westTechHacking == true) && (eastHoldActionExists = true)) then {

			[_arr select 1, eastHoldActionID] call BIS_fnc_holdActionRemove;
			eastHoldActionExists = false;

		}; // Wenn west-Spieler Fähigkeit benutzt -> east-Spieler entfernen

		if (watchtowerAvailable == true) then {

			if ((eastHoldActionExists == false) && (eastTechCooldown == false) && (westTechHacking = false)) then {

				eastHoldActionID = [

					_arr select 1, // p1 / p2 / p3 / p4 (east)
					"Mark enemies",
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
					"true",
					"true",
					{
					
						// systemChat "Started";			
						eastTechHacking = true;
						publicVariable "eastTechHacking";
								
					},
					{},
					{ 
					
						// systemChat "Succesful";		
						techMarkingWest = [[], "roles\tech\techMarkingWest.sqf"] remoteExec ["execVM", 2];
						eastHoldActionExists = false;
						publicVariable "eastHoldActionExists";
					
					},
					
					
					{
					
						// systemChat "Canceled";
						eastTechHacking = false;
						publicVariable "eastTechHacking";
					
					},
					
					[],
					techActionTime,
					nil,
					true,
					false,
					false
					
				] call BIS_fnc_holdActionAdd; // holdAction für east-Spieler
				eastHoldActionExists = true;
				publicVariable "eastHoldActionExists";
				
			}; // Wenn holdAction noch nicht existiert und alle Bedingungen erfüllt sind -> east-Spieler bekommt holdAction

			if ((westHoldActionExists == false) && (westTechCooldown == false) && (eastTechHacking = false)) then {

				westHoldActionID = [

					_arr select 0, // p5 / p6 / p7 / p8 (west)
					"Mark enemies",
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
					"true",
					"true",
					{
					
						// systemChat "Started";			
						westTechHacking = true;
						publicVariable "westTechHacking";
								
					},
					{},
					{ 
					
						// systemChat "Succesful";		
						techMarkingEast = [[], "roles\tech\techMarkingEast.sqf"] remoteExec ["execVM", 2];
						westHoldActionExists = false;
						publicVariable "westHoldActionExists";
					
					},
					
					
					{
					
						// systemChat "Canceled";
						westTechHacking = false;
						publicVariable "westTechHacking";
					
					},
					
					[],
					techActionTime,
					nil,
					true,
					false,
					false
					
				] call BIS_fnc_holdActionAdd; // holdAction für west-Spieler
				westHoldActionExists = true;
				publicVariable "westHoldActionExists";
				
			}; // Wenn holdAction noch nicht existiert und alle Bedingungen erfüllt sind -> west-Spieler bekommt holdAction

		}; // Wenn Watchtower nicht gehackt wird -> unter Bedingungen wieder geben
		sleep 0.2;
		
	};		

};