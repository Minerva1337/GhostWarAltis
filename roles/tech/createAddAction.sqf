player addAction [
	"Mark all enemies",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		if (side player == west) then {hint "West"; techAvailable = false} else {hint "East"};
	},
	nil, // arguments
	1.5, // priority
	false, // show Window
	false, // hideOnUse
	"", // shortcut
	"true", // _target, _this, _originalTarget
	50, // radius
	true, // unconscious
	"",
	""];