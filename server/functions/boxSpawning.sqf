//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_pos","_markerName","_marker","_hint","_safePos","_boxes", "_nerfBoxes", "_currBox", "_boxInstance", "_oldMagName", "_magName"];

_counter = 0;

_nerfBoxes =
[
	"Box_NATO_Wps_F",
	"Box_NATO_WpsSpecial_F",
	"Box_NATO_Support_F",
	"Box_East_Wps_F",
	"Box_East_WpsSpecial_F",
	"Box_East_Support_F",
	"Box_IND_Wps_F",
	"Box_IND_WpsSpecial_F",
	"Box_IND_Support_F"
];

for "_i" from 1 to (call nbVehicleMarkers) step 25 do
{
	if (_i > call nbVehicleMarkers) then {
		_i = call nbVehicleMarkers;
	};
	
	_pos = getMarkerPos format ["Spawn_%1", _i];
    _currBox = _nerfBoxes call BIS_fnc_selectRandom;
    _safePos = [_pos, 10, 50, 1, 0, 60 * (pi / 180), 0, _currBox] call findSafePos;
	_boxInstance = createVehicle [_currBox, _safePos,[], 30, "NONE"];
	
	_boxInstance addEventHandler ["handledamage", {false}];
	
	if (_currBox in ["Box_NATO_Support_F", "Box_East_Support_F", "Box_IND_Support_F"]) then
	{
		_boxInstance addMagazineCargoGlobal ["Laserbatteries", 1];
		_boxInstance addItemCargoGlobal ["Medikit", 1];
		_boxInstance addItemCargoGlobal ["Toolkit", 1];
	};
	
	if (_currBox in ["Box_NATO_WpsSpecial_F", "Box_East_WpsSpecial_F", "Box_IND_WpsSpecial_F"]) then
	{
		// Add couple extra mags
		switch (_currBox) do
		{
			case "Box_NATO_WpsSpecial_F":	{ _boxInstance addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 5] };
			default							{ _boxInstance addMagazineCargoGlobal ["20Rnd_762x51_Mag", 5] };
		};
		
		// Remove snipers
		[_boxInstance, "srifle_LRR_F", ""] call fn_replaceWeapons;
		[_boxInstance, "srifle_GM6_F", ""] call fn_replaceWeapons;
		[_boxInstance, "7Rnd_408_Mag", ""] call fn_replaceMagazines;
		[_boxInstance, "5Rnd_127x108_Mag", ""] call fn_replaceMagazines;
		
		// Replace the SDAR's shitty 5.56mm 20Rnd UW mags by normal 5.56mm 30Rnd STANAG mags (inflicts twice more damage)
		[_boxInstance, "20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag"] call fn_replaceMagazines;
	};
	
	// Replace tracer mags by ball mags for more stealth	
	{
		_magName = _x call getBallMagazine;
		
		if (_magName != _x) then
		{
			[_boxInstance, _x, _magName] call fn_replaceMagazines;
		};		
	} forEach ((getMagazineCargo _boxInstance) select 0);
	
    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];