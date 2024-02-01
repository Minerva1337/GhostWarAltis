techeast = missionNamespace getVariable "techeast";
techwest = missionNamespace getVariable "techwest";

waitUntil {	
	
	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
	watchtowerAvailable == true,
	sleep 0.2,
		
};
if ((isNil techEast) or (isNil techWest)) then {

	switch (true) do {

		case (isNil techEast): {soloTech = techwest};
		case (isNil techwest): {soloTech = techeast};
		
	};

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
	soloTechCooldown = false;
	publicVariable "soloHoldActionExists";
	publicVariable "soloTechCooldown";


	while {true} do {

		watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
		soloHoldActionExists = missionNamespace getVariable "soloHoldActionExists",
		soloTechCooldown = missionNamespace getVariable "soloTechCooldown",

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
		sleep 0.2;
	};
	
} else {

	eastHoldActionID = [

		techeast, // p1 / p2 / p3 / p4 (east)
		"Mark enemies",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{
		
			// systemChat "Started";			
			eastTechHacking = true;
			publicVariable "eastTechHacking";
					
		}
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
	westTechCooldown = false;
	publicVariable "eastHoldActionExists";
	publicVariable "westTechCooldown";

	westHoldActionID = [

		techwest, // p5 / p6 / p7 / p8 (west)
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
	westTechCooldown = false;
	publicVariable "westHoldActionExists";
	publicVariable "westTechCooldown";


	while {true} do {

		watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
		eastTechHacking = missionNamespace getVariable "eastTechHacking",
		westTechHacking = missionNamespace getVariable "westTechHacking",
		westHoldActionExists = missionNamespace getVariable "westTechHacking",
		eastHoldActionExists = missionNamespace getVariable "westTechHacking",

		if (watchtowerAvailable == false) then {

			if (eastHoldActionExists == true) then {
				
				[techeast, eastHoldActionID] call BIS_fnc_holdActionRemove;
				eastHoldActionExists = false;
				eastTechHacking = false;
				publicVariable "eastTechHacking";

			};
			if (westHoldActionExists == true) then {
				
				[techwest, westHoldActionID] call BIS_fnc_holdActionRemove;
				westHoldActionExists = false;
				westTechHacking = false;	
				publicVariable "westTechHacking";

			};
			

		}; // Wenn Watchtower gehackt wird -> beide entfernen

		if ((eastTechHacking == true) && (westHoldActionExists = true)) then {

			[techeast, westHoldActionID] call BIS_fnc_holdActionRemove;
			westHoldActionExists = false;

		}; // Wenn east-Spieler Fähigkeit benutzt -> west-Spieler entfernen

		if ((westTechHacking == true) && (eastHoldActionExists = true)) then {

			[techwest, eastHoldActionID] call BIS_fnc_holdActionRemove;
			eastHoldActionExists = false;

		}; // Wenn west-Spieler Fähigkeit benutzt -> east-Spieler entfernen

		if (watchtowerAvailable == true) then {

			if ((eastHoldActionExists == false) && (eastTechCooldown == false)) then {

				eastHoldActionID = [

					techeast, // p1 / p2 / p3 / p4 (east)
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

			if ((westHoldActionExists == false) && (westTechCooldown == false)) then {

				westHoldActionID = [

					techwest, // p5 / p6 / p7 / p8 (west)
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