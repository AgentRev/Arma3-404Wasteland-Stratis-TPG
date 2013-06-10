//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_pos","_markerName","_marker","_hint","_safePos","_boxes", "_nerfBoxes", "_currBox", "_boxInstance"];

_counter = 0;

_nerfBoxes = ["Box_East_Support_F","Box_East_Wps_F","Box_East_WpsSpecial_F","Box_NATO_Support_F","Box_NATO_Wps_F","Box_NATO_WpsSpecial_F"];

for "_i" from 1 to (call nbVehicleMarkers) step 25 do
{
	if (_i > call nbVehicleMarkers) then {
		_i = call nbVehicleMarkers;
	};
	
	_pos = getMarkerPos format ["Spawn_%1", _i];
    _currBox = _nerfBoxes call BIS_fnc_selectRandom;
    _safePos = [_pos, 25, 50, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
	_boxInstance = createVehicle [_currBox, _safePos,[], 30, "NONE"];
	
	_boxInstance addEventHandler ["hit", {(_this select 0) setDamage 0;}];
	_boxInstance addEventHandler ["dammaged", {(_this select 0) setDamage 0;}];
	
	if (_currBox in ["Box_East_WpsSpecial_F","Box_NATO_WpsSpecial_F"]) then
	{
		// Add couple extra mags
		switch (_currBox) do 
		{
			case ("Box_East_WpsSpecial_F"): {
				_boxInstance addMagazineCargoGlobal ["20Rnd_762x51_Mag", 5];
			};
			case ("Box_NATO_WpsSpecial_F"): {
				_boxInstance addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 5];
			};
		};
		
		// Replace the SDAR's shitty 5.56mm 20Rnd UW mags by normal 5.56mm 30Rnd STANAG mags (inflicts twice more damage)
		[_boxInstance, "20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag"] call fn_replaceMagazines;
	};
	
	// Temporary fix for Bug #9218
	[_boxInstance, "30Rnd_65x39_case_mag", "30Rnd_556x45_Stanag"] call fn_replaceMagazines;							// TRG-2x
	[_boxInstance, "30Rnd_65x39_case_mag_Tracer", "30Rnd_556x45_Stanag"] call fn_replaceMagazines;					// TRG-2x
	
	// Replace full tracer mags by full ball mags for more stealth
	[_boxInstance, "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag"] call fn_replaceMagazines;				// TRG-2x
	[_boxInstance, "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag"] call fn_replaceMagazines;			// MX
	[_boxInstance, "30Rnd_65x39_caseless_green_mag_Tracer", "30Rnd_65x39_caseless_green"] call fn_replaceMagazines;	// Katiba
	
	// Replace full tracer belts by "4 ball 1 tracer" belts for more stealth	
	[_boxInstance, "100Rnd_65x39_caseless_mag_Tracer", "100Rnd_65x39_caseless_mag"] call fn_replaceMagazines;		// MX
	[_boxInstance, "200Rnd_65x39_cased_Box_Tracer", "200Rnd_65x39_cased_Box"] call fn_replaceMagazines;				// Mk200
	
    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];