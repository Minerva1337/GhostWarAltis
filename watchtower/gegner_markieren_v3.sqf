if (side player == west) then {
    /*
    hintSilent "Spieler ist auf der blufor seite!"; //Debugging
    sleep 1;
    hintSilent "";
    sleep 1;
    */
    [east, "Base"] sideChat "Achtung! Deine Position ist auf der Karte sichtbar!";

    for "_i" from 1 to 30 do {        //schleife läuft 30x durch mit 1,1 Sekunden verzögerung -> 33 Sekunden markieren 
        sleep 0.1;
        _playerPosition1 = getPosATL p1;
        _playerPosition2 = getPosATL p2;
        _playerPosition3 = getPosATL p3;
        _playerPosition4 = getPosATL p4;

        _check1 = alive p1 && {!(p1 getVariable ["ACE_isUnconscious", false])}; // Chekct ob Spieler lebt und nicht in ACE bewusstlos ist
        _check2 = alive p2 && {!(p2 getVariable ["ACE_isUnconscious", false])};
        _check3 = alive p3 && {!(p3 getVariable ["ACE_isUnconscious", false])};
        _check4 = alive p4 && {!(p4 getVariable ["ACE_isUnconscious", false])};

        if(_check1 == true) then {
            _playerMarker1 = createMarker ["marker1", _playerPosition1];
            _playerMarker1 setMarkerType "hd_objective"; //Marker typ
        };

        if(_check2 == true) then {
            _playerMarker2 = createMarker ["marker2", _playerPosition2];
            _playerMarker2 setMarkerType "hd_objective"; //Marker typ
        };

        if(_check3 == true) then {
            _playerMarker3 = createMarker ["marker3", _playerPosition3];
            _playerMarker3 setMarkerType "hd_objective"; //Marker typ
        };

        if(_check4 == true) then {
            _playerMarker4 = createMarker ["marker4", _playerPosition4];
            _playerMarker4 setMarkerType "hd_objective"; //Marker typ
        };

        sleep 1; //Wie lange Marker auf Karte bleibt

        deleteMarker "marker1";
        deleteMarker "marker2";
        deleteMarker "marker3";
        deleteMarker "marker4";
    }

} else { 
    /*
    hintSilent "Spieler ist auf der Opfor seite!";
    sleep 1;
    hintSilent "";
    sleep 1;
    */
    [west, "Base"] sideChat "Achtung! Deine Position ist auf der Karte sichtbar!";
    for "_i" from 1 to 30 do {        //schleife läuft 30x durch mit 1,1 Sekunden verzögerung -> 33 Sekunden markieren
        sleep 0.1;
        _playerPosition5 = getPosATL p5; 
        _playerPosition6 = getPosATL p6;
        _playerPosition7 = getPosATL p7;
        _playerPosition8 = getPosATL p8;

        _check5 = alive p5 && {!(p5 getVariable ["ACE_isUnconscious", false])}; // Chekct ob Spieler lebt und nicht in ACE bewusstlos ist
        _check6 = alive p6 && {!(p6 getVariable ["ACE_isUnconscious", false])};
        _check7 = alive p7 && {!(p7 getVariable ["ACE_isUnconscious", false])};
        _check8 = alive p8 && {!(p8 getVariable ["ACE_isUnconscious", false])};


        if(_check5 == true) then {
            _playerMarker5 = createMarker ["marker5", _playerPosition5];
            _playerMarker5 setMarkerType "hd_objective"; //Marker typ
        };

        if(_check6 == true) then {
            _playerMarker6 = createMarker ["marker6", _playerPosition6];
            _playerMarker6 setMarkerType "hd_objective"; //Marker typ
        };

        if(_check7 == true) then {
            _playerMarker7 = createMarker ["marker7", _playerPosition7];
            _playerMarker7 setMarkerType "hd_objective"; //Marker typ
        };

        if(_check8 == true) then {
            _playerMarker8 = createMarker ["marker8", _playerPosition8];
            _playerMarker8 setMarkerType "hd_objective"; //Marker typ
        };

        sleep 1; //Wie lange Marker auf Karte bleibt

        deleteMarker "marker5";
        deleteMarker "marker6";
        deleteMarker "marker7";
        deleteMarker "marker8";
    }

};