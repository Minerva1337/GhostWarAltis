_title = "Mark all enemies";
waitUntil {(techAvailable == true) && (((lifeState player) isEqualTo "HEALTHY" or (lifeState player) isEqualTo "INJURED");) && (towerFree)};

player addAction
[
	"_title",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	50,
	false,
	"",
	""
];