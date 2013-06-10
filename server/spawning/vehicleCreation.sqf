
//	@file Version: 1.1
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, modded by AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args: markerPos [, vehicleType]

if(!X_Server) exitWith {};

private ["_markerPos","_pos","_type","_num","_vehicleType","_vehicle"];

_markerPos = _this select 0;

if (count _this > 1) then
{
	_vehicleType = _this select 1;
	
	if (_vehicleType in civilianVehicles) then { _type = 0 };
	if (_vehicleType in lightMilitaryVehicles) then { _type = 1 };
	if (_vehicleType in mediumMilitaryVehicles) then { _type = 2 };
	if (_vehicleType in waterVehicles) then { _type = 3 };
}
else
{
	_num = floor (random 100);
	
	if (_num < 100) then { _vehicleType = civilianVehicles call BIS_fnc_selectRandom; _type = 0 };
	if (_num < 70) then { _vehicleType = lightMilitaryVehicles call BIS_fnc_selectRandom; _type = 1 };
	if (_num < 25) then { _vehicleType = mediumMilitaryVehicles call BIS_fnc_selectRandom; _type = 2 };
};

_pos = [
			_markerPos,										// Base position
			0,												// Min distance
			30, 											// Max distance
			( if (_type == 1) then { 2 } else { 5 } ),		// Safe radius
			( if (_type == 3) then { 2 } else { 0 } ),		// Water mode
			60 * (pi / 180),								// Max slope
			0,												// Shore mode
			_vehicleType									// Vehicle type
		]
		call findSafePos;

//Vehicle Initialization
_vehicle = createVehicle [_vehicleType, _pos, [], 0, "None"];
[_vehicle, 1800, 3600, 0, false, _markerPos] execVM "server\functions\vehicle.sqf";

//Clear Vehicle Inventory
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;

//Set Vehicle Attributes
_vehicle setFuel (0.50);
_vehicle setDamage (random 0.50);

// Compensation for quadbikes & pickups having their max speed halved when wheel damage is over 20%
if (_type in [0,1]) then
{
	_vehicle setHit ["wheel_1_1_steering", 0];
	_vehicle setHit ["wheel_1_2_steering", 0];
	_vehicle setHit ["wheel_2_1_steering", 0];
	_vehicle setHit ["wheel_2_2_steering", 0];
};

_vehicle setDir (random 360);

if (_type == 2) then { _vehicle setVehicleAmmo (random 1.0) };

if (_type == 3) then
{
	_vehicle setVehicleAmmo 0;
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt", [0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red", [1]];
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Green", [1]];
	_vehicle lockTurret [[0,1], true];
};

_vehicle disableTIEquipment true;

if (_type != 3) then { [_vehicle] call randomWeapons };

//Set original posistion then add to vehicle array
_vehicle setVariable ["vehicleChecksum",call vChecksum,true];

if (_type == 3) then { _vehicle setPosASL [getpos _vehicle select 0,getpos _vehicle select 1,0] }
else { _vehicle setPosATL [getpos _vehicle select 0,getpos _vehicle select 1,1] };

_vehicle setVelocity [0,0,0];
