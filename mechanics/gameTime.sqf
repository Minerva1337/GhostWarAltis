//Array wird erstellt mit exestierenden Elementen:
players = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8"] select {!isNil _x} apply {missionNamespace getVariable _x}; //Dannach sind nurnoch die Elemnte drinnen, welche exestieren (!isNil)
_num = 0;
{
	_select = Players select _num;
	_num = _num + 1;
	// hint str [_select];	//Gibt Aus welche Elemente exestieren und im Moment angeschuat werden (Debugging)
	sleep 0.25;
} forEach Players;

//Spieler werden nach Seite sortiert:
teamWest = [];		//neues Array mit allen exestierenden Blufor spielern
teamEast = [];		//neues Array mit allen exestierenden Opfor spielern
_num2 = 0;
{
	select2 = players select _num2;
	//hint str select2;		//Debugging

	if (side select2 == west) then {
		teamWest pushBack select2;
	} else {
		teamEast pushBack select2;
	};
	_num2 = _num2 + 1;
} forEach players;

/*
sleep 1;
[hint str teamWest] remoteExec ["hint", 0];		//Debugging
sleep 0.5;
[hint str teamEast] remoteExec ["hint", 0];	//Debugging
sleep 0.5;
"Players has been sorted!" remoteExec ["hint", 0];
sleep 1;
*/

nul = execVM "mechanics\gameWinning.sqf";
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  GhostWar  ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.4' color='#8d8d8d'>" + "- Negades -"+"</t>",0,0.35,3,0,0,701] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0];
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
if (hasInterface) then {

	player switchMove "";

};
{player switchMove ""} remoteExec ["call", -2];
if (watchtowerAvailable) then {
	
	uplinkInit = execVM "uplink\uplink.sqf";

};
while {gameTime > 0} do {

	switch (gameTime) do {

		case 300: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 5 minutes left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 60: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 1 minute left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 30: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 30 seconds left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 10: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 10 seconds left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 5: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 5 seconds left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 4: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 4 seconds left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 3: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 3 seconds left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 2: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 2 seconds left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		case 1: {{["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ 1 second left ]"+"</t>",0,0.28,10,0,0,700] spawn BIS_fnc_dynamicText;} remoteExec ["call", 0]};
		default {};

	};
	gameTime = gameTime - 1;
	sleep 1;

};
{titleText ["<t color='#00000a' shadow='0' size='4' font='EtelkaNarrowMediumPro' valign='middle'>Time is up! <br/>Nobody has won the round! <br/><br/>Rematch will be played!</t><br/>", "WHITE OUT", nil, true, true];} remoteExec ["call", 0]; 
sleep 10;
{titleText ["<t color='#00000a' size='5'></t><br/>", "PLAIN", 0, true, true];} remoteExec ["call", 2];
"trolly1" serverCommand "#mission GhostWar.Altis custom";