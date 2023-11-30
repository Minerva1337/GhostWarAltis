player addAction [
	"Mark all enemies",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_countdown = 5; // gameConfig.sqf
		removeAllActions player;
		eastTechActionActive = true;
		publicVariable "eastTechActionActive";

		while {_countdown > 0} do {
			
			systemChat str _countdown;
			watchtowerAvailable = missionNamespace getVariable "watchtowerAvailable";
			eastTechActionActive = missionNamespace getVariable "eastTechActionActive";

			if ((watchtowerAvailable == false) or (westTechActionActive == true)) exitWith {
				
				systemChat "Tech-Action cancelled"
				eastTechCooldown = true;
				publicVariable "eastTechCooldown";
				
			};

			_countdown = _countdown -1;
			sleep 1;
		
		};
		
		if (true) exitWith {
			
			techMarkingWest = execVM "watchtower\marking\techMarkingWest.sqf";
			systemChat "Tech-Action succesful"

		};

	},
	nil, 		// arguments
	1.5, 		// priority
	false, 		// show Window
	false, 		// hideOnUse
	"", 		// shortcut
	"true", 	// _target, _this, _originalTarget
	50, 		// radius
	true, 		// unconscious
	"",
	""];