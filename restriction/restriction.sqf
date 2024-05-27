_time = outOfMapKillTime;
while {_time > 0} do {
    if (player inArea trigger1) then {
        _time = 10;
        titleText ["<t color='#ff0000' size='5'></t><br/>", "PLAIN", -1, true, true];
    };
    waitUntil {(player inArea trigger1) != true};
    if (player inArea trigger1) then {
        _time = 10;
        hint "";
    } else {
        if (_time == 10) then {
            titleText ["<t color='#ff0000' size='5'>Kehre zurück in den Spielbereich</t><br/>", "PLAIN", -1, true, true];
            sleep 2;
        };
        titleText [format ["<t color='#ff0000' size='5'>%1 Sekunden</t><br/>", _time], "PLAIN",  -1, true, true];
        _time = _time - 1;
        sleep 1;
        //hint str _time;
        if (_time == 0) then {
            player setDamage 1;
            titleText ["<t color='#ff0000' size='5'></t><br/>", "PLAIN", -1, true, true];
        };
    };
};