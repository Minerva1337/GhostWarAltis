_arr = [];
switch ("intel") do {

	case p1TaskIcon: {_arr pushBack = p1};
	case p2TaskIcon: {_arr pushBack = p2};
	case p3TaskIcon: {_arr pushBack = p3};
	case p4TaskIcon: {_arr pushBack = p4};
	default {_arr pushBack = "none"};

};

switch ("intel") do {
	
	case p5TaskIcon: {_arr pushBack = p5};
	case p6TaskIcon: {_arr pushBack = p6};
	case p7TaskIcon: {_arr pushBack = p7};
	case p8TaskIcon: {_arr pushBack = p8};
	default {_arr pushBack = "none"};
	
};
waitUntil {	
	
	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
	watchtowerAvailable == true,
	sleep 0.2,
		
};
if ("none" in _arr) then {

- rausfinden welche seite keinen Tech hat 
- gleiches Wie unten für einen Tech der jeweiligen Seite






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

};
while {true} do {

	watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable",
	eastTechHacking = missionNamespace getVariable "eastTechHacking",
	westTechHacking = missionNamespace getVariable "westTechHacking",
	if (watchtowerAvailable == false) then {

		[_arr select 1, eastHoldActionID] call BIS_fnc_holdActionRemove;
		[_arr select 0, westHoldActionID] call BIS_fnc_holdActionRemove;
		eastTechHacking = false;
		westTechHacking = false;
		publicVariable "eastTechHacking";
		publicVariable "westTechHacking";
		eastHoldActionExists = false;
		westHoldActionExists = false;

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
			
		}; // Wenn holdAction noch nicht existiert und alle Bedingungen erfüllt sind -> west-Spieler bekommt holdAction

	}; // Wenn Watchtower nicht gehackt wird -> unter Bedingungen wieder geben
	sleep 0.2;
	
};		





/*

!- herausfinden ob und welche Spieler Tech sind 
!- diese in einen Array schreiben _techs = [p1,p5]
!- nach x Sekunden die Tech Fähigkeit geben (watchtowerAvailable)

!- sobald ein Tech anfängt dem anderen die Fähigkeit wegnehmen
!- sobald Watchtower gehackt wird beiden die Fähigkeit wegnehmen (watchtowerAvailable)
!- solange Watchtower Aktiv beiden die Fähigkeit wegnehmen (watchtowerAvailable)
!- nach Aktivieren der Fähigkeit x Sekunden Cooldown