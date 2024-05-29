//Game:

		versionNumber = 0.1;									// Game-Version of the files for future reference
		gameTime = 900; 										// Round time in seconds
		outOfMapKillTime = 10;									// Seconds when players out of map are killed
		// randomWeather = true;									// Different weather and Times every game. If false: Sunny, 12pm

// Watchtower

		watchtowerAvailable = true;								// If watchtower is available
		watchtowerInitiate = 120;								// Seconds until watchtower is available after gamestart
		watchtowerHackingTime = 10;								// Seconds to hack watchtower
		watchtowerMarkingTime = 30;								// Seconds the enemies are marked
		watchtowerCooldown = 120;								// Seconds until watchtower is available again

// Roles

	// Tech

		techAvailable = false;									// If tech is available
		techActionTime = 10;									// Seconds to initiate the ability
		techMarkingTime = 3;									// Seconds the enemies are marked (x2 wegen script)
		techCooldown = 120;										// Seconds until ability is available again

	// Medic

		medicAvailable = false;									// If medic is available
		healingMedicSleep = 200;								//How long it takes until Medic ability is ready again
		medicHealingAreaX = 10;									//X Axis of the healing area
		medicHealingAreaY = 10;									//Y Axis of the healing area

	// Sniper

		sniperAvailable = true;									// If sniper is available

	// Scout

		scoutAvailable = true;									// If scout is available

	// Assassin

		assassinAvailable = true;								// If assassin is available

	// Explosive

		explosiveAvailable = true;								// If explosive is available

	// Distractor	

		distractorAvailable = true;								// If distractor is available
		hackingDistracorSleep = 200;							//How long it takes until hacking Sound ability is ready again
		shotsDistracorSleep = 200;								//How long it takes until shooting Sound ability is ready again
		shotsDistractorNumber = [6, 7, 8, 9, 10, 8, 9, 7];		//How many shots the AI shoots











		doubleWatchtowerMarkingTime = watchtowerMarkingTime + watchtowerMarkingTime;
		doubleTechMarkingTime = techMarkingTime + techMarkingTime;
		watchtowerTaskID = 0;
		taskID = 100;
		eastRoles = [];
		westRoles = [];
		if (techAvailable == false) then {

			eastRoles pushBack "tech";
			westRoles pushBack "tech";
			
		};
		if (medicAvailable == false) then {

			eastRoles pushBack "medic";
			westRoles pushBack "medic";
			
		};
		if (sniperAvailable == false) then {

			eastRoles pushBack "sniper";
			westRoles pushBack "sniper";
			
		};
		if (scoutAvailable == false) then {

			eastRoles pushBack "scout";
			westRoles pushBack "scout";
			
		};
		if (assassinAvailable == false) then {

			eastRoles pushBack "assassin";
			westRoles pushBack "assassin";
			
		};
		if (explosiveAvailable == false) then {

			eastRoles pushBack "explosive";
			westRoles pushBack "explosive";
			
		};
		if (distractorAvailable == false) then {

			eastRoles pushBack "distractor";
			westRoles pushBack "distractor";
			
		};
		publicVariable "eastRoles";
		publicVariable "westRoles";
		p1TaskIcon = "x";
		p2TaskIcon = "x";
		p3TaskIcon = "x";
		p4TaskIcon = "x";
		p5TaskIcon = "x";
		p6TaskIcon = "x";
		p7TaskIcon = "x";
		p8TaskIcon = "x";
		publicVariable "p1TaskIcon";
		publicVariable "p2TaskIcon";
		publicVariable "p3TaskIcon";
		publicVariable "p4TaskIcon";
		publicVariable "p5TaskIcon";
		publicVariable "p6TaskIcon";
		publicVariable "p7TaskIcon";
		publicVariable "p8TaskIcon";
