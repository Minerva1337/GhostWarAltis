//Game:

		GameTime = 600; 										// Round time in seconds
		outOfMapKillTime = 10;									// Seconds when players out of map are killed

// Watchtower

//		watchtowerAvailable = true;								// If watchtower is available
		watchtowerInitiate = 90;								// Seconds until watchtower is available after gamestart
		watchtowerHackTime = 10;								// Seconds to hack watchtower
		watchtowerMarkingTime = 30;								// Seconds the enemies are marked (x2 wegen script) 
		watchtowerCooldown = 120;								// Seconds until watchtower is available again

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



		watchtowerMarkingTime = watchtowerMarkingTime + watchtowerMarkingTime;
		techMarkingTime = techMarkingTime + techMarkingTime;