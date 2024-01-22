//Game:

		gameTime = 300; 										// Round time in seconds
		outOfMapKillTime = 10;									// Seconds when players out of map are killed

// Watchtower

//		watchtowerAvailable = true;								// If watchtower is available
		watchtowerInitiate = 15;								// Seconds until watchtower is available after gamestart
		watchtowerHackingTime = 5;								// Seconds to hack watchtower
		watchtowerMarkingTime = 15;								// Seconds the enemies are marked
		watchtowerCooldown = 20;								// Seconds until watchtower is available again

// Roles

	// Tech

//		techAvailable = true;									// If tech is available
		techActionTime = 10;									// Seconds to initiate the ability
		techMarkingTime = 3;									// Seconds the enemies are marked (x2 wegen script)
		techCooldown = 120;										// Seconds until ability is available again

	// Medic

//		medicAvailable = true;									// If medic is available
		healingMedicSleep = 200;								//How long it takes until Medic ability is ready again
		medicHealingAreaX = 10;									//X Axis of the healing area
		medicHealingAreaY = 10;									//Y Axis of the healing area

	// Distractor	

//		distractorAvailable = true;								// If distractor is available
		hackingDistracorSleep = 200;							//How long it takes until hacking Sound ability is ready again
		shotsDistracorSleep = 200;								//How long it takes until shooting Sound ability is ready again
		shotsDistractorNumber = [6, 7, 8, 9, 10, 8, 9, 7];		//How many shots the AI shoots



		doubleWatchtowerMarkingTime = watchtowerMarkingTime + watchtowerMarkingTime;
		doubleTechMarkingTime = techMarkingTime + techMarkingTime;
		watchtowerTaskID = 0;
		taskID = 100;
		eastRoles = [];
		westRoles = [];
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