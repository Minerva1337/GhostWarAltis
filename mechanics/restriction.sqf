_ctr = true;
_time = outOfMapKillTime;
while {_ctr} do {

	if ((player inArea trigger1) or (loadedIn == false)) then {

		if (loadedIn == true) then {
			
			systemChat "Lucky one!";
			_ctr = false;

		} else {

			_ctr = false;

		};
		
	} else {
		
		switch (_time) do {

			case outOfMapKillTime: {SystemChat "Get back into the area!"; SystemChat (str outOfMapKillTime + " Seconds until you will be killed.")};
			case 10: {SystemChat "10 Seconds until you will be killed."};
			case 5: {SystemChat "5 Seconds until you will be killed."};
			case 4: {SystemChat "4 Seconds until you will be killed."};
			case 3: {SystemChat "3 Seconds until you will be killed."};
			case 2: {SystemChat "2 Seconds until you will be killed."};
			case 1: {SystemChat "1 Second until you will be killed."};
			case 0: {player setDamage 1};

		};
		_time = _time -1;
		sleep 1;

	};

};