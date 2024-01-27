waitUntil {(count (call BIS_fnc_listPlayers)) > 0};
_ctr = true;
while {_ctr} do {

	_allPlayers = call BIS_fnc_listPlayers;
	_inArea = allPlayers inAreaArray "gameStart";	
	_count1 = count _allPlayers;
	_count2 = count _inArea;
	[str _count2] remoteExec ["hint", 0]; // debug
	if (_count1 == _count2) exitWith {_ctr = false};
	sleep 0.5;

};
execVM "mechanics\showGamePoints.sqf";
players = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8"] select {!isNil _x} apply {missionNamespace getVariable _x}; //Dannach sind nurnoch die Elemnte drinnen, welche exestieren (!isNil)
_num1 = 0;
{

	_select = players select _num1;
	_num1 = _num1 + 1;
	sleep 0.25;

} forEach players;
teamWest = [];
teamEast = [];
_num2 = 0;
{

	_select2 = players select _num2;
	if (side _select2 == west) then {

		teamWest pushBack _select2;

	} else {

		teamEast pushBack _select2;

	};
	_num2 = _num2 + 1;

} forEach players;
execVM "mechanics\gameWinning.sqf";
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  GhostWar  ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.4' color='#8d8d8d'>" + "- Military Base -"+"</t>",0,0.35,3,0,0,701] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 2;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.4' color='#8d8d8d'>" + "- created by MinervaArts -"+"</t>",0,0.35,2,0,0,701] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 2;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.4' color='#8d8d8d'>" + ""+"</t>",0,0.35,2,0,0,701] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 3 ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 1;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 2 ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 1;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 1 ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
sleep 1;
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ GO ]"+"</t>",0,0.28,1,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.3' color='#8d8d8d'>" + "GhostWar Version " + str versionNumber +"</t>",-1.01,1.35,9999,0,0,103] spawn BIS_fnc_dynamicText;
if (hasInterface) then {

	player switchMove "";

};
{player switchMove ""} remoteExec ["call", -2];
if (watchtowerAvailable) then {
	
	watchtowerInit = execVM "watchtower\watchtower.sqf";

};
while {gameTime > 0} do {

	switch (gameTime) do {

		case 300: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 5 minutes remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 60: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 1 minute remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 30: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 30 seconds remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 10: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 10 seconds remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 5: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 5 seconds remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 4: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 4 seconds remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 3: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 3 seconds remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 2: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 2 seconds remaining ]"+"</t>",0,-0.25,5,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 1: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.7' color='#b07609'>" + "[ 1 second remaining ]"+"</t>",0,-0.25,1,0,0,100] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		default {};

	};
	gameTime = gameTime - 1;
	sleep 1;

};
{titleText ["<t color='#00000a' shadow='0' size='4' font='EtelkaNarrowMediumPro' valign='middle'>Time is up! <br/>Nobody has won the round! <br/><br/>Rematch will be played!</t><br/>", "WHITE OUT", nil, true, true];} remoteExec ["call", 0]; 
sleep 10;
{titleText ["<t color='#00000a' size='5'></t><br/>", "PLAIN", 0, true, true];} remoteExec ["call", 2];
"trolly1" serverCommand "#mission GhostWar.Altis custom";