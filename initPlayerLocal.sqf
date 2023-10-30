params[ "_unit" ];

_unit removeAllEventHandlers "HandleDamage";

//Only damage from last applied handleDamage EH is taken into consideration by the engine
//Apply a new EH so as we can override the damage applied
_unit addEventHandler [ "HandleDamage", {
    private[ "_damage" ];
    params [ "_unit" ];
    
    //If we are not incapacitated
    if ( lifeState _unit != "INCAPACITATED" ) then {
        //Get revives handle damage
        _damage = _this call bis_fnc_reviveEhHandleDamage;
    } else {
        //if we are incapacitated
        _damage = 0;
    };

    _damage
    
}];