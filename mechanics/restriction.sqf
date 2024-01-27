_ctr = true;
_time = outOfMapKillTime;
while {_ctr} do {

	if ((player inArea trigger1) or (loadedIn == false)) then {
			
			{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + ""+"</t>",0,0.3,1,0,0,101] spawn BIS_fnc_dynamicText};
			{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + ""+"</t>",0,0.36,1,0,0,102] spawn BIS_fnc_dynamicText};
			_ctr = false;
		
	} else {
		
		switch (_time) do {

			case outOfMapKillTime: {
				
				["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ Get back in the map! ]"+"</t>",0,0.3,outOfMapKillTime,0,0,101] spawn BIS_fnc_dynamicText;
				["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + "[ " + str outOfMapKillTime + " seconds until you will be killed. ]"+"</t>",0,0.36,5,0,0,102] spawn BIS_fnc_dynamicText;
				
			};			
			case 10: {["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + "[ 10 seconds until you will be killed. ]"+"</t>",0,0.36,5,0,0,102] spawn BIS_fnc_dynamicText};
			case 5: {["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + "[ 5 seconds until you will be killed. ]"+"</t>",0,0.36,5,0,0,102] spawn BIS_fnc_dynamicText};
			case 4: {["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + "[ 4 seconds until you will be killed. ]"+"</t>",0,0.36,5,0,0,102] spawn BIS_fnc_dynamicText};
			case 3: {["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + "[ 3 seconds until you will be killed. ]"+"</t>",0,0.36,5,0,0,102] spawn BIS_fnc_dynamicText};
			case 2: {["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + "[ 2 seconds until you will be killed. ]"+"</t>",0,0.36,5,0,0,102] spawn BIS_fnc_dynamicText};
			case 1: {["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#b04a09'>" + "[ 1 seconds until you will be killed. ]"+"</t>",0,0.36,5,0,0,102] spawn BIS_fnc_dynamicText};
			case 0: {player setDamage 1};

			};
			_time = _time -1;
			sleep 1;

	};

};