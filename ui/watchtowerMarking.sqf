textTime = watchtowerMarkingTime - 0.3;
_time = watchtowerMarkingTime - 1;

["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[ ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[   ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#8d8d8d'>" + str watchtowerMarkingTime + " SECONDS LEFT" +"</t>",0,-0.28,1,0,0,788] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  E  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  KED  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  RKED   ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.3' color='#8d8d8d'>" + "WATCHTOWER" +"</t>",0,-0.37,5,0,0,787] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ARKED O  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  MARKED ON  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[   MARKED ON   ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  S MARKED ON T  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ES MARKED ON TH  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  IES MARKED ON THE  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  MIES MARKED ON THE   ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  EMIES MARKED ON THE M  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  NEMIES MARKED ON THE MA  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ENEMIES MARKED ON THE MAP  ]"+"</t>",0,-0.35,textTime,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.7;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.3' color='#8d8d8d'>" + "WATCHTOWER" +"</t>",0,-0.37,_time,0,0,787] spawn BIS_fnc_dynamicText;
while {_time > 1} do {

	["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#8d8d8d'>" + str _time + " SECONDS LEFT" +"</t>",0,-0.28,1,0,0,788] spawn BIS_fnc_dynamicText;
	_time = _time - 1;
	sleep 1;
};
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#8d8d8d'>" + str _time + " SECOND LEFT" +"</t>",0,-0.28,0.5,0,0,788] spawn BIS_fnc_dynamicText;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.3' color='#8d8d8d'>" + "WATCHTOWER" +"</t>",0,-0.37,0.5,0,0,787] spawn BIS_fnc_dynamicText;
sleep 1;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ENEMIES MARKED ON THE MAP  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  NEMIES MARKED ON THE MA  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  EMIES MARKED ON THE M  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  MIES MARKED ON THE   ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  IES MARKED ON THE  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ES MARKED ON TH  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  S MARKED ON T  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[   MARKED ON   ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  MARKED ON  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ARKED O  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  RKED   ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  KED  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  E  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[  ]"+"</t>",0,-0.35,40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + "[]"+"</t>",0,-0.35,0.40,0,0,789] spawn BIS_fnc_dynamicText;
sleep 0.02;
["<t font ='EtelkaMonospaceProBold' align = 'center' size='0.9' color='#546b34'>" + ""+"</t>",0,-0.35,0.1,0,0,789] spawn BIS_fnc_dynamicText;