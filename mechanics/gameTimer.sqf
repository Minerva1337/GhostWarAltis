/*
- Liste von allen Spielern	DONE
- Checken ob jeder Spieler anwesend ist -> Wenn Ja, dann weiter, wenn nein, dann mit objNull ersetzen - DONE
- Checken welcher Spieler auf welcher Seite		DONE
- zwei neue Arrays mit sortierten Spielern (Nach Seite)	DONE
- Im Loop checken ob alle Spieler in sortieren Array Tod, dann ENDE
*/

terminate execVM "mechanics\gameInit.sqf";		//soll Start script beenden (sicherheit)
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

//waitUntil { _int1 == 4; };
sleep 1;
"3" remoteExec ["hintSilent", 0, true];
sleep 1;
"2" remoteExec ["hintSilent", 0, true];
sleep 1;
"1" remoteExec ["hintSilent", 0, true];
sleep 1;

"Go!" remoteExec ["hint", 0, true];
[player, ""] remoteExec ["switchMove", 0, true];
taskInit = execVM "watchtower\task.sqf";
sleep 3;
"" remoteExec ["hintSilent", 0, true];
sleep 1;

//Chekcen ob Spieler Medikit in Inventar hat, wenn ja -> Spieler bekommt Medic Trait:

{ if (("Medikit" in (vestItems player + uniformItems player + backpackItems player + assignedItems player))) then {
	hint "Medic has been assigend!";
	
	player setUnitTrait ["Medic", true];
	};
} remoteExec ["call", 0, true];
sleep 1;
hintSilent "";



_GameTime = 597; //Runden Zeit
_true = true;
while {_GameTime > 0} do {

	//Zeitanzeige:
	if (_GameTime == 300) then {
		["5 Minutes remaining!"] remoteExec ["hint", 0, true];
		sleep 5;
		[""] remoteExec ["hintSilent", 0, true];
	};

	if (_GameTime == 120) then {
		["2 Minutes remaining!"] remoteExec ["hint", 0, true];
		sleep 5;
		[""] remoteExec ["hintSilent", 0, true];
	};

	if (_GameTime == 30) then {
		["30 Seconds remaining!"] remoteExec ["hint", 0, true];
		sleep 5;
		[""] remoteExec ["hintSilent", 0, true];
	};

	if (_GameTime == 10) then {
		["10 Seconds remaining!"] remoteExec ["hint", 0, true];
		sleep 5;
		[""] remoteExec ["hintSilent", 0, true];
	};

_GameTime = _GameTime - 1;
sleep 1;
};
