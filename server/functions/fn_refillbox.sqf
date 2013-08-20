//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [ OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

private ["_box", "_boxType", "_box", "_boxItems", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

// Clear prexisting cargo first
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

switch (_boxType) do
{
    case "mission_Side_USLaunchers": // Used in the airwreck side mission
	{
    	// Item type, Item, # of items, # of magazines per weapon
		_boxItems =
		[
			["wep", "launch_NLAW_F", 2, 2],
			["wep", "launch_RPG32_F", 2, 2],
			["wep", "launch_Titan_F", 2, 2],
			["mag", "ClaymoreDirectionalMine_Remote_Mag", 3],
			["mag", "DemoCharge_Remote_Mag", 3]
		];
    };
    case "mission_Side_USSpecial": // Used in the airwreck side mission
	{
    	// Item type, Item, # of items, # of magazines per weapon
		_boxItems =
		[
			["itm", "NVGoggles", 5],
			["wep", "Binocular", 5],
			["itm", "Medikit", 4],
			["itm", "Toolkit", 2],
			["wep", "arifle_MXM_F", 2, 5],
			["wep", "srifle_EBR_F", 2, 5],
			["wep", "arifle_MX_SW_F", 2, 4],
			["wep", "LMG_Mk200_F", 2, 4],
			["wep", "LMG_Zafir_F", 1, 4],
			["wep", "hgun_ACPC2_F", 5, 3],
			["mag", "30Rnd_65x39_caseless_mag", 10],
			["mag", "30Rnd_556x45_Stanag", 10],
			["mag", "30Rnd_65x39_caseless_green", 10],
			["mag", "16Rnd_9x21_Mag", 10]
		];
    };
};

// Add items
{
	switch (_x select 0) do
	{
		case "wep":
		{
			_box addWeaponCargoGlobal [_x select 1, _x select 2];
			
			if (count _x > 3 && {_x select 3 > 0}) then
			{
				_mag = ((getArray (configFile >> "Cfgweapons" >> (_x select 1) >> "magazines")) select 0) call getBallMagazine;
				_box addMagazineCargoGlobal [_mag, (_x select 2) * (_x select 3)];
			};
		};
		case "mag":
		{
			_box addMagazineCargoGlobal [_x select 1, _x select 2];
		};
		case "itm":
		{
			_box addItemCargoGlobal [_x select 1, _x select 2];
		};
	};
} forEach _boxItems;
