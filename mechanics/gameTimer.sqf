//Array wird erstellt mit exestierenden Elementen:
Players = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8"] select {!isNil _x} apply {missionNamespace getVariable _x}; //Dannach sind nurnoch die Elemnte drinnen, welche exestieren (!isNil)
_num = 0;
{
	_select = Players select _num;
	_num = _num + 1;
	hint str [_select];	//Gibt Aus welche Elemente exestieren und im Moment angeschuat werden (Debugging)
	sleep 0.25;
} forEach Players;

//Spieler werden nach Seite sortiert:
teamWest = [];		//neues Array mit allen exestierenden Blufor spielern
teamEast = [];		//neues Array mit allen exestierenden Opfor spielern
_num2 = 0;
{
	select2 = Players select _num2;
	//hint str select2;		//Debugging

	if (side select2 == west) then {
		teamWest pushBack select2;
	} else {
		teamEast pushBack select2;
	};
	_num2 = _num2 + 1;
} forEach Players;

sleep 1;
[hint str teamWest] remoteExec ["hint", 0];		//Debugging
sleep 0.5;
[hint str teamEast] remoteExec ["hint", 0];	//Debugging
sleep 0.5;
"Players has been sorted!" remoteExec ["hint", 0];
sleep 1;

nul = execVM "mechanics\gameWinning.sqf";		//dasscript zum Spielbeenden wird ausgeführt

{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  GhostWar  ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.4' color='#8d8d8d'>" + "- Negades -"+"</t>",0,0.35,3,0,0,788] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 3;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.4' color='#8d8d8d'>" + "- created by MinervaArts -"+"</t>",0,0.35,2,0,0,788] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 3;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  hostWa  ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 0.02;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ostW  ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 0.02;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  st  ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 0.02;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[    ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 0.02;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 0.02;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 0.02;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 0.02;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 3 ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 1;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 2 ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 1;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 1 ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 1;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ GO ]"+"</t>",0,0.28,1,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];

{player switchMove "";} remoteExec ["call", 0, true];
taskID = 10;
taskInit = [[], "watchtower\watchtower.sqf"] remoteExec ["execVM", 2];

_GameTime = 600; //Runden Zeit
_true = true;
while {_GameTime > 0} do {

	//Zeitanzeige:
	if (_GameTime == 300) then {

		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  5 MINUTES REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];
		
	};

	if (_GameTime == 120) then {
		
		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  2 MINUTES REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];

	};

	if (_GameTime == 84) then {

		["draw"] remoteExec ["playSound", 0, true];

	};

	if (_GameTime == 60) then {

		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  1 MINUTE REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];

	};

	if (_GameTime == 30) then {
		
		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  30 SECONDS REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];

	};

	if (_GameTime == 10) then {
		
		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  10 SECONDS REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];

	};

	if (_GameTime == 3) then {
		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  3 SECONDS REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];
		sleep 1;
		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  2 SECONDS REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];
		sleep 1;
		[["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  1 SECONDS REMAINING  ]"+"</t>",0,0.28,5,0,0,700] spawn BIS_fnc_dynamicText] remoteExec ["call", 0, true];;
		sleep 1;
	};


_GameTime = _GameTime - 1;
sleep 1;
};

//Unentschieden:
waitUntil { _GameTime == 0; };
{titleText ["<t color='#00000a' shadow='0' size='4' font='EtelkaNarrowMediumPro' valign='middle'>Time is up! <br/>Nobody has won the round! <br/><br/>Rematch will be played!</t><br/>", "WHITE OUT", nil, true, true];} remoteExec ["call", 0]; 
sleep 10;
{titleText ["<t color='#00000a' size='5'></t><br/>", "PLAIN", 0, true, true];} remoteExec ["call", 2];
"trolly1" serverCommand "#mission GhostWar.Altis custom";
