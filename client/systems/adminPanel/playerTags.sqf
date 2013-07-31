//	@file Version: 1.0
//	@file Name: playerTags.sqf
//	@file Author: Battleguns
//	@file Created: 20/11/2012 05:19
//	@file Args:

_uid = getPlayerUID player;
if (_uid call isAdmin) then {
	if (isnil "pm") then {pm = 0;}; if (pm == 0) then {pm = 1; hint "Player Markers ON";} else {pm = 0; hint "Player Markers OFF";};
	setGroupIconsVisible [true, true];
	while {pm == 1} do
	{
		{
			if (isPlayer _x) then
			{
				private ["_groupIcon", "_iconColor"];
				
				switch (side _x) do
				{
					case west: { _groupIcon = "b_inf"; _iconColor = [0, 0, 1, 1] };
					case east: { _groupIcon = "o_inf"; _iconColor = [1, 0, 0, 1] };
					default { _groupIcon = "n_inf"; _iconColor = [1, 1, 0, 1] };
				};
				
				clearGroupIcons group _x;
				group _x addGroupIcon [_groupIcon];
				group _x setGroupIconParams [_iconColor, format ["%1 (%2m)", name _x, round (_x distance player)], 1, true];
			};
		} forEach playableUnits;
		sleep 0.5;
	};
	{ clearGroupIcons group _x } forEach playableUnits;
};
